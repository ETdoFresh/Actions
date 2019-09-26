#!/bin/sh -l

mkdir Build
echo "<html><head>\
<title>Dummy Github Action Build</title>\
</head><body>"`date`"</body></html>" > Build/index.html
echo This is a test site! > Build/README.md
mkdir Build/data
date > Build/data/date.txt
