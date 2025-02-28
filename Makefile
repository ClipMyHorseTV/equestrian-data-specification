.PHONY: help generate

help:
	@echo "Available commands:"
	@echo "  help                            - Show this help message"
	@echo "  async-docs               - Generate HTML documentation from the AsyncAPI document"
	@echo "  openapi-docs           - Generate HTML documentation from the OpenAPI document"
	@echo "  async-studio             - Start the AsyncAPI Studio"
	@echo "  async-validate         - Validate the AsyncAPI document"
	@echo "  openapi-validate     - Validate the OpenAPI document"

async-docs:
	npx asyncapi generate fromTemplate asyncapi/equestrian-data-api-asyncapi.yaml @asyncapi/html-template -o ./asyncapi/docs

openapi-docs:
	npx openapi-generator-cli generate -i openapi/equestrian-data-api-openapi.yaml -g html -o ./openapi/docs

async-studio:
	npx asyncapi start studio -f asyncapi/equestrian-data-api-asyncapi.yaml

async-validate:
	npx asyncapi validate asyncapi/equestrian-data-api-asyncapi.yaml

openapi-validate:
	npx openapi-generator-cli validate -i openapi/equestrian-data-api-openapi.yaml