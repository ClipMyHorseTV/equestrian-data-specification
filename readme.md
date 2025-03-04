# Equestrian Data Exchange Specification

## Introduction

This repository provides a standardized data exchange structure for equestrian-related data entities, including Horses, Equestrians, Equestrian Events, Competitions, Results and further elements. The objective is to facilitate interoperability between different systems handling equestrian data.

**Consider this whole repository as a draft for the time being until the specification and endpoints are finalized!**

* Equestrian Data Exchange Data Model
* Async API for the Events
* Cloud Events Specification
* Open API Endpoints for the ClipMYyHorse.TV event ingest endpoint

## Usage

This repository provides a `Makefile` that will allow you to execute the most common tasks conveniently.

### Generate AsyncAPI Documentation

Generates HTML documentation from the AsyncAPI document using the AsyncAPI generator.

```sh
make async-docs
```

- **Input**: `asyncapi/equestrian-data-api-asyncapi.yaml`
- **Output**: HTML documentation in `./asyncapi/docs`

### Generate OpenAPI Documentation

Generates HTML documentation from the OpenAPI document using the OpenAPI generator.

```sh
make openapi-docs
```

- **Input**: `openapi/equestrian-data-api-openapi.yaml`
- **Output**: HTML documentation in `./openapi/docs`

### Start AsyncAPI Studio

Starts the AsyncAPI Studio for interactive documentation viewing and editing.

```sh
make async-studio
```

- **Input**: `asyncapi/equestrian-data-api-asyncapi.yaml`

### Validate AsyncAPI Document

Validates the AsyncAPI document for correctness.

```sh
make async-validate
```

- **Input**: `asyncapi/equestrian-data-api-asyncapi.yaml`

### Validate OpenAPI Document

Validates the OpenAPI document for correctness using Docker.

```sh
make openapi-validate
```

- **Input**: `openapi/equestrian-data-api-openapi.yaml`

### Generate OpenAPI PHP Client

Generates a PHP client from the OpenAPI document using Docker.

```sh
make openapi-generate-php
```

- **Input**: `openapi/equestrian-data-api-openapi.yaml`
- **Output**: PHP client in `./openapi/php-client`

## License & Copyright

Licensed under the Apache License. See [LICENSE](LICENSE) for more information.

Copyright 2025 ClipMyHorse.TV Services & Development GmbH
