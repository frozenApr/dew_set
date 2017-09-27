require('shelljs/global')

var include = [
  'extend',
  'find',
  'map',
  'template',
  'random',
  'shuffle',
  'camelCase',
  'kebabCase',
  'isPlainObject',
  'result',
].join(',')

if (which('lodash')) {
  echo(include)
  exec(`lodash include="${include}" -o lodash-by-compile.js -d`)
  echo('done')
} else {
  echo('没有发现lodash命令')
}
