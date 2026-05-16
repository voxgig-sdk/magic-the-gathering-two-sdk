# MagicTheGatheringTwo PHP SDK

The PHP SDK for the MagicTheGatheringTwo API. Provides an entity-oriented interface using PHP conventions.


## Install
```bash
composer require voxgig/magic-the-gathering-two-sdk
```


## Tutorial: your first API call

This tutorial walks through creating a client, listing entities, and
loading a specific record.

### 1. Create a client

```php
<?php
require_once 'magicthegatheringtwo_sdk.php';

$client = new MagicTheGatheringTwoSDK([
    "apikey" => getenv("MAGIC-THE-GATHERING-TWO_APIKEY"),
]);
```

### 2. List cards

```php
[$result, $err] = $client->Card(null)->list(null, null);
if ($err) { throw new \Exception($err); }

if (is_array($result)) {
    foreach ($result as $item) {
        $d = $item->data_get();
        echo $d["id"] . " " . $d["name"] . "\n";
    }
}
```

### 3. Load a card

```php
[$result, $err] = $client->Card(null)->load(["id" => "example_id"], null);
if ($err) { throw new \Exception($err); }
print_r($result);
```


## How-to guides

### Make a direct HTTP request

For endpoints not covered by entity methods:

```php
[$result, $err] = $client->direct([
    "path" => "/api/resource/{id}",
    "method" => "GET",
    "params" => ["id" => "example"],
]);
if ($err) { throw new \Exception($err); }

if ($result["ok"]) {
    echo $result["status"];  // 200
    print_r($result["data"]);  // response body
}
```

### Prepare a request without sending it

```php
[$fetchdef, $err] = $client->prepare([
    "path" => "/api/resource/{id}",
    "method" => "DELETE",
    "params" => ["id" => "example"],
]);
if ($err) { throw new \Exception($err); }

echo $fetchdef["url"];
echo $fetchdef["method"];
print_r($fetchdef["headers"]);
```

### Use test mode

Create a mock client for unit testing — no server required:

```php
$client = MagicTheGatheringTwoSDK::test(null, null);

[$result, $err] = $client->MagicTheGatheringTwo(null)->load(
    ["id" => "test01"], null
);
// $result contains mock response data
```

### Use a custom fetch function

Replace the HTTP transport with your own function:

```php
$mock_fetch = function ($url, $init) {
    return [
        [
            "status" => 200,
            "statusText" => "OK",
            "headers" => [],
            "json" => function () { return ["id" => "mock01"]; },
        ],
        null,
    ];
};

$client = new MagicTheGatheringTwoSDK([
    "base" => "http://localhost:8080",
    "system" => [
        "fetch" => $mock_fetch,
    ],
]);
```

### Run live tests

Create a `.env.local` file at the project root:

```
MAGIC-THE-GATHERING-TWO_TEST_LIVE=TRUE
MAGIC-THE-GATHERING-TWO_APIKEY=<your-key>
```

Then run:

```bash
cd php && ./vendor/bin/phpunit test/
```


## Reference

### MagicTheGatheringTwoSDK

```php
require_once 'magicthegatheringtwo_sdk.php';
$client = new MagicTheGatheringTwoSDK($options);
```

Creates a new SDK client.

| Option | Type | Description |
| --- | --- | --- |
| `apikey` | `string` | API key for authentication. |
| `base` | `string` | Base URL of the API server. |
| `prefix` | `string` | URL path prefix prepended to all requests. |
| `suffix` | `string` | URL path suffix appended to all requests. |
| `feature` | `array` | Feature activation flags. |
| `extend` | `array` | Additional Feature instances to load. |
| `system` | `array` | System overrides (e.g. custom `fetch` callable). |

### test

```php
$client = MagicTheGatheringTwoSDK::test($testopts, $sdkopts);
```

Creates a test-mode client with mock transport. Both arguments may be `null`.

### MagicTheGatheringTwoSDK methods

| Method | Signature | Description |
| --- | --- | --- |
| `options_map` | `(): array` | Deep copy of current SDK options. |
| `get_utility` | `(): Utility` | Copy of the SDK utility object. |
| `prepare` | `(array $fetchargs): array` | Build an HTTP request definition without sending. |
| `direct` | `(array $fetchargs): array` | Build and send an HTTP request. |
| `Card` | `($data): CardEntity` | Create a Card entity instance. |
| `Format` | `($data): FormatEntity` | Create a Format entity instance. |
| `Set` | `($data): SetEntity` | Create a Set entity instance. |
| `SetBooster` | `($data): SetBoosterEntity` | Create a SetBooster entity instance. |
| `Subtype` | `($data): SubtypeEntity` | Create a Subtype entity instance. |
| `Supertype` | `($data): SupertypeEntity` | Create a Supertype entity instance. |
| `Type` | `($data): TypeEntity` | Create a Type entity instance. |

