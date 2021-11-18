#!/bin/bash
awslocal s3 mb s3://terraform-$APPLICATION_ENV --region us-east-1
awslocal s3 mb s3://deploy-$APPLICATION_ENV --region us-east-1

# awslocal dynamodb create-table --cli-input-json file:///localstack_files/dynamodb/Placements.json
