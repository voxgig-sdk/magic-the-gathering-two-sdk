# MagicTheGatheringTwo PHP SDK Reference

Complete API reference for the MagicTheGatheringTwo PHP SDK.


## MagicTheGatheringTwoSDK

### Constructor

```php
require_once __DIR__ . '/magicthegatheringtwo_sdk.php';

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

#### `options_map(): array`

Return a deep copy of the current SDK options.

#### `get_utility(): MagicTheGatheringTwoUtility`

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
| `artist` | `string` | No | The artist of the card |
| `border` | `string` | No | The border color if different from the set default |
| `cmc` | `float` | No | Converted mana cost |
| `colorIdentity` | `array` | No | The card's color identity by color code |
| `colors` | `array` | No | The card colors |
| `flavor` | `string` | No | The flavor text of the card |
| `foreignNames` | `array` | No | Foreign language names for the card |
| `hand` | `int` | No | Maximum hand size modifier (Vanguard cards only) |
| `id` | `string` | No | A unique id for this card (SHA1 hash) |
| `imageUrl` | `string` | No | The image URL for the card |
| `layout` | `string` | No | The card layout |
| `legalities` | `array` | No | Which formats this card is legal, restricted or banned in |
| `life` | `int` | No | Starting life total modifier (Vanguard cards only) |
| `loyalty` | `string` | No | The loyalty of the card (planeswalkers only) |
| `manaCost` | `string` | No | The mana cost of the card |
| `multiverseid` | `int` | No | The multiverseid of the card on Wizard's Gatherer |
| `name` | `string` | No | The card name |
| `names` | `array` | No | Only used for split, flip and dual cards. |
| `number` | `string` | No | The card number |
| `originalText` | `string` | No | The original text on the card at the time it was printed |
| `originalType` | `string` | No | The original type on the card at the time it was printed |
| `power` | `string` | No | The power of the card (creatures only) |
| `printings` | `array` | No | The sets that this card was printed in |
| `rarity` | `string` | No | The rarity of the card |
| `releaseDate` | `string` | No | The release date for promo cards |
| `reserved` | `bool` | No | True if this card is reserved by Wizards Official Reprint Policy |
| `rulings` | `array` | No | The rulings for the card |
| `set` | `string` | No | The set code the card belongs to |
| `setName` | `string` | No | The set name the card belongs to |
| `source` | `string` | No | For promo cards, where the card was originally obtained |
| `starter` | `bool` | No | True if this card was only released as part of a core box set |
| `subtypes` | `array` | No | The subtypes of the card |
| `supertypes` | `array` | No | The supertypes of the card |
| `text` | `string` | No | The oracle text of the card |
| `timeshifted` | `bool` | No | True if this card was timeshifted in the set |
| `toughness` | `string` | No | The toughness of the card (creatures only) |
| `type` | `string` | No | The card type |
| `types` | `array` | No | The types of the card |
| `variations` | `array` | No | Multiverseids of alternate art variations |
| `watermark` | `string` | No | The watermark on the card |

### Operations

#### `list(?array $reqmatch = null, ?array $ctrl = null): mixed`

List entities matching the given criteria (call with no argument to list all). Returns an array. Throws on error.

```php
$results = $client->Card()->list();
```

#### `load(array $reqmatch, ?array $ctrl = null): mixed`

Load a single entity matching the given criteria. Throws on error.

```php
$result = $client->Card()->load(["id" => "card_id"]);
```

### Common Methods

#### `data_get(): array`

Get the entity data. Returns a copy of the current data.

#### `data_set($data): void`

Set the entity data.

#### `match_get(): array`

Get the entity match criteria.

#### `match_set($match): void`

Set the entity match criteria.

#### `make(): CardEntity`

Create a new `CardEntity` instance with the same client and
options.

#### `get_name(): string`

Return the entity name.


---

## FormatEntity

```php
$format = $client->Format();
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `formats` | `array` | No |  |

### Operations

#### `list(?array $reqmatch = null, ?array $ctrl = null): mixed`

List entities matching the given criteria (call with no argument to list all). Returns an array. Throws on error.

```php
$results = $client->Format()->list();
```

### Common Methods