### Entity interface

All entities share the same interface.

| Method | Signature | Description |
| --- | --- | --- |
| `load` | `($reqmatch, $ctrl): array` | Load a single entity by match criteria. |
| `list` | `($reqmatch, $ctrl): array` | List entities matching the criteria. |
| `create` | `($reqdata, $ctrl): array` | Create a new entity. |
| `update` | `($reqdata, $ctrl): array` | Update an existing entity. |
| `remove` | `($reqmatch, $ctrl): array` | Remove an entity. |
| `data_get` | `(): array` | Get entity data. |
| `data_set` | `($data): void` | Set entity data. |
| `match_get` | `(): array` | Get entity match criteria. |
| `match_set` | `($match): void` | Set entity match criteria. |
| `make` | `(): Entity` | Create a new instance with the same options. |
| `get_name` | `(): string` | Return the entity name. |

### Result shape

Entity operations return `[$result, $err]`. The first value is an
`array` with these keys:

| Key | Type | Description |
| --- | --- | --- |
| `ok` | `bool` | `true` if the HTTP status is 2xx. |
| `status` | `int` | HTTP status code. |
| `headers` | `array` | Response headers. |
| `data` | `mixed` | Parsed JSON response body. |

On error, `ok` is `false` and `$err` contains the error value.

### Entities

#### Card

| Field | Description |
| --- | --- |
| `artist` |  |
| `border` |  |
| `card` |  |
| `cmc` |  |
| `color` |  |
| `color_identity` |  |
| `flavor` |  |
| `foreign_name` |  |
| `hand` |  |
| `id` |  |
| `image_url` |  |
| `layout` |  |
| `legality` |  |
| `life` |  |
| `loyalty` |  |
| `mana_cost` |  |
| `multiverseid` |  |
| `name` |  |
| `number` |  |
| `original_text` |  |
| `original_type` |  |
| `power` |  |
| `printing` |  |
| `rarity` |  |
| `release_date` |  |
| `reserved` |  |
| `ruling` |  |
| `set` |  |
| `set_name` |  |
| `source` |  |
| `starter` |  |
| `subtype` |  |
| `supertype` |  |
| `text` |  |
| `timeshifted` |  |
| `toughness` |  |
| `type` |  |
| `variation` |  |
| `watermark` |  |

Operations: List, Load.

API path: `/cards`

#### Format

| Field | Description |
| --- | --- |
| `format` |  |

Operations: List.

API path: `/formats`

#### Set

| Field | Description |
| --- | --- |
| `block` |  |
| `booster` |  |
| `border` |  |
| `code` |  |
| `gatherer_code` |  |
| `magic_cards_info_code` |  |
| `mkm_id` |  |
| `mkm_name` |  |
| `name` |  |
| `online_only` |  |
| `release_date` |  |
| `set` |  |
| `type` |  |

Operations: List, Load.

API path: `/sets`

#### SetBooster

| Field | Description |
| --- | --- |
| `artist` |  |
| `border` |  |
| `cmc` |  |
| `color` |  |
| `color_identity` |  |
| `flavor` |  |
| `foreign_name` |  |
| `hand` |  |
| `id` |  |
| `image_url` |  |
| `layout` |  |
| `legality` |  |
| `life` |  |
| `loyalty` |  |
| `mana_cost` |  |
| `multiverseid` |  |
| `name` |  |
| `number` |  |
| `original_text` |  |
| `original_type` |  |
| `power` |  |
| `printing` |  |
| `rarity` |  |
| `release_date` |  |
| `reserved` |  |
| `ruling` |  |
| `set` |  |
| `set_name` |  |
| `source` |  |
| `starter` |  |
| `subtype` |  |
| `supertype` |  |
| `text` |  |
| `timeshifted` |  |
| `toughness` |  |
| `type` |  |
| `variation` |  |
| `watermark` |  |

Operations: List.

API path: `/sets/{id}/booster`

#### Subtype

| Field | Description |
| --- | --- |
| `subtype` |  |

Operations: List.

API path: `/subtypes`

#### Supertype

| Field | Description |
| --- | --- |
| `supertype` |  |

Operations: List.

API path: `/supertypes`

#### Type

| Field | Description |
| --- | --- |
| `type` |  |

Operations: List.

API path: `/types`



## Entities


### Card

Create an instance: `const card = client.Card()`

#### Operations

