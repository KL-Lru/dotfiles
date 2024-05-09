#!/bin/bash

SOURCE_FILES=`find ~/.rc/ -type f -name "*.sh" -not -path ""${BASH_SOURCE:-0}""`

for file in ${SOURCE_FILES};
do
  source ${file}
done
