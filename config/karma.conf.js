basePath = '../';

files = [
  JASMINE,
  JASMINE_ADAPTER,
  'utils.js',
  'test/unit/**/*.js'
];

autoWatch = true;

browsers = [];

junitReporter = {
  outputFile: 'test_out/unit.xml',
  suite: 'unit'
};
