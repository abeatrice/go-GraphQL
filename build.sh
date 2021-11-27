#!/bin/bash

echo "building main.go"
GOOS=linux go build main.go

echo "done"
