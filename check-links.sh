#!/usr/bin/env bash

ERRORS=$(grep -HEroine "\(/|href=['\"]/" $1)
CODE=$?

if [ "$CODE" -ne "0" ]; then
  exit 0
fi

for ERR in $ERRORS
do
  IFS=':'
  read -ra BITS <<< "$ERR"
  echo "::error file=/${BITS[0]},line=${BITS[1]}::$2"
done

exit 1