#### `data_get(): array`

Get the entity data. Returns a copy of the current data.

#### `data_set($data): void`

Set the entity data.

#### `match_get(): array`

Get the entity match criteria.

#### `match_set($match): void`

Set the entity match criteria.

#### `make(): FormatEntity`

Create a new `FormatEntity` instance with the same client and
options.

#### `get_name(): string`

Return the entity name.


---

## SetEntity

```php
$set = $client->Set();
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `block` | `string` | No | The block the set belongs to |
| `booster` | `array` | No | Booster pack configuration |
| `border` | `string` | No | The border color of the set |
| `code` | `string` | No | The set code |
| `gathererCode` | `string` | No | The Gatherer code for the set |
| `id` | `string` | No |  |
| `magicCardsInfoCode` | `string` | No | The Magic Cards Info code for the set |
| `mkm_id` | `int` | No | The Magic Card Market set ID |
| `mkm_name` | `string` | No | The Magic Card Market set name |
| `name` | `string` | No | The name of the set |
| `onlineOnly` | `bool` | No | True if the set is online only |
| `releaseDate` | `string` | No | The release date of the set |
| `type` | `string` | No | The type of the set |

### Operations

#### `list(?array $reqmatch = null, ?array $ctrl = null): mixed`

List entities matching the given criteria (call with no argument to list all). Returns an array. Throws on error.

```php
$results = $client->Set()->list();
```

#### `load(array $reqmatch, ?array $ctrl = null): mixed`

Load a single entity matching the given criteria. Throws on error.

```php
$result = $client->Set()->load(["id" => "set_id"]);
```

### Common Methods

#### `data_get(): array`

Get the entity data. Returns a copy of the current data.

#### `data_set($data): void`

Set the entity data.

#### `match_get(): array`

Get the entity match criteria.

#### `match_set($match): void`

Set the entity match criteria.

#### `make(): SetEntity`

Create a new `SetEntity` instance with the same client and
options.

#### `get_name(): string`

Return the entity name.


---

## SetBoosterEntity

```php
$set_booster = $client->SetBooster();
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `artist` | `string` | No | The artist of the card |
| `border` | `string` | No | The border color if different from the set default |
| `cmc` | `float` | No | Converted mana cost |
| `colorIdentity` | `array` | No | The card's color identity by color code |
| `colors` | `array` | No | The card colors |
| `flavor` | `string` | No | The flavor text of the card |
| `foreignNames` | `array` | No | Foreign language names for the card |
| `hand` | `int` | No | Maximum hand size modifier (Vanguard cards only) |
| `id` | `string` | No | A unique id for this card (SHA1 hash) |
| `imageUrl` | `string` | No | The image URL for the card |
| `layout` | `string` | No | The card layout |
| `legalities` | `array` | No | Which formats this card is legal, restricted or banned in |
| `life` | `int` | No | Starting life total modifier (Vanguard cards only) |
| `loyalty` | `string` | No | The loyalty of the card (planeswalkers only) |
| `manaCost` | `string` | No | The mana cost of the card |
| `multiverseid` | `int` | No | The multiverseid of the card on Wizard's Gatherer |
| `name` | `string` | No | The card name |
| `names` | `array` | No | Only used for split, flip and dual cards. |
| `number` | `string` | No | The card number |
| `originalText` | `string` | No | The original text on the card at the time it was printed |
| `originalType` | `string` | No | The original type on the card at the time it was printed |
| `power` | `string` | No | The power of the card (creatures only) |
| `printings` | `array` | No | The sets that this card was printed in |
| `rarity` | `string` | No | The rarity of the card |
| `releaseDate` | `string` | No | The release date for promo cards |
| `reserved` | `bool` | No | True if this card is reserved by Wizards Official Reprint Policy |
| `rulings` | `array` | No | The rulings for the card |
| `set` | `string` | No | The set code the card belongs to |
| `setName` | `string` | No | The set name the card belongs to |
| `source` | `string` | No | For promo cards, where the card was originally obtained |
| `starter` | `bool` | No | True if this card was only released as part of a core box set |
| `subtypes` | `array` | No | The subtypes of the card |
| `supertypes` | `array` | No | The supertypes of the card |
| `text` | `string` | No | The oracle text of the card |
| `timeshifted` | `bool` | No | True if this card was timeshifted in the set |
| `toughness` | `string` | No | The toughness of the card (creatures only) |
| `type` | `string` | No | The card type |
| `types` | `array` | No | The types of the card |
| `variations` | `array` | No | Multiverseids of alternate art variations |
| `watermark` | `string` | No | The watermark on the card |

