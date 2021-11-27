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

# invoke the lambda function locally
$ make invoke ARGS="events/event.json"

# curl against running localstack endpoint
$ curl http://localhost:4566/restapis/<apigateway_id>/dev/_user_request_/graphql
```

### todo
 - ./build.sh build main before zip for lambda
 - fix make invoke events/event.json creates json error
 - output localstack invoke url for apigateway when running on localstack
 - use deploy bucket for lambda func zip package
 - use terraform bucket for terraform state
