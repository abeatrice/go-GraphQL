#!/bin/bash

echo "building main.go"
GOOS=linux go build main.go

echo "zipping main.zip from main"
zip main.zip main

echo "done"
