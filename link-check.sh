#!/bin/bash

RESULTS="$(npx link-checker ./dist/ --http-status-ignore=429 --json)"
DID_ERROR="$(echo $RESULTS | jq '.stats.errors != []' | echo)"

echo "$DID_ERROR"

if [ "${DID_ERROR}" = "true" ];
then
  echo "Link Check Error: $RESULTS"
  exit 1
else
  echo "No link errors"
  exit 0
fi