| Method | Description |
| --- | --- |
| `list(match)` | List entities matching the criteria. |
| `load(match)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `artist` | ``$STRING`` |  |
| `border` | ``$STRING`` |  |
| `card` | ``$OBJECT`` |  |
| `cmc` | ``$NUMBER`` |  |
| `color` | ``$ARRAY`` |  |
| `color_identity` | ``$ARRAY`` |  |
| `flavor` | ``$STRING`` |  |
| `foreign_name` | ``$ARRAY`` |  |
| `hand` | ``$INTEGER`` |  |
| `id` | ``$STRING`` |  |
| `image_url` | ``$STRING`` |  |
| `layout` | ``$STRING`` |  |
| `legality` | ``$ARRAY`` |  |
| `life` | ``$INTEGER`` |  |
| `loyalty` | ``$STRING`` |  |
| `mana_cost` | ``$STRING`` |  |
| `multiverseid` | ``$INTEGER`` |  |
| `name` | ``$STRING`` |  |
| `number` | ``$STRING`` |  |
| `original_text` | ``$STRING`` |  |
| `original_type` | ``$STRING`` |  |
| `power` | ``$STRING`` |  |
| `printing` | ``$ARRAY`` |  |
| `rarity` | ``$STRING`` |  |
| `release_date` | ``$STRING`` |  |
| `reserved` | ``$BOOLEAN`` |  |
| `ruling` | ``$ARRAY`` |  |
| `set` | ``$STRING`` |  |
| `set_name` | ``$STRING`` |  |
| `source` | ``$STRING`` |  |
| `starter` | ``$BOOLEAN`` |  |
| `subtype` | ``$ARRAY`` |  |
| `supertype` | ``$ARRAY`` |  |
| `text` | ``$STRING`` |  |
| `timeshifted` | ``$BOOLEAN`` |  |
| `toughness` | ``$STRING`` |  |
| `type` | ``$STRING`` |  |
| `variation` | ``$ARRAY`` |  |
| `watermark` | ``$STRING`` |  |

#### Example: Load

```ts
const card = await client.Card().load({ id: 'card_id' })
```

#### Example: List

```ts
const cards = await client.Card().list()
```


### Format

Create an instance: `const format = client.Format()`

#### Operations

| Method | Description |
| --- | --- |
| `list(match)` | List entities matching the criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `format` | ``$ARRAY`` |  |

#### Example: List

```ts
const formats = await client.Format().list()
```


### Set

Create an instance: `const set = client.Set()`

#### Operations

| Method | Description |
| --- | --- |
| `list(match)` | List entities matching the criteria. |
| `load(match)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `block` | ``$STRING`` |  |
| `booster` | ``$ARRAY`` |  |
| `border` | ``$STRING`` |  |
| `code` | ``$STRING`` |  |
| `gatherer_code` | ``$STRING`` |  |
| `magic_cards_info_code` | ``$STRING`` |  |
| `mkm_id` | ``$INTEGER`` |  |
| `mkm_name` | ``$STRING`` |  |
| `name` | ``$STRING`` |  |
| `online_only` | ``$BOOLEAN`` |  |
| `release_date` | ``$STRING`` |  |
| `set` | ``$OBJECT`` |  |
| `type` | ``$STRING`` |  |

#### Example: Load

```ts
const set = await client.Set().load({ id: 'set_id' })
```

#### Example: List

```ts
const sets = await client.Set().list()
```


### SetBooster

Create an instance: `const set_booster = client.SetBooster()`

#### Operations

| Method | Description |
| --- | --- |
| `list(match)` | List entities matching the criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `artist` | ``$STRING`` |  |
| `border` | ``$STRING`` |  |
| `cmc` | ``$NUMBER`` |  |
| `color` | ``$ARRAY`` |  |
| `color_identity` | ``$ARRAY`` |  |
| `flavor` | ``$STRING`` |  |
| `foreign_name` | ``$ARRAY`` |  |
| `hand` | ``$INTEGER`` |  |
| `id` | ``$STRING`` |  |
| `image_url` | ``$STRING`` |  |
| `layout` | ``$STRING`` |  |
| `legality` | ``$ARRAY`` |  |
| `life` | ``$INTEGER`` |  |
| `loyalty` | ``$STRING`` |  |
| `mana_cost` | ``$STRING`` |  |
| `multiverseid` | ``$INTEGER`` |  |
| `name` | ``$STRING`` |  |
| `number` | ``$STRING`` |  |
| `original_text` | ``$STRING`` |  |
| `original_type` | ``$STRING`` |  |
| `power` | ``$STRING`` |  |
| `printing` | ``$ARRAY`` |  |
| `rarity` | ``$STRING`` |  |
| `release_date` | ``$STRING`` |  |
| `reserved` | ``$BOOLEAN`` |  |
| `ruling` | ``$ARRAY`` |  |
| `set` | ``$STRING`` |  |
| `set_name` | ``$STRING`` |  |
| `source` | ``$STRING`` |  |
| `starter` | ``$BOOLEAN`` |  |
| `subtype` | ``$ARRAY`` |  |
| `supertype` | ``$ARRAY`` |  |
| `text` | ``$STRING`` |  |
| `timeshifted` | ``$BOOLEAN`` |  |
| `toughness` | ``$STRING`` |  |
| `type` | ``$STRING`` |  |
| `variation` | ``$ARRAY`` |  |
| `watermark` | ``$STRING`` |  |

