#!/bin/bash
echo "The output wihtout blank lines: "
grep "\S" ./quotes.txt
echo "The output without duplicate lines: "
sort -u < quotes.txt | grep "\S"
