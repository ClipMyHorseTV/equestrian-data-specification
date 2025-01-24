.PHONY: help generate

help:
	@echo "Available commands:"
	@echo "  help                            - Show this help message"
	@echo "  async-docs                 - Generate HTML documentation from the AsyncAPI document"

async-docs:
	npx asyncapi generate fromTemplate asyncapi/equestrian-data-api-asyncapi.yaml @asyncapi/html-template -o ./asyncapi/docs

openapi-docs:
	npx openapi-generator-cli generate -i openapi/equestrian-data-api-openapi.yaml -g html -o ./openapi/docs