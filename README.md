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
 - use local enpoints for terraform backend to point to localstack.