#### Example: List

```ts
const set_boosters = await client.SetBooster().list()
```


### Subtype

Create an instance: `const subtype = client.Subtype()`

#### Operations

| Method | Description |
| --- | --- |
| `list(match)` | List entities matching the criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `subtype` | ``$ARRAY`` |  |

#### Example: List

```ts
const subtypes = await client.Subtype().list()
```


### Supertype

Create an instance: `const supertype = client.Supertype()`

#### Operations

| Method | Description |
| --- | --- |
| `list(match)` | List entities matching the criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `supertype` | ``$ARRAY`` |  |

#### Example: List

```ts
const supertypes = await client.Supertype().list()
```


### Type

Create an instance: `const type = client.Type()`

#### Operations

| Method | Description |
| --- | --- |
| `list(match)` | List entities matching the criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `type` | ``$ARRAY`` |  |

#### Example: List

```ts
const types = await client.Type().list()
```


## Explanation

### The operation pipeline

Every entity operation (load, list, create, update, remove) follows a
six-stage pipeline. Each stage fires a feature hook before executing:

```
PrePoint → PreSpec → PreRequest → PreResponse → PreResult → PreDone
```

- **PrePoint**: Resolves which API endpoint to call based on the
  operation name and entity configuration.
- **PreSpec**: Builds the HTTP spec — URL, method, headers, body —
  from the resolved point and the caller's parameters.
- **PreRequest**: Sends the HTTP request. Features can intercept here
  to replace the transport (as TestFeature does with mocks).
- **PreResponse**: Parses the raw HTTP response.
- **PreResult**: Extracts the business data from the parsed response.
- **PreDone**: Final stage before returning to the caller. Entity
  state (match, data) is updated here.

If any stage returns an error, the pipeline short-circuits and the
error is returned to the caller as the second element in the return array.

### Features and hooks

Features are the extension mechanism. A feature is a PHP class
with hook methods named after pipeline stages (e.g. `PrePoint`,
`PreSpec`). Each method receives the context.

The SDK ships with built-in features:

- **TestFeature**: In-memory mock transport for testing without a live server

Features are initialized in order. Hooks fire in the order features
were added, so later features can override earlier ones.

### Data as arrays

The PHP SDK uses plain PHP associative arrays throughout rather than typed
objects. This mirrors the dynamic nature of the API and keeps the
SDK flexible — no code generation is needed when the API schema
changes.

Use `Helpers::to_map()` to safely validate that a value is an array.

### Directory structure

```
php/
├── magicthegatheringtwo_sdk.php          -- Main SDK class
├── config.php                     -- Configuration
├── features.php                   -- Feature factory
├── core/                          -- Core types and context
├── entity/                        -- Entity implementations
├── feature/                       -- Built-in features (Base, Test, Log)
├── utility/                       -- Utility functions and struct library
└── test/                          -- Test suites
```

The main class (`magicthegatheringtwo_sdk.php`) exports the SDK class
and test helper. Import entity or utility modules directly only
when needed.

### Entity state

Entity instances are stateful. After a successful `load`, the entity
stores the returned data and match criteria internally.

```php
$moon = $client->Moon();
[$result, $err] = $moon->load(["planet_id" => "earth", "id" => "luna"]);

// $moon->dataGet() now returns the loaded moon data
// $moon->matchGet() returns the last match criteria
```

Call `make()` to create a fresh instance with the same configuration
but no stored state.

### Direct vs entity access

The entity interface handles URL construction, parameter placement,
and response parsing automatically. Use it for standard CRUD operations.

`direct()` gives full control over the HTTP request. Use it for
non-standard endpoints, bulk operations, or any path not modelled as
an entity. `prepare()` builds the request without sending it — useful
for debugging or custom transport.


## Full Reference

See [REFERENCE.md](REFERENCE.md) for complete API reference
documentation including all method signatures, entity field schemas,
and detailed usage examples.
