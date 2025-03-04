.PHONY: help generate

help:
	@echo "Available commands:"
	@echo "  help                            - Show this help message"
	@echo "  async-docs               - Generate HTML documentation from the AsyncAPI document"
	@echo "  openapi-docs           - Generate HTML documentation from the OpenAPI document"
	@echo "  async-studio             - Start the AsyncAPI Studio"
	@echo "  async-validate         - Validate the AsyncAPI document"
	@echo "  openapi-validate     - Validate the OpenAPI document"

openapi-docs:
	docker run --rm -v ${PWD}:/local openapitools/openapi-generator-cli generate -i /local/openapi/equestrian-data-api-openapi.yaml -g html -o /local/openapi/docs

async-studio:
	docker run -it -p 8000:80 asyncapi/studio

async-validate:
	docker run --rm -v ${PWD}:/local asyncapi/cli validate /local/asyncapi/equestrian-data-api-asyncapi.yaml

openapi-validate:
	docker run --rm -v ${PWD}:/local openapitools/openapi-generator-cli validate -i /local/openapi/equestrian-data-api-openapi.yaml

openapi-generate-php:
	docker run --rm -v ${PWD}:/local openapitools/openapi-generator-cli generate -i /local/openapi/equestrian-data-api-openapi.yaml -g php -o /local/openapi/php-client