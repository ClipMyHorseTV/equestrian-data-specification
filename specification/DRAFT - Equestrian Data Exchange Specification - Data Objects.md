
# Equestrian Data Exchange - Data Model Specification

**This document is a working draft and is subject to change!**

---

**Author(s)** [Florian Krämer](mailto:f.kraemer@clipmyhorse.tv), [Tim Donandt](mailto:t.donandt@clipmyhorse.tv), [Jan Krüger](mailto:j.krueger@clipmyhorse.tv)  
**Status**: Proposed Standard  
**Last Updated**: 2025-02-07

---

[Abstract](#abstract)

[1\. Introduction](#1.-introduction)

[2\. Conventions and Terminology](#2.-conventions-and-terminology)

[2.1 Terminology](#2.1-terminology)

[2.2. Standards and Formats](#2.2.-standards-and-formats)

[2.3 Links](#2.3-links)

[2.4 Dates and DateTimes](#2.4-dates-and-datetimes)

[2.5 Data Internationalization and Localization](#2.5-data-internationalization-and-localization)

[2.6 Schema Standards](#2.6-schema-standards)

[2.7 Entity Conventions](#2.7-entity-conventions)

[2.8 Geo-Location](#2.8-geo-location)

[2.9 Definition of “Required”](#2.9-definition-of-“required”)

[2.10  Units](#2.10-units)

[3\. Data Model](#3.-data-model)

[3.1 Horses](#3.1-horses)

[3.1.1 Horse Gender](#3.1.1-horse-gender)

[3.1.2 Previous Horse Name](#3.1.2-previous-horse-name)

[3.2 Persons](#3.2-persons)

[3.2.1 Person Gender](#3.2.1-person-gender)

[3.3 Equestrian Events](#3.3-equestrian-events)

[3.4 Competitions](#3.4-competitions)

[3.4.1 Normative Discipline Enum](#3.4.1-normative-discipline-enum)

[3.5 Results](#3.5-results)

[3.5.1 Score Data](#3.5.1-score-data)

[Constraints](#constraints)

[3.6 Teams](#3.6-teams)

[3.7 Sport Associations](#3.7-sport-associations)

[3.8 Breeding Associations](#3.8-breeding-associations)

[3.9 ID](#3.9-id)

[3.10 Horse Color](#3.10-horse-color)

[3.10.1 Standardized Horse Colors](#3.10.1-standardized-horse-colors)

[3.10.2 Standardized Horse Color Pattern](#3.10.2-standardized-horse-color-pattern)

[3.11 Company](#3.11-company)

[3.12 Event Organizer](#3.12-event-organizer)

[3.13 Address](#3.13-address)

[3.14 Contact](#3.14-contact)

[3.14.1 Phone Number](#3.14.1-phone-number)

[PhoneNumberType Enum](#phonenumbertype-enum)

[3.14.2 External Platform](#3.14.2-external-platform)

[Constraints](#constraints-1)

[Enum](#enum)

[3.15 Identifier](#3.15-identifier)

[3.15.1 Data Provider Enum](#3.15.1-data-provider-enum)

[3.16 Country Object](#3.16-country-object)

[Constraints](#constraints-2)

[3.17 Geo Location Object](#3.17-geo-location-object)

[3.18 Localized Text](#3.18-localized-text)

[3.19 Currency](#3.19-currency)

[4\. Data Exchange Format](#4.-data-exchange-format)

[4.1 JSON](#4.1-json)

[5 References](#5-references)

[5.1 Normative References](#5.1-normative-references)

[5.2 Informative References](#5.2-informative-references)

[5\. Appendix](#5.-appendix)

[Identifiers](#identifiers)

# Abstract {#abstract}

This document defines a standardized data exchange structure for equestrian-related data entities, including Horses, Equestrians, Equestrian Events, Competitions, Results and further elements specified within this document. The objective is to facilitate interoperability between different systems handling equestrian data.

# 1\. Introduction {#1.-introduction}

This specification describes the data entities required to represent equestrian information and provides a structured data exchange model to support interoperability across various applications. The Equestrian Data Model Specification (EDEMS) is designed to be comprehensive yet flexible, supporting both basic data information and more complex structures.

This document uses the [IETF RFC 2119](https://www.ietf.org/rfc/rfc2119.txt) to describe constraints.

1\. **MUST**   This word, or the terms "REQUIRED" or "SHALL", mean that the  
definition is an absolute requirement of the specification.

2\. **MUST NOT**   This phrase, or the phrase "SHALL NOT", mean that the  
definition is an absolute prohibition of the specification.

3\. **SHOULD**   This word, or the adjective "RECOMMENDED", mean that there  
may exist valid reasons in particular circumstances to ignore a  
particular item, but the full implications must be understood and  
carefully weighed before choosing a different course.

4\. **SHOULD NOT**   This phrase, or the phrase "NOT RECOMMENDED" mean that  
there may exist valid reasons in particular circumstances when the  
particular behavior is acceptable or even useful, but the full  
implications should be understood and the case carefully weighed  
before implementing any behavior described with this label.

# 2\. Conventions and Terminology {#2.-conventions-and-terminology}

## 2.1 Terminology {#2.1-terminology}

* **Horse**: An individual equine involved in equestrian sports.
* **Equestrian**: A person (e.g., rider, trainer) associated with a horse.
* **Event**: A sport-related gathering that includes competitions.
* **Competition**: A specific contest within an event.
* **Result**: The outcome of a competition, containing scores.

## 2.2. Standards and Formats {#2.2.-standards-and-formats}

This specification adopts widely used and recognized international standards for data format consistency, internationalization, and interoperability. Specific standards for various types of data are described below.

## 2.3 Links {#2.3-links}

To standardize and ensure compatibility with other systems, all links within the EDES specification will follow the IETF Uniform Resource Identifier (URI) standards.

* **Requirement**: All URLs/URIs within the EDES data **MUST** follow the [RFC 3986](https://datatracker.ietf.org/doc/html/rfc3986) URI format. This applies to any web-based identifiers, links, and related resource references within the specification.
* **Purpose**: This ensures consistent interpretation of link formats and ease of integration with other internet and web standards.

## 2.4 Dates and DateTimes {#2.4-dates-and-datetimes}

Dates and DateTimes within the EDES specification will adhere to the [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format, which provides structured formats supporting time zones.

Compliance with [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) ensures that dates and times are consistently interpretable across regions and systems, avoiding ambiguities related to local time and daylight saving adjustments.

* **Date Format**: Dates will follow the `YYYY-MM-DD` format.
* **DateTime Format**: DateTimes will use the `YYYY-MM-DDTHH:MM:SSZ` format and **MUST include time zones** as part of the value.
* **Time Zones**: Each DateTime value **MUST** include a timezone to ensure consistency in interpreting times across systems. Time zones should be represented using the offset notation (e.g., `+00:00` or `-05:00`).

## 2.5 Data Internationalization and Localization {#2.5-data-internationalization-and-localization}

This specification leverages standards to support internationalization, localization, and data structure integrity:

* **Country Codes**: **MUST** follow [ISO 3166-1 alpha-3](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-3) codes for country identifiers.
* **Language Tags**: **MUST** use [IETF Language Tags](https://en.wikipedia.org/wiki/IETF_language_tag), as defined in BCP 47, to represent language codes, enabling global language coverage.
* **Language Codes**: **MUST** use [ISO 639](https://en.wikipedia.org/wiki/ISO_639) for consistent language code definitions.
* **IOC Country Codes**: **MUST** use [the official IOC Codes](https://en.wikipedia.org/wiki/List_of_IOC_country_codes).

## 2.6 Schema Standards {#2.6-schema-standards}

* **JSON Schema Compliance**: Data definitions using JSON **MUST** use [JSON Schema](https://json-schema.org/) to provide structure and validation, ensuring that all entities conform to expected data types and value formats.

## 2.7 Entity Conventions {#2.7-entity-conventions}

* All fields **MUST** follow the [Camel Case notation](https://en.wikipedia.org/wiki/Camel_case), by starting with an upper case letter, concatenating single words without a space and starting each word with a capital letter.
* All entities that **MUST** define their identity by providing at least one “Identifier” value object.
* Fields that represent an Enum from the standard but can have an alternative **MUST** be prefixed with “Normative” e.g. “NormativeColor” and the free-form field is specified without the prefix.

## 2.8 Geo-Location {#2.8-geo-location}

* Geolocations **MUST** be described following [ISO 6709](https://en.wikipedia.org/wiki/ISO_6709).
* Geolocations **MUST** be represented as an object of two values (longitude and latitude)

## 2.9 Definition of “Required” {#2.9-definition-of-“required”}

* Required means that the field **MUST** be present in the entity.
* The value of the field **MUST NOT** be empty.

## 2.10  Units {#2.10-units}

* Any unit for measuring **MUST** use [metric units](https://en.wikipedia.org/wiki/Metric_system) or [SI units](https://en.wikipedia.org/wiki/International_System_of_Units).
  * It is the responsibility of the provider and consumer to convert the units into any other unit.

The rationale behind this is that those units are widespread and an international standard. The specification needs to support only one set of units by following the metric system and SI units. “Stone”, “Ounce” and “Pound” are ambiguous because very different definitions of them exist. Therefore it is the responsibility of the producer and consumer of the data to convert from their “local” standard to the “global” standards units.

# 3\. Data Model {#3.-data-model}

This section provides the structural model for each core entity of the standard, detailing required and optional fields and describing data types and constraints.

## 3.1 Horses {#3.1-horses}

Defines the structure of the Horse entity, representing individual horses, independently from their age, gender or any other characteristics.

| Field Name            | Type   | Constraints                                                                                                                               | Description                                                                                |
|:----------------------|:-------|:------------------------------------------------------------------------------------------------------------------------------------------|:-------------------------------------------------------------------------------------------|
| Identifier            | array  | Array of objects of type [“Identifier” 3.15](#3.15-identifier) Required                                                                   |                                                                                            |
| AdditionalIdentifiers | array  | Must contain only objects of type [“Identifier” 3.15](#3.15-identifier) If present it must contain at least one entry                     |                                                                                            |
| CurrentName           | string | Max length: 255 Required                                                                                                                  | The actual name of the horse that is used by its owners.                                   |
| PreviousNames         | array  | An array of “Previous Horse Name” entities as described in [3.1.2](#3.1.2-previous-horse-name). The strings must have a max length of 255 | An array of previous horse names used for that horse.                                      |
| BreedName             | string | Max length: 255 If present, not empty string                                                                                              | The name the horse was assigned when it was born by its breeder. It always stays the same. |
| Breeder               | object | An entity of type “Breeder”                                                                                                               |                                                                                            |
| BreederAssociation    | object | An entity of type “BreederAssociation”                                                                                                    |                                                                                            |
| Owners                | array  | Must contain only entities of type “Owner”                                                                                                | A list of entities describing who owns the horse.                                          |
| YearOfBirth           | string | Format: YYYY                                                                                                                              |                                                                                            |
| DayOfBirth            | string | Format: YYYY-MM-DD, [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601)                                                                    | If not empty this will override the “YearOfBirth” field.                                   |
| Gender                | string | Enum, Horse Gender 3.1.1                                                                                                                  |                                                                                            |
| NormativeColor        | string | Enum, Horse Color x.x.x                                                                                                                   | One of the colors specified in this RFC by the Horse Color enum.                           |
| Color                 | string | Max length: 64                                                                                                                            | Free form color.                                                                           |
| LastUpdatedOn         | string | Format: 2007-03-01T13:00:00Z, [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601)                                                          | When the entity was updated the last time                                                  |

### 3.1.1 Horse Gender {#3.1.1-horse-gender}

This enum provides a comprehensive list of horse gender classifications relevant to equestrian activities and data management.

* **Stallion**: Mature, intact male horse, often involved in breeding.
* **Gelding**: Male horse that has been castrated, commonly used for riding.
* **Mare**: Adult female horse, used for riding or breeding.

```java
enum HorseGender {
    STALLION,
    GELDING,
    MARE
}
```

### 3.1.2 Previous Horse Name {#3.1.2-previous-horse-name}

Horses can have a history of name changes, this object describes the previous names of a horse.

| Field Name | Type   | Constraints                                                                     | Description                                                   |
|:-----------|:-------|:--------------------------------------------------------------------------------|:--------------------------------------------------------------|
| Name       | string | Required                                                                        | The historical name of the horse that was used by its owners. |
| FromDate   | date   | Format: YYYY-MM-DD, [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) Optional |                                                               |
| ToDate     | date   | Format: YYYY-MM-DD, [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) Optional |                                                               |

## 3.2 Persons {#3.2-persons}

Defines the structure of the Equestrian entity, covering people associated with horses.

| Field Name     | Type   | Constraints                                                                      | Description                                              |
|:---------------|:-------|:---------------------------------------------------------------------------------|:---------------------------------------------------------|
| Identifiers    | array  | Must contain only objects of type [“Identifier” 3.15](#3.15-identifier) Required |                                                          |
| Title          | string |                                                                                  |                                                          |
| FirstName      | string | Max length: 128                                                                  |                                                          |
| MiddleName     | string | Max length: 128                                                                  |                                                          |
| LastName       | string | Max length: 128                                                                  |                                                          |
| CountryOfBirth | object | Object of type [“Country” 3.16](#3.16-country-object)                            |                                                          |
| YearOfBirth    | string | Format: YYYY                                                                     |                                                          |
| DayOfBirth     | string | Format: YYYY-MM-DD, [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601)           | If not empty this will override the “YearOfBirth” field. |
| Gender         | string | Enum, [Person Gender 3.2.1](#3.2.1-person-gender)                                |                                                          |
| LastUpdatedOn  | string | Format: 2007-03-01T13:00:00Z, [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) | When the entity was updated the last time                |

* **Fields**:
  * **AssociationId**: Optional, references a specific equestrian association.
  * RiderData:
    * hasValidRiderPass
    * hasThis
    * hasThat

### 3.2.1 Person Gender {#3.2.1-person-gender}

This enum provides a list of human gender classifications.

* **Male**: A biological male
* **Female**: A biological female
* **Diverse**: Any other self-classification

```java
enum HorseGender {
    MALE,
    FEMALE,
    DIVERSE
}
```

## 3.3 Equestrian Events {#3.3-equestrian-events}

Defines the structure for equestrian involving horses.

| Field Name           | Type   | Constraints                                                                                                           | Description                               |
|:---------------------|:-------|:----------------------------------------------------------------------------------------------------------------------|:------------------------------------------|
| Identifiers          | array  | Must contain only objects of type [“Identifier” 3.15](#3.15-identifier) Required                                      |                                           |
| OrganizerIdentifiers | array  | An array of event organizer identifier objects. Must have at least one object. Required                               |                                           |
| Name                 | string | Max length: 255 Required                                                                                              | Name or title of the event.               |
| Description          | array  | A collection of “[Description Localized Text](#3.18-localized-text)” Locale **MUST** be unique within the collection. |                                           |
| StartDate            | string | Format: YYYY-MM-DD, [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) Required                                       |                                           |
| EndDate              | string | Format: YYYY-MM-DD, [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) Required                                       |                                           |
| Country              | object | Object of type [“Country” 3.16](#3.16-country-object)                                                                 | Country in which event takes place        |
| LastUpdatedOn        | string | Format: 2007-03-01T13:00:00Z, [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601)                                      | When the entity was updated the last time |

## 3.4 Competitions {#3.4-competitions}

Defines the structure for competitions that are part of horse sport events.

| Field Name          | Type   | Constraints                                                                                                                                                                  | Description                                                                                                                        |
|:--------------------|:-------|:-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------|:-----------------------------------------------------------------------------------------------------------------------------------|
| Identifiers         | array  | Must contain only objects of type [“Identifier” 3.15](#3.15-identifier) Required                                                                                             |                                                                                                                                    |
| EventIdentifiers    | array  | An array of event identity objects. Must have at least one object. Required                                                                                                  |                                                                                                                                    |
| Name                | string | Max length: 255 Required                                                                                                                                                     | Name or title of the competition.                                                                                                  |
| Description         | array  | A collection of “[Description Localized Text](#3.18-localized-text)” Locale **MUST** be unique within the collection.                                                        |                                                                                                                                    |
| SponsorTitle        | string | Max length: 255                                                                                                                                                              |                                                                                                                                    |
| StartDate           | string | Format: YYYY-MM-DD, [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) Required                                                                                              |                                                                                                                                    |
| EndDate             | string | Format: YYYY-MM-DD, [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601)                                                                                                       |                                                                                                                                    |
| StartTime           | string | Format: YYYY-MM-DDThh:mm:ssZ, [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601)                                                                                             |                                                                                                                                    |
| EndTime             | string | Format: YYYY-MM-DDThh:mm:ssZ, [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601)                                                                                             |                                                                                                                                    |
| NormativeDiscipline | enum   | A standardized discipline identifier.                                                                                                                                        | TODO: Define the enums **SHOULD** always be filled and only be empty if discipline can’t be mapped to any standardized discipline. |
| Discipline          | string | Max length: 128 **CAN** always be filled along the normative discipline.  **SHOULD NOT** be used as primary field to describe the discipline \- use the normative discipline |                                                                                                                                    |
| LastUpdatedOn       | string | Format: YYYY-MM-DDThh:mm:ssZ, [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601)                                                                                             | When the entity was updated the last time                                                                                          |

### 3.4.1 Normative Discipline Enum {#3.4.1-normative-discipline-enum}

```java

```

## 3.5 Results {#3.5-results}

Defines the structure for recording results of competitions.

| Field Name    | Type   | Constraints                                                             | Description                                                          |
|:--------------|:-------|:------------------------------------------------------------------------|:---------------------------------------------------------------------|
| ResultId      | array  | Array of object of type [“Identifier” 3.15](#3.15-identifier) Required  | Unique identifier for the result entry.                              |
| CompetitionId | array  | Object of type [“Identifier” 3.15](#3.15-identifier) Required           | Foreign key referencing the Competition.                             |
| HorseIds      | array  | Array of objects of type [“Identifier” 3.15](#3.15-identifier) Required | Foreign key referencing the Horse entity.                            |
| EquestrianIds | array  | Array of objects of type [“Identifier” 3.15](#3.15-identifier) Required | Foreign key referencing the Equestrian entity (typically the rider). |
| Score         | object | Object of type “Score Data” Required                                    |                                                                      |

## 3.5.1 Score Data {#3.5.1-score-data}

Score data refers to the data that is used to calculate a final score and rank. It MUST contain all the data that is required to do the necessary calculations.

### Constraints {#constraints}

Custom Types **MUST** be prefixed with the custom type name, e.g. “RacingScoreData”

| Field Name           | Type    | Constraints                                                                                                                                                           | Description                                                               |
|----------------------|:--------|:----------------------------------------------------------------------------------------------------------------------------------------------------------------------|:--------------------------------------------------------------------------|
| ResultId             | array   | Array of object of type [“Identifier” 3.15](#3.15-identifier) Required                                                                                                |                                                                           |
| ScoreSchema          | string  | A valid [URI](https://en.wikipedia.org/wiki/Uniform_Resource_Identifier) to a Schema describes the additional fields of the specific type of a score object. Required | This is used to allow clients to validate and parse custom score objects. |
| ScoreType            | enum    | Required                                                                                                                                                              |                                                                           |
| Score                | object  | One of the specific score data type objects, defined by the ScoreType. Required                                                                                       |                                                                           |
| **JumpingScoreData** |         |                                                                                                                                                                       |                                                                           |
| Score                | float   | Required                                                                                                                                                              | Score or points awarded.                                                  |
| Rank                 | integer | Required                                                                                                                                                              | Rank in the competition.                                                  |
| PenaltyPoints        | float   | Required                                                                                                                                                              | Optional penalties.                                                       |
| **OtherScoreData**   |         |                                                                                                                                                                       |                                                                           |
|                      |         |                                                                                                                                                                       |                                                                           |
|                      |         |                                                                                                                                                                       |                                                                           |
|                      |         |                                                                                                                                                                       |                                                                           |
|                      |         |                                                                                                                                                                       |                                                                           |
|                      |         |                                                                                                                                                                       |                                                                           |
|                      |         |                                                                                                                                                                       |                                                                           |

## 3.6 Teams {#3.6-teams}

Defines the structure of a Team entity, representing groups participating in events.

| Field Name    | Type   | Constraints                                                   | Description                                                    |
|:--------------|:-------|:--------------------------------------------------------------|:---------------------------------------------------------------|
| TeamId        | object | Object of type [“Identifier” 3.15](#3.15-identifier) Required | Unique identifier for the team.                                |
| Name          | string | Max length: 255                                               | Name of the team.                                              |
| Country       | object | Object of type [“Country” 3.16](#3.16-country-object)         |                                                                |
| TeamMembers   | array  | Array of objects of type [Persons](#3.2-persons)              | Array of Equestrian IDs, representing individuals on the team. |
| Horses        | array  | Array of objects of type [Horses](#3.1-horses)                |                                                                |
| AssociationId | object | Object of type [“Identifier” 3.15](#3.15-identifier)          | Foreign key, references the governing association of the team. |

## 3.7 Sport Associations {#3.7-sport-associations}

Defines the structure of the Association entity, representing official organizations in equestrian sports.

| Field Name          | Type   | Constraints                                                             | Description                                          |
|:--------------------|:-------|:------------------------------------------------------------------------|:-----------------------------------------------------|
| AssociationId       | array  | Array of objects of type [“Identifier” 3.15](#3.15-identifier) Required | Unique identifier for the association.               |
| Name                | string | Required                                                                | Name of the association.                             |
| AssociationType     | enum   | Required                                                                | National, International, Club                        |
| Country             | object | Object of type [“Country” 3.16](#3.16-country-object)                   | Describes the association’s primary country          |
| ParentAssociationId | object |                                                                         | References a higher-level association, if applicable |

## 3.8 Breeding Associations {#3.8-breeding-associations}

Defines the structure of Breeding Associations, managing horse breeds and breed certifications.

| Field Name            | Type   | Constraints                                                             | Description                                 |
|:----------------------|:-------|:------------------------------------------------------------------------|:--------------------------------------------|
| BreedingAssociationId | array  | Array of objects of type [“Identifier” 3.15](#3.15-identifier) Required |                                             |
| Name                  | string | Required                                                                | Name of the breeding association            |
| Country               | object | Object of type [“Country” 3.16](#3.16-country-object)                   | Representing the country of the association |

## 3.9 ID {#3.9-id}

Defines a flexible, composite ID that consists of a unique **value**, its **type**, and the **owning entity**. This structure allows IDs to accommodate a variety of data types and formats.

**Note**: This ID structure supports flexible identity definitions for each entity and enables validation based on the Type field (e.g., UUID validation, regex pattern matching).

### Enum

* **String**: Alphanumeric or plain string format.
* **UUID**: Universally unique identifier.
* **Integer:** Integer type representation of the value.

```
enum IDType {
    STRING,
    UUID,
    INTEGER
}
```

| Field Name | Type   | Constraints         | Description                                                                        |
|:-----------|:-------|:--------------------|:-----------------------------------------------------------------------------------|
| Value      | string | The value of the id | String, the ID’s actual value. The format and requirements vary based on the Type. |
| Type       | enum   | The type of the id  | Enum, specifying the format of the ID                                              |
| Entity     | string | The type of the id  | Reference to the entity that owns this ID (e.g., Horse, Breeding Association).     |

## 3.10 Horse Color {#3.10-horse-color}

Defines a color entity for Horses, represented by an enum and a customizable color list.

**Usage**: The **PrimaryColor** and **ColorPattern** enums provide structured, standardized color categories, while the **ColorList** offers flexibility to define more specific shades or variations.

| Field Name   | Type  | Constraints | Description                                                                                                                                                                               |
|:-------------|:------|:------------|:------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| ColorId      | id    | required    | Unique identifier for the color.                                                                                                                                                          |
| PrimaryColor | enum  | required    | Enum specifying a base color (e.g., Black, Bay, Chestnut, Gray).                                                                                                                          |
| ColorPattern | enum  |             | Enum, specifying color patterns (e.g., Solid, Roan, Tobiano, Sabino).                                                                                                                     |
| ColorList    | array |             | Array of strings, allowing multiple colors or shades to be associated with a horse if a color is non-standard or has special characteristics (e.g., “Blue Roan”, “Palomino with Flecks”). |

### 3.10.1 Standardized Horse Colors {#3.10.1-standardized-horse-colors}

The `HorseColor` enum defines standard horse colors, covering primary and patterned colors commonly recognized across equestrian disciplines.

```
enum HorseColor {  
    // Solid colors  
    BAY,               // Dark brown or reddish with black points (mane, tail, legs)  
    BLACK,             // True black coat without any brown or lighter hair  
    BROWN,             // Dark brown coat, may have lighter brown areas  
    CHESTNUT,          // Reddish-brown coat with mane and tail matching the body color  
    GREY,              // Grey coat that often lightens with age, can vary from dark to light grey  
    WHITE,             // All white coat with pink skin underneath, true white horses are rare  
    PALOMINO,          // Golden coat with white or flaxen mane and tail  
    BUCKSKIN,          // Tan or gold coat with black mane, tail, and lower legs

    // Rare and breed-specific colors  
    CREMELLO,          // Cream-colored coat with pink skin and blue eyes, often very light in color  
    PERLINO,           // Slightly darker cream coat, often with slightly darker mane and tail  
    SMOKY\_BLACK,       // Black or dark brown coat with a cream gene dilution, giving a smoky hue  
    SMOKY\_CREAM,       // Double cream dilution on black base coat, pale with pink skin and blue eyes  
    SILVER\_DAPPLE,     // Dark coat with silver or white mane and tail, often with dappling  
    CHAMPAGNE,         // Golden coat with mottled skin, often with a metallic sheen and lighter mane
    
    // Appaloosa-specific patterns  
    LEOPARD,           // White coat with dark, round spots over the entire body  
    BLANKET,           // White area (blanket) over the hips with dark spots within it  
    SNOWFLAKE,         // Dark coat with small white spots over body, especially on the back  
    FEWSPOT,           // Almost completely white, sometimes with minimal spots  
}
```

### 3.10.2 Standardized Horse Color Pattern {#3.10.2-standardized-horse-color-pattern}

The `HorseColorPattern` enum defines standard horse colors, covering primary and patterned colors commonly recognized across equestrian disciplines.

```
enum HorseColorPattern {  
    ROAN,              // Base color mixed with white hairs throughout, can be Blue Roan, Red Roan, etc.  
    DUN,               // Light brown or golden coat with darker dorsal stripe and leg barring  
    GRULLO,            // Greyish-blue or mouse-colored coat with darker mane, tail, and dorsal stripe  
    PINTO,             // Large patches of two colors, often white with black or brown  
    TOBIANO,           // White pattern that crosses the horse’s back, usually in large patches  
    OVERO,             // Irregular patches of color, typically not crossing the back  
    SABINO,            // White pattern with roaning edges, often on legs, belly, and face  
}
```

## 3.11 Company {#3.11-company}

The **Company** entity represents a business organization, such as sponsors, breeding associations, or any company related to equestrian events.

**Usage**: The **Company** entity provides essential details about businesses and their contacts, allowing clear identification of involved organizations.

| Field Name            | Type   | Constraints                                           | Description                                                                           |
|:----------------------|:-------|:------------------------------------------------------|:--------------------------------------------------------------------------------------|
| companyId             |        | required                                              |                                                                                       |
| name                  | string | required                                              |                                                                                       |
| type                  | enum   | required                                              |                                                                                       |
| address               | object | Address object                                        |                                                                                       |
| contacts              | array  | Array of Contact Objects                              |                                                                                       |
| registrationNumber    | string |                                                       | A unique identifier for the company, such as a commercial or tax registration number. |
| countryOfRegistration | string | Object of type [“Country” 3.16](#3.16-country-object) |                                                                                       |

## 3.12 Event Organizer {#3.12-event-organizer}

The **Event Organizer** entity represents an organization or individual responsible for managing and conducting equestrian events.

* **Fields**:
  * **OrganizerId**: Composite ID as specified in section 3.9.

The **Event Organizer** entity allows for the identification of organizers responsible for specific events, accommodating both individual and company organizers.

| Field Name         | Type   | Constraints                                                  | Description                                   |
|:-------------------|:-------|:-------------------------------------------------------------|:----------------------------------------------|
| EventOrganizerId   | array  | Array of type [“Identifier” 3.15](#3.15-identifier) Required |                                               |
| Name               | string | Required                                                     | Name of the event organizer                   |
| EventOrganizerType | string | Required                                                     | Enum (e.g., Individual, Company)              |
| CompanyId          | array  | Object of type [“Identifier” 3.15](#3.15-identifier)         | References a [company entity](#3.11-company)  |
| AddressId          | array  | Object of type [“Identifier” 3.15](#3.15-identifier)         | References an [address entity](#3.13-address) |
| ContactId          | array  | Object of type [“Identifier” 3.15](#3.15-identifier)         | References a [contact entity](#3.14-contact)  |

## 3.13 Address {#3.13-address}

The **Address** entity standardizes location information for all entities with physical locations, supporting international formats.

| Field Name      | Type   | Constraints                                                                            | Description             |
|:----------------|:-------|:---------------------------------------------------------------------------------------|:------------------------|
| addressId       | array  | Array of type [“Identifier” 3.15](#3.15-identifier) Required                           |                         |
| city            | string | Max length 192                                                                         |                         |
| addressLine     | string | Max length 192                                                                         |                         |
| addressLine2    | string | Max length 192                                                                         |                         |
| stateOrProvince | string | Max length 192                                                                         |                         |
| postalCode      | string | Max length 32                                                                          |                         |
| country         | string | Object of type [“Country” 3.16](#3.16-country-object)                                  |                         |
| geolocation     | object | Gelocation object as described in [3.17 Geolocation Object](#3.17-geo-location-object) | Longitude and latitude. |

## 3.14 Contact {#3.14-contact}

The **Contact** entity provides consistent and structured details for reaching individuals or organizations, supporting multiple contact methods and preferences.

| Field Name             | Type  | Constraints                                                                     | Description                 |
|:-----------------------|:------|:--------------------------------------------------------------------------------|:----------------------------|
| ContactId              | array | Array of type [“Identifier” 3.15](#3.15-identifier) Required                    |                             |
| PhoneNumbers           | array | Array of phone number objects [3.14.1 Phone Number](#3.14.1-phone-number)       |                             |
| Emails                 | array | Array of email strings                                                          | Should this be one or many? |
| PreferredContactMethod | enum  |                                                                                 |                             |
| Platforms              | array | Array of Platform objects [3.14.2 External Platform](#3.14.2-external-platform) |                             |

### 3.14.1 Phone Number {#3.14.1-phone-number}

Describes a phone number.

#### PhoneNumberType Enum {#phonenumbertype-enum}

```java
enum PhoneNumberType {
    HOME,
    WORK,
    OTHER,    FAX
}
```

| Field Name      | Type                  | Constraints                                                      | Description                                             |
|:--------------- |:--------------------- |:---------------------------------------------------------------- |:------------------------------------------------------- |
| Number          | string                | Must contain only valid characters “0-9”, “.”, “+”, “-” Required | The phone number, valid characters “0-9”, “.”, “+”, “-” |
| PhoneNumberType | enum, PhoneNumberType | If none is provided “OTHER” is assumed. MOBILE, LAND, FAX        | The type of the phone number.                           |
| Category        | enum                  | HOME, WORK, OTHER                                                |                                                         |

### 3.14.2 External Platform {#3.14.2-external-platform}

Describes an external platform.

#### Constraints {#constraints-1}

* The value **MUST** be only the profile identifier for the platform.
  * Exception: If type OTHER is chosen, then an absolute URI **MUST** be provided as value.

#### Enum {#enum}

```java
enum PlatformType {
    XING,
    LINKEDIN,
    FACEBOOK,
    X,
    INSTAGRAM,
    TIKTOK,
    SNAPCHAT,
    TINDER,
    OTHER
}
```

| Field Name  | Type   | Constraints                 | Description                                                                                                                          |
|:----------- |:------ |:--------------------------- |:------------------------------------------------------------------------------------------------------------------------------------ |
| platform    | enum   | String required             | The platform, e.g. Xing, Linkedin, X, Facebook, Instagram                                                                            |
| identifier  | string | Must be a PlatformType enum | The handle or identifier of the profile on the platform. If platform OTHER is chosen, an absolute URI **MUST** be provided as value. |
| description | string | Max length 255              | A description can be used to describe “OTHER”.                                                                                       |

## 3.15 Identifier {#3.15-identifier}

An identifier is a composite value object of the provider and a value of the identifier. The reason for that is that different systems use very different identifiers and transferring data from one system to another might involve cases in which more than one provider is required as well.

| Field Name | Type   | Constraints                                                       | Description                                  |
|:---------- |:------ |:----------------------------------------------------------------- |:-------------------------------------------- |
| Provider   | string | Max Length: 64 CAN be a data provider enum as specified in 3.15.1 | A string or name that identifies a provider. |
| Value      | string | Max length: 128                                                   | The actual value of the identifier.          |
| Type       | enum   | Max length: 128                                                   | Enum, Integer, UUID, custom                  |

### 3.15.1 Data Provider Enum {#3.15.1-data-provider-enum}

The data provider enum is a list of well known industry partners that **SHOULD** be used as identifiers for data coming from those providers or refer to data within their systems.

```java
enum DataProviderEnum {
    CMH,
    FEI,
    USEF,
    LONGINE,
    UELN // http://www.ueln.net/
}
```

Example:

```javascript
"identifiers": [
    {
        "provider": "UELN",
        "value": "ABCD",
        "type": "UELN"
    },
    {
        "provider": "CMH",
        "value": "482b99c8-db53-4137-86d9-1947c90befcb",
        "type": "UUID"
    }
]
```

## 3.16 Country Object {#3.16-country-object}

The country object describes a country as a set of identifiers, because different systems might use different types of identifiers.

### Constraints {#constraints-2}

A valid country object **MUST** contain at least one valid identifier.

| Field Name | Type   | Constraints                                          | Description                                                                          |
|:---------- |:------ |:---------------------------------------------------- |:------------------------------------------------------------------------------------ |
| iso3       | string | Must be a valid ISO 3177-1 alpha 2 Code Max length 2 | [ISO 3166-1 alpha-2](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2)               |
| iso2       | string | Must be a valid ISO 3177-1 alpha 3 Code Max length 3 | [ISO 3166-1 alpha-3](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-3)               |
| ioc        | string | Must be a valid IOC code Max length 3                | [List of IOC country codes](https://en.wikipedia.org/wiki/List_of_IOC_country_codes) |

## 3.17 Geo Location Object {#3.17-geo-location-object}

Describes a geo coordinate based on [ISO 6709](https://en.wikipedia.org/wiki/ISO_6709).

| Field Name | Type   | Constraints                                      | Description                                                              |
|:---------- |:------ |:------------------------------------------------ |:------------------------------------------------------------------------ |
| longitude  | string | Must be a valid ISO 6709 longitude Code Required | [ISO 6709](https://en.wikipedia.org/wiki/ISO_6709), example 35.89421911  |
| latitude   | string | Must be a valid ISO 6709 latitude Required       | [ISO 6709](https://en.wikipedia.org/wiki/ISO_6709), example 139.94637467 |

## 3.18 Localized Text {#3.18-localized-text}

This object is thought to be used when translatable text content is required. In this case the field must be described as an array of localized text objects.

| Field Name | Type   | Constraints                                                                             | Description                                                    |
|:---------- |:------ |:--------------------------------------------------------------------------------------- |:-------------------------------------------------------------- |
| Locale     | string | Format: Locale as defined in [ISO 639](https://en.wikipedia.org/wiki/ISO_639). Required | The locale in which the text content of the entity is written. |
| Text       | string | Max length: 4096 Required                                                               |                                                                |

## 3.19 Currency {#3.19-currency}

A value object that combines the currency and value.

| Field Name | Type   | Constraints                                                                                                                                                        | Description                                                                                                                                                                                                                                                   |
|:---------- |:------ |:-------------------------------------------------------------------------------------------------------------------------------------------------------------------|:------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Value      | number | Required **MUST** use the comma notation for the decimal. **MUST** use two digits after the decimal. **MUST** **NOT** use more than two digits after the decimall. | The value of the money using the decimal notation. “[International Currency Conversion](https://finance.cornell.edu/treasurer/cash-management/processinginternational/intl-currency)“ Values must always specify the complete value, “11,00” instead of “11”. |
| Currency   | string | Max length: 3 Required                                                                                                                                             | [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217)                                                                                                                                                                                                            |

# 4\. Data Exchange Format {#4.-data-exchange-format}

Defines the serialization format used for data exchange and the required schema validation to ensure data integrity.

For the first draft iteration only JSON will be supported. Future versions might support XML or binary formats as well.

## 4.1 JSON {#4.1-json}

* JSON **SHOULD** be used as a transfer format.
* If JSON is used, it **MUST** validate against the JSON Schema defined for the according version of this RFC.

# 5 References {#5-references}

## 5.1 Normative References {#5.1-normative-references}

* [ISO 3166-1 alpha 3](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-3) \- Three-letter country codes defined in ISO 3166-1, part of the ISO 3166
* [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) \- Covering the worldwide exchange and communication of date and time-related data.
* [ISO 639](https://en.wikipedia.org/wiki/ISO_639) \- Standard concerned with representation of languages and language groups.
* [ISO 6709](https://en.wikipedia.org/wiki/ISO_6709) \- Standard representation of geographic point location by coordinates
* [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) \- Defines alpha codes and numeric codes for the representation of currencies
* [IETF Language Tag](https://en.wikipedia.org/wiki/IETF_language_tag) \- An IETF BCP 47 language tag is a standardized code that is used to identify human languages on the Internet.
* [JSON Schema Specification](https://json-schema.org/)
* [List of IOC Country Codes](https://en.wikipedia.org/wiki/List_of_IOC_country_codes) \- Country Codes defined by the International Olympic Committee
* [RFC 2119](https://www.ietf.org/rfc/rfc2119.txt)

## 5.2 Informative References {#5.2-informative-references}

Additional references that provide context or further information.

# 5\. Appendix {#5.-appendix}

Includes additional details, such as extended examples or field enumeration lists.

## Identifiers {#identifiers}

* IRIs \- [https://datatracker.ietf.org/doc/html/rfc3987](https://datatracker.ietf.org/doc/html/rfc3987)
* UUID \- [https://datatracker.ietf.org/doc/html/rfc4122](https://datatracker.ietf.org/doc/html/rfc4122)
* DID \- [https://www.w3.org/TR/did-core](https://www.w3.org/TR/did-core/)