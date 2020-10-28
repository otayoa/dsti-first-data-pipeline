#!/bin/bash

set -e

function cleanup {
  echo "cleaning data path..."
  rm -rf data
  echo "deleting input.txt and output.txt..."
  rm input.txt
  rm output.txt
}


function execute {
  mkdir data
  echo "downloading data..."
  python3 function.py
  touch input.txt
  for i in $(ls data)
  do
    cat "./data/$i" >> input.txt
  done

  # instead of cat input.txt | wc -l > output.txt
  < input.txt  wc -l > output.txt
}

cleanup
execute
