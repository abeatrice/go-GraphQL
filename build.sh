#!/bin/bash

echo "building main.go"
GOOS=linux go build main.go

echo "zipping function.zip from main"
zip function.zip main

echo "done"
