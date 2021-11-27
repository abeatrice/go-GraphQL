.PHONY: help
help: ## This help
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z_-]+:.*?## / {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)

null:
	help

ARGS = `arg="$(filter-out $@,$(MAKECMDGOALS))" && echo $${arg:-${1}}`

TERRAFORM := docker run -it \
		--network="host" \
		-v `pwd`:/app/ \
		-v ~/.aws:/root/.aws \
		--user $(id -u):$(id -g) \
		-w /app hashicorp/terraform:1.0.0 -chdir=terraform

.PHONY: build
build: ## Build the app
	docker-compose build

.PHONY: run
run: ## Run the app
	docker-compose up

EVENT := $(shell cat ${ARGS})

.PHONY: invoke
invoke: ## invoke the function with a payload by passing ARGS=events/event.json
	docker run --rm \
	-v `pwd`:/var/task:ro,delegated \
	lambci/lambda:go1.x main ${EVENT}

.PHONY: init
init: ## Terraform init
	$(TERRAFORM) init

.PHONY: plan
plan: ## Terraform plan
	$(TERRAFORM) plan -no-color -var-file=vars_dev.tfvars

.PHONY: apply
apply: ## Terraform apply
	$(TERRAFORM) apply -var-file=vars_dev.tfvars

.PHONY: destroy
destroy: ## Terraform destroy
	$(TERRAFORM) destroy -var-file=vars_dev.tfvars

%:    # Supresses the below 
	@:  # make: *** No rule to make target `...'.  Stop.
