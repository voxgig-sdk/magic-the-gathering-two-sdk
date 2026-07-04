# MagicTheGatheringTwo PHP SDK Reference

Complete API reference for the MagicTheGatheringTwo PHP SDK.


## MagicTheGatheringTwoSDK

### Constructor

```php
require_once __DIR__ . '/magic-the-gathering-two_sdk.php';

$client = new MagicTheGatheringTwoSDK($options);
```

Create a new SDK client instance.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `$options` | `array` | SDK configuration options. |
| `$options["base"]` | `string` | Base URL for API requests. |
| `$options["prefix"]` | `string` | URL prefix appended after base. |
| `$options["suffix"]` | `string` | URL suffix appended after path. |
| `$options["headers"]` | `array` | Custom headers for all requests. |
| `$options["feature"]` | `array` | Feature configuration. |
| `$options["system"]` | `array` | System overrides (e.g. custom fetch). |


### Static Methods

#### `MagicTheGatheringTwoSDK::test($testopts = null, $sdkopts = null)`

Create a test client with mock features active. Both arguments may be `null`.

```php
$client = MagicTheGatheringTwoSDK::test();
```


### Instance Methods

#### `Card($data = null)`

Create a new `CardEntity` instance. Pass `null` for no initial data.

#### `Format($data = null)`

Create a new `FormatEntity` instance. Pass `null` for no initial data.

#### `Set($data = null)`

Create a new `SetEntity` instance. Pass `null` for no initial data.

#### `SetBooster($data = null)`

Create a new `SetBoosterEntity` instance. Pass `null` for no initial data.

#### `Subtype($data = null)`

Create a new `SubtypeEntity` instance. Pass `null` for no initial data.

#### `Supertype($data = null)`

Create a new `SupertypeEntity` instance. Pass `null` for no initial data.

#### `Type($data = null)`

Create a new `TypeEntity` instance. Pass `null` for no initial data.

#### `optionsMap(): array`

Return a deep copy of the current SDK options.

#### `getUtility(): ProjectNameUtility`

Return a copy of the SDK utility object.

#### `direct(array $fetchargs = []): array`

Make a direct HTTP request to any API endpoint. This is the raw-HTTP escape
hatch: it does **not** throw. It returns a result array
`["ok" => bool, "status" => int, "headers" => array, "data" => mixed]`, or
`["ok" => false, "err" => \Exception]` on failure. Branch on `$result["ok"]`.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `$fetchargs["path"]` | `string` | URL path with optional `{param}` placeholders. |
| `$fetchargs["method"]` | `string` | HTTP method (default: `"GET"`). |
| `$fetchargs["params"]` | `array` | Path parameter values for `{param}` substitution. |
| `$fetchargs["query"]` | `array` | Query string parameters. |
| `$fetchargs["headers"]` | `array` | Request headers (merged with defaults). |
| `$fetchargs["body"]` | `mixed` | Request body (arrays are JSON-serialized). |
| `$fetchargs["ctrl"]` | `array` | Control options. |

**Returns:** `array` — the result dict (see above); never throws.

#### `prepare(array $fetchargs = []): mixed`

Prepare a fetch definition without sending the request. Returns the
`$fetchdef` array. Throws on error.


---

## CardEntity

