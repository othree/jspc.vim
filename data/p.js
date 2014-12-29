/*jslint node: true, stupid: true, forin: true */
var yaml    = require('js-yaml');
var fs      = require('fs');


// Get document, or throw exception on error
try {
  var file = process.argv[2];
  var ri = 0;
  var i = 0;
  var j = 0;
  var yml = {};
  var group = '';
  var value = null;

  var methods = '';
  var candidates = null;

  var tmp = '';
  var dot = ',';
  var nodot = '';
  var ending = '';

  var rules = [];
  var sublists = [];
  var sublist = '';

  var cache = {};

  var remember = function (group, attr) {
    if (!cache[attr]) {
      cache[attr] = [];
    }
    cache[attr].push(group);
  };

  yml = yaml.safeLoad(fs.readFileSync(file + '.yml', 'utf8'));

  for (group in yml) {
    if (typeof yml[group] == "string") {
      remember(group, yml[group]);
    }
  }
  for (group in yml) {
    if (typeof yml[group] == "object") {
      methods = group;
      candidates = yml[group];

      if (/^\$/.test(methods)) {
        methods = cache[methods];
      } else {
        methods = [methods];
      }

      sublists = candidates.filter(function (item) {
        return /^\$/.test(item);
      });
      candidates = candidates.filter(function (item) {
        return !/^\$/.test(item);
      });

      for (sublist in sublists) {
        candidates = candidates.concat(yml[sublists[sublist]]);
      }
      
      rules.push({
        methods: methods,
        candidates: candidates
      });
    }
  }

  console.log('function! jspc#' + file + '#getlist(method)');
  console.log('  let list = []');
  console.log('  let method = matchstr(a:method, \'\\.\\zs\\k\\+\')');
  console.log('');

  for (ri in rules) {
    rule = rules[ri];
    methods = rule.methods;
    candidates = rule.candidates;
    m = []

    for (i in methods) {
      m.push('a:method == "' + methods[i] + '"');
    }
    for (i in methods) {
      m.push('method == "' + methods[i] + '"');
    }
    console.log('  if ' + m.join(' || '));
    console.log('    let list = [');
    for (j in candidates) {
      ending = (j == candidates.length - 1) ? nodot : dot ;
      console.log('     \\ "' + candidates[j] + '"' + ending);
    }
    console.log('     \\ ]');
    console.log('  endif');

    console.log('');
  }

  console.log('  return list');
  console.log('endfunction');

} catch (e) {
  console.log(e);
}

