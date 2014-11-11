
files='
  javascript'

for file in $files; do
  node p.js $file > ../autoload/jspc/$file.vim
done