```php
$card = $client->Card();
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `artist` | ``$STRING`` | No |  |
| `border` | ``$STRING`` | No |  |
| `card` | ``$OBJECT`` | No |  |
| `cmc` | ``$NUMBER`` | No |  |
| `color` | ``$ARRAY`` | No |  |
| `color_identity` | ``$ARRAY`` | No |  |
| `flavor` | ``$STRING`` | No |  |
| `foreign_name` | ``$ARRAY`` | No |  |
| `hand` | ``$INTEGER`` | No |  |
| `id` | ``$STRING`` | No |  |
| `image_url` | ``$STRING`` | No |  |
| `layout` | ``$STRING`` | No |  |
| `legality` | ``$ARRAY`` | No |  |
| `life` | ``$INTEGER`` | No |  |
| `loyalty` | ``$STRING`` | No |  |
| `mana_cost` | ``$STRING`` | No |  |
| `multiverseid` | ``$INTEGER`` | No |  |
| `name` | ``$STRING`` | No |  |
| `number` | ``$STRING`` | No |  |
| `original_text` | ``$STRING`` | No |  |
| `original_type` | ``$STRING`` | No |  |
| `power` | ``$STRING`` | No |  |
| `printing` | ``$ARRAY`` | No |  |
| `rarity` | ``$STRING`` | No |  |
| `release_date` | ``$STRING`` | No |  |
| `reserved` | ``$BOOLEAN`` | No |  |
| `ruling` | ``$ARRAY`` | No |  |
| `set` | ``$STRING`` | No |  |
| `set_name` | ``$STRING`` | No |  |
| `source` | ``$STRING`` | No |  |
| `starter` | ``$BOOLEAN`` | No |  |
| `subtype` | ``$ARRAY`` | No |  |
| `supertype` | ``$ARRAY`` | No |  |
| `text` | ``$STRING`` | No |  |
| `timeshifted` | ``$BOOLEAN`` | No |  |
| `toughness` | ``$STRING`` | No |  |
| `type` | ``$STRING`` | No |  |
| `variation` | ``$ARRAY`` | No |  |
| `watermark` | ``$STRING`` | No |  |

### Operations

#### `list(array $reqmatch, ?array $ctrl = null): mixed`

List entities matching the given criteria. Returns an array. Throws on error.

```php
$results = $client->Card()->list([]);
```

#### `load(array $reqmatch, ?array $ctrl = null): mixed`

Load a single entity matching the given criteria. Throws on error.

```php
$result = $client->Card()->load(["id" => "card_id"]);
```

### Common Methods

#### `dataGet(): array`

Get the entity data. Returns a copy of the current data.

#### `dataSet($data): void`

Set the entity data.

#### `matchGet(): array`

Get the entity match criteria.

#### `matchSet($match): void`

Set the entity match criteria.

#### `make(): CardEntity`

Create a new `CardEntity` instance with the same client and
options.

#### `getName(): string`

Return the entity name.


---

## FormatEntity

```php
$format = $client->Format();
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `format` | ``$ARRAY`` | No |  |

### Operations

#### `list(array $reqmatch, ?array $ctrl = null): mixed`

List entities matching the given criteria. Returns an array. Throws on error.

```php
$results = $client->Format()->list([]);
```

### Common Methods

#### `dataGet(): array`

Get the entity data. Returns a copy of the current data.

#### `dataSet($data): void`

Set the entity data.

#### `matchGet(): array`

Get the entity match criteria.

#### `matchSet($match): void`

Set the entity match criteria.

#### `make(): FormatEntity`

Create a new `FormatEntity` instance with the same client and
options.

#### `getName(): string`

Return the entity name.


---

## SetEntity

```php
$set = $client->Set();
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `block` | ``$STRING`` | No |  |
| `booster` | ``$ARRAY`` | No |  |
| `border` | ``$STRING`` | No |  |
| `code` | ``$STRING`` | No |  |
| `gatherer_code` | ``$STRING`` | No |  |
| `magic_cards_info_code` | ``$STRING`` | No |  |
| `mkm_id` | ``$INTEGER`` | No |  |
| `mkm_name` | ``$STRING`` | No |  |
| `name` | ``$STRING`` | No |  |
| `online_only` | ``$BOOLEAN`` | No |  |
| `release_date` | ``$STRING`` | No |  |
| `set` | ``$OBJECT`` | No |  |
| `type` | ``$STRING`` | No |  |

### Operations

#### `list(array $reqmatch, ?array $ctrl = null): mixed`

List entities matching the given criteria. Returns an array. Throws on error.

```php
$results = $client->Set()->list([]);
```

#### `load(array $reqmatch, ?array $ctrl = null): mixed`

Load a single entity matching the given criteria. Throws on error.

```php
$result = $client->Set()->load(["id" => "set_id"]);
```

### Common Methods

#### `dataGet(): array`

Get the entity data. Returns a copy of the current data.

#### `dataSet($data): void`

Set the entity data.

#### `matchGet(): array`

Get the entity match criteria.

#### `matchSet($match): void`

Set the entity match criteria.

#### `make(): SetEntity`

Create a new `SetEntity` instance with the same client and
options.

#### `getName(): string`

Return the entity name.


---

## SetBoosterEntity

```php
$set_booster = $client->SetBooster();
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `artist` | ``$STRING`` | No |  |
| `border` | ``$STRING`` | No |  |
| `cmc` | ``$NUMBER`` | No |  |
| `color` | ``$ARRAY`` | No |  |
| `color_identity` | ``$ARRAY`` | No |  |
| `flavor` | ``$STRING`` | No |  |
| `foreign_name` | ``$ARRAY`` | No |  |
| `hand` | ``$INTEGER`` | No |  |
| `id` | ``$STRING`` | No |  |
| `image_url` | ``$STRING`` | No |  |
| `layout` | ``$STRING`` | No |  |
| `legality` | ``$ARRAY`` | No |  |
| `life` | ``$INTEGER`` | No |  |
| `loyalty` | ``$STRING`` | No |  |
| `mana_cost` | ``$STRING`` | No |  |
| `multiverseid` | ``$INTEGER`` | No |  |
| `name` | ``$STRING`` | No |  |
| `number` | ``$STRING`` | No |  |
| `original_text` | ``$STRING`` | No |  |
| `original_type` | ``$STRING`` | No |  |
| `power` | ``$STRING`` | No |  |
| `printing` | ``$ARRAY`` | No |  |
| `rarity` | ``$STRING`` | No |  |
| `release_date` | ``$STRING`` | No |  |
| `reserved` | ``$BOOLEAN`` | No |  |
| `ruling` | ``$ARRAY`` | No |  |
| `set` | ``$STRING`` | No |  |
| `set_name` | ``$STRING`` | No |  |
| `source` | ``$STRING`` | No |  |
| `starter` | ``$BOOLEAN`` | No |  |
| `subtype` | ``$ARRAY`` | No |  |
| `supertype` | ``$ARRAY`` | No |  |
| `text` | ``$STRING`` | No |  |
| `timeshifted` | ``$BOOLEAN`` | No |  |
| `toughness` | ``$STRING`` | No |  |
| `type` | ``$STRING`` | No |  |
| `variation` | ``$ARRAY`` | No |  |
| `watermark` | ``$STRING`` | No |  |

