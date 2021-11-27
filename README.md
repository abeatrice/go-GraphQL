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
```

### todo
 - ./build.sh build main before zip for lambda
 - fix make invoke events/event.json creates json error
 - use local enpoints for terraform backend to point to localstack.
