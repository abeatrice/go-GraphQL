# Go GraphQL Server
An example golang GraphQL server running on lambda with api gateway, and DynamoDB for storage

## local dev

### build and run the app locally
```sh
# build and run
$ git clone
$ cd GraphQL
$ make build
$ make run

# while the app is running, create the aws resources
$ make init
$ make apply
```

### todo
 - ./build.sh build main before zip for lambda
 - set up make invoke to use events/event.json
 - use local enpoints for terraform backend to point to localstack.
 - attach AWSLambdaBasicExecutionRole to lambda
 ```
    {
        "Version": "2012-10-17",
        "Statement": [
            {
                "Effect": "Allow",
                "Action": [
                    "logs:CreateLogGroup",
                    "logs:CreateLogStream",
                    "logs:PutLogEvents"
                ],
                "Resource": "*"
            }
        ]
    }
```