### Operations

#### `list(array $reqmatch, ?array $ctrl = null): mixed`

List entities matching the given criteria. Returns an array. Throws on error.

```php
$results = $client->SetBooster()->list([]);
```

### Common Methods

#### `dataGet(): array`

Get the entity data. Returns a copy of the current data.

#### `dataSet($data): void`

Set the entity data.

#### `matchGet(): array`

Get the entity match criteria.

#### `matchSet($match): void`

Set the entity match criteria.

#### `make(): SetBoosterEntity`

Create a new `SetBoosterEntity` instance with the same client and
options.

#### `getName(): string`

Return the entity name.


---

## SubtypeEntity

```php
$subtype = $client->Subtype();
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `subtype` | ``$ARRAY`` | No |  |

### Operations

#### `list(array $reqmatch, ?array $ctrl = null): mixed`

List entities matching the given criteria. Returns an array. Throws on error.

```php
$results = $client->Subtype()->list([]);
```

### Common Methods

#### `dataGet(): array`

Get the entity data. Returns a copy of the current data.

#### `dataSet($data): void`

Set the entity data.

#### `matchGet(): array`

Get the entity match criteria.

#### `matchSet($match): void`

Set the entity match criteria.

#### `make(): SubtypeEntity`

Create a new `SubtypeEntity` instance with the same client and
options.

#### `getName(): string`

Return the entity name.


---

## SupertypeEntity

```php
$supertype = $client->Supertype();
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `supertype` | ``$ARRAY`` | No |  |

### Operations

#### `list(array $reqmatch, ?array $ctrl = null): mixed`

List entities matching the given criteria. Returns an array. Throws on error.

```php
$results = $client->Supertype()->list([]);
```

### Common Methods

#### `dataGet(): array`

Get the entity data. Returns a copy of the current data.

#### `dataSet($data): void`

Set the entity data.

#### `matchGet(): array`

Get the entity match criteria.

#### `matchSet($match): void`

Set the entity match criteria.

#### `make(): SupertypeEntity`

Create a new `SupertypeEntity` instance with the same client and
options.

#### `getName(): string`

Return the entity name.


---

## TypeEntity

```php
$type = $client->Type();
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `type` | ``$ARRAY`` | No |  |

### Operations

#### `list(array $reqmatch, ?array $ctrl = null): mixed`

List entities matching the given criteria. Returns an array. Throws on error.

```php
$results = $client->Type()->list([]);
```

### Common Methods

#### `dataGet(): array`

Get the entity data. Returns a copy of the current data.

#### `dataSet($data): void`

Set the entity data.

#### `matchGet(): array`

Get the entity match criteria.

#### `matchSet($match): void`

Set the entity match criteria.

#### `make(): TypeEntity`

Create a new `TypeEntity` instance with the same client and
options.

#### `getName(): string`

Return the entity name.


---

## Features

| Feature | Version | Description |
| --- | --- | --- |
| `test` | 0.0.1 | In-memory mock transport for testing without a live server |


Features are activated via the `feature` option:

```php
$client = new MagicTheGatheringTwoSDK([
  "feature" => [
    "test" => ["active" => true],
  ],
]);
```

