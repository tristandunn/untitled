module.exports = {
  "reporter"       : ["html", "text-summary"],
  "temp-dir"       : "./tmp/nyc",
  "skip-full"      : true,
  "report-dir"     : "./coverage/javascripts",
  "check-coverage" : true,

  "lines"      : 100,
  "branches"   : 100,
  "functions"  : 100,
  "statements" : 100
};