### Operations

#### `list(?array $reqmatch = null, ?array $ctrl = null): mixed`

List entities matching the given criteria (call with no argument to list all). Returns an array. Throws on error.

```php
$results = $client->SetBooster()->list();
```

### Common Methods

#### `data_get(): array`

Get the entity data. Returns a copy of the current data.

#### `data_set($data): void`

Set the entity data.

#### `match_get(): array`

Get the entity match criteria.

#### `match_set($match): void`

Set the entity match criteria.

#### `make(): SetBoosterEntity`

Create a new `SetBoosterEntity` instance with the same client and
options.

#### `get_name(): string`

Return the entity name.


---

## SubtypeEntity

```php
$subtype = $client->Subtype();
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `subtypes` | `array` | No |  |

### Operations

#### `list(?array $reqmatch = null, ?array $ctrl = null): mixed`

List entities matching the given criteria (call with no argument to list all). Returns an array. Throws on error.

```php
$results = $client->Subtype()->list();
```

### Common Methods

#### `data_get(): array`

Get the entity data. Returns a copy of the current data.

#### `data_set($data): void`

Set the entity data.

#### `match_get(): array`

Get the entity match criteria.

#### `match_set($match): void`

Set the entity match criteria.

#### `make(): SubtypeEntity`

Create a new `SubtypeEntity` instance with the same client and
options.

#### `get_name(): string`

Return the entity name.


---

## SupertypeEntity

```php
$supertype = $client->Supertype();
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `supertypes` | `array` | No |  |

### Operations

#### `list(?array $reqmatch = null, ?array $ctrl = null): mixed`

List entities matching the given criteria (call with no argument to list all). Returns an array. Throws on error.

```php
$results = $client->Supertype()->list();
```

### Common Methods

#### `data_get(): array`

Get the entity data. Returns a copy of the current data.

#### `data_set($data): void`

Set the entity data.

#### `match_get(): array`

Get the entity match criteria.

#### `match_set($match): void`

Set the entity match criteria.

#### `make(): SupertypeEntity`

Create a new `SupertypeEntity` instance with the same client and
options.

#### `get_name(): string`

Return the entity name.


---

## TypeEntity

```php
$type = $client->Type();
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `types` | `array` | No |  |

### Operations

#### `list(?array $reqmatch = null, ?array $ctrl = null): mixed`

List entities matching the given criteria (call with no argument to list all). Returns an array. Throws on error.

```php
$results = $client->Type()->list();
```

### Common Methods

#### `data_get(): array`

Get the entity data. Returns a copy of the current data.

#### `data_set($data): void`

Set the entity data.

#### `match_get(): array`

Get the entity match criteria.

#### `match_set($match): void`

Set the entity match criteria.

#### `make(): TypeEntity`

Create a new `TypeEntity` instance with the same client and
options.

#### `get_name(): string`

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


### Configuring features

Each feature is inactive until switched on, and an SDK with no feature
configured does no feature work at all. Every option below keeps its default
unless you name it.

The array form of \`feature\` is significant: several features wrap the
transport, and the order you list them in is the order they nest.

#### `test`

In-memory mock transport for testing without a live server.

**Configuration**

| Option | Default |
|---|---|
| `active` | `false` |

Options above are those the model carries a default for. A feature may
also accept callback options — a `sink` to receive each record, for
instance — which have no default and are covered in the full feature
reference.

**Usage**

Set `feature.test.active` to true in the client options, and override any option above in the same entry. Every option keeps
its default unless you name it.

**Considerations**

- Attaches to pipeline hooks, not the transport, so activation order does
  not change what it observes.
- Installs the BASE transport that the wrapping features wrap, so it must be
  activated before them.
- Inactive by default: leaving it out costs nothing at runtime.

