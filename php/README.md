# MagicTheGatheringTwo PHP SDK



The PHP SDK for the MagicTheGatheringTwo API — an entity-oriented client using PHP conventions.

The SDK exposes the API as capitalised, semantic **Entities** — for example `$client->Card()` — with named operations (`list`/`load`) instead of raw URL paths and query strings. Working with resources and verbs keeps call sites self-describing and reduces cognitive load.

> Other languages, the CLI, and MCP server live alongside this one — see
> the [top-level README](../README.md).


## Install
This package is not yet published to Packagist. Install it from the
GitHub release tag (`php/vX.Y.Z`):

- Releases: [https://github.com/voxgig-sdk/magic-the-gathering-two-sdk/releases](https://github.com/voxgig-sdk/magic-the-gathering-two-sdk/releases)


## Tutorial: your first API call

This tutorial walks through creating a client, listing entities, and
loading a specific record.

### 1. Create a client

```php
<?php
require_once 'magicthegatheringtwo_sdk.php';

$client = new MagicTheGatheringTwoSDK();
```

### 2. List card records

```php
try {
    // list() returns entity instances; data_get() reads each record.
    $cards = $client->Card()->list();
    foreach ($cards as $record) {
        $item = $record->data_get();
        echo $item["id"] . " " . $item["artist"] . "\n";
    }
} catch (\Throwable $err) {
    echo "Error: " . $err->getMessage();
}
```

### 3. Load a card

```php
try {
    // load() returns the ENTITY — call data_get() for the Card record (throws on error).
    $card = $client->Card()->load(["id" => "example_id"]);
    print_r($card->data_get());
} catch (\Throwable $err) {
    echo "Error: " . $err->getMessage();
}
```


## Error handling

Entity operations throw a `\Throwable` on failure, so wrap them in
`try` / `catch`:

```php
try {
    $formats = $client->Format()->list();
} catch (\Throwable $err) {
    echo "Error: " . $err->getMessage();
}
```

`direct()` does **not** throw — it returns the result array. Branch on
`ok`; on failure `status` holds the HTTP status (for error responses) and
`err` holds a transport error, so read both defensively:

```php
$result = $client->direct([
    "path" => "/api/resource/{id}",
    "method" => "GET",
    "params" => ["id" => "example_id"],
]);

if (! $result["ok"]) {
    $err = $result["err"] ?? null;
    echo "request failed: " . ($err ? $err->getMessage() : "HTTP " . $result["status"]);
}
```


## How-to guides

### Make a direct HTTP request

For endpoints not covered by entity methods:

```php
// direct() is the raw-HTTP escape hatch: it returns a result array
// (it does not throw). Branch on $result["ok"].
$result = $client->direct([
    "path" => "/api/resource/{id}",
    "method" => "GET",
    "params" => ["id" => "example"],
]);

if ($result["ok"]) {
    echo $result["status"];  // 200
    print_r($result["data"]);  // response body
} else {
    // On an HTTP error status there is no err (only a transport failure sets
    // it), so fall back to the status code.
    $err = $result["err"] ?? null;
    echo "Error: " . ($err ? $err->getMessage() : "HTTP " . $result["status"]);
}
```

### Prepare a request without sending it

```php
// prepare() throws on error and returns the fetch definition.
$fetchdef = $client->prepare([
    "path" => "/api/resource/{id}",
    "method" => "DELETE",
    "params" => ["id" => "example"],
]);

echo $fetchdef["url"];
echo $fetchdef["method"];
print_r($fetchdef["headers"]);
```

### Use test mode

Create a mock client for unit testing — no server required. Seed fixture
data via the `entity` option so offline calls resolve without a live server:

```php
$client = MagicTheGatheringTwoSDK::test([
    "entity" => ["card" => ["test01" => ["id" => "test01"]]],
]);

// list() returns entity instances (throws on error);
// call data_get() for the mock record.
$card = $client->Card()->list();
print_r(array_map(fn($item) => $item->data_get(), $card));
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
MAGIC_THE_GATHERING_TWO_TEST_LIVE=TRUE
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
| `list` | `(?array $reqmatch = null, $ctrl): array` | List entities matching the criteria (call with no argument to list all). |
| `data_get` | `(): array` | Get entity data. |
| `data_set` | `($data): void` | Set entity data. |
| `match_get` | `(): array` | Get entity match criteria. |
| `match_set` | `($match): void` | Set entity match criteria. |
| `make` | `(): Entity` | Create a new instance with the same options. |
| `get_name` | `(): string` | Return the entity name. |

### Result shape

Entity operations return the ENTITY (call data_get() for the record) (an `array` for single-entity
ops, a `list` for `list`) and throw on error. Wrap calls in
`try`/`catch` to handle failures.

The `direct()` escape hatch never throws — it returns a result `array`
you branch on via `$result["ok"]`:

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
| `artist` | The artist of the card |
| `border` | The border color if different from the set default |
| `cmc` | Converted mana cost |
| `colorIdentity` | The card's color identity by color code |
| `colors` | The card colors |
| `flavor` | The flavor text of the card |
| `foreignNames` | Foreign language names for the card |
| `hand` | Maximum hand size modifier (Vanguard cards only) |
| `id` | A unique id for this card (SHA1 hash) |
| `imageUrl` | The image URL for the card |
| `layout` | The card layout |
| `legalities` | Which formats this card is legal, restricted or banned in |
| `life` | Starting life total modifier (Vanguard cards only) |
| `loyalty` | The loyalty of the card (planeswalkers only) |
| `manaCost` | The mana cost of the card |
| `multiverseid` | The multiverseid of the card on Wizard's Gatherer |
| `name` | The card name |
| `names` | Only used for split, flip and dual cards. |
| `number` | The card number |
| `originalText` | The original text on the card at the time it was printed |
| `originalType` | The original type on the card at the time it was printed |
| `power` | The power of the card (creatures only) |
| `printings` | The sets that this card was printed in |
| `rarity` | The rarity of the card |
| `releaseDate` | The release date for promo cards |
| `reserved` | True if this card is reserved by Wizards Official Reprint Policy |
| `rulings` | The rulings for the card |
| `set` | The set code the card belongs to |
| `setName` | The set name the card belongs to |
| `source` | For promo cards, where the card was originally obtained |
| `starter` | True if this card was only released as part of a core box set |
| `subtypes` | The subtypes of the card |
| `supertypes` | The supertypes of the card |
| `text` | The oracle text of the card |
| `timeshifted` | True if this card was timeshifted in the set |
| `toughness` | The toughness of the card (creatures only) |
| `type` | The card type |
| `types` | The types of the card |
| `variations` | Multiverseids of alternate art variations |
| `watermark` | The watermark on the card |

Operations: List, Load.

API path: `/cards`

#### Format

| Field | Description |
| --- | --- |
| `formats` |  |

Operations: List.

API path: `/formats`

#### Set

| Field | Description |
| --- | --- |
| `block` | The block the set belongs to |
| `booster` | Booster pack configuration |
| `border` | The border color of the set |
| `code` | The set code |
| `gathererCode` | The Gatherer code for the set |
| `id` |  |
| `magicCardsInfoCode` | The Magic Cards Info code for the set |
| `mkm_id` | The Magic Card Market set ID |
| `mkm_name` | The Magic Card Market set name |
| `name` | The name of the set |
| `onlineOnly` | True if the set is online only |
| `releaseDate` | The release date of the set |
| `type` | The type of the set |

Operations: List, Load.

API path: `/sets`

#### SetBooster

| Field | Description |
| --- | --- |
| `artist` | The artist of the card |
| `border` | The border color if different from the set default |
| `cmc` | Converted mana cost |
| `colorIdentity` | The card's color identity by color code |
| `colors` | The card colors |
| `flavor` | The flavor text of the card |
| `foreignNames` | Foreign language names for the card |
| `hand` | Maximum hand size modifier (Vanguard cards only) |
| `id` | A unique id for this card (SHA1 hash) |
| `imageUrl` | The image URL for the card |
| `layout` | The card layout |
| `legalities` | Which formats this card is legal, restricted or banned in |
| `life` | Starting life total modifier (Vanguard cards only) |
| `loyalty` | The loyalty of the card (planeswalkers only) |
| `manaCost` | The mana cost of the card |
| `multiverseid` | The multiverseid of the card on Wizard's Gatherer |
| `name` | The card name |
| `names` | Only used for split, flip and dual cards. |
| `number` | The card number |
| `originalText` | The original text on the card at the time it was printed |
| `originalType` | The original type on the card at the time it was printed |
| `power` | The power of the card (creatures only) |
| `printings` | The sets that this card was printed in |
| `rarity` | The rarity of the card |
| `releaseDate` | The release date for promo cards |
| `reserved` | True if this card is reserved by Wizards Official Reprint Policy |
| `rulings` | The rulings for the card |
| `set` | The set code the card belongs to |
| `setName` | The set name the card belongs to |
| `source` | For promo cards, where the card was originally obtained |
| `starter` | True if this card was only released as part of a core box set |
| `subtypes` | The subtypes of the card |
| `supertypes` | The supertypes of the card |
| `text` | The oracle text of the card |
| `timeshifted` | True if this card was timeshifted in the set |
| `toughness` | The toughness of the card (creatures only) |
| `type` | The card type |
| `types` | The types of the card |
| `variations` | Multiverseids of alternate art variations |
| `watermark` | The watermark on the card |

Operations: List.

API path: `/sets/{id}/booster`

#### Subtype

| Field | Description |
| --- | --- |
| `subtypes` |  |

Operations: List.

API path: `/subtypes`

#### Supertype

| Field | Description |
| --- | --- |
| `supertypes` |  |

Operations: List.

API path: `/supertypes`

#### Type

| Field | Description |
| --- | --- |
| `types` |  |

Operations: List.

API path: `/types`



## Entities


### Card

Create an instance: `$card = $client->Card();`

#### Operations

| Method | Description |
| --- | --- |
| `list(match)` | List entities matching the criteria. |
| `load(match)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `artist` | `string` | The artist of the card |
| `border` | `string` | The border color if different from the set default |
| `cmc` | `float` | Converted mana cost |
| `colorIdentity` | `array` | The card's color identity by color code |
| `colors` | `array` | The card colors |
| `flavor` | `string` | The flavor text of the card |
| `foreignNames` | `array` | Foreign language names for the card |
| `hand` | `int` | Maximum hand size modifier (Vanguard cards only) |
| `id` | `string` | A unique id for this card (SHA1 hash) |
| `imageUrl` | `string` | The image URL for the card |
| `layout` | `string` | The card layout |
| `legalities` | `array` | Which formats this card is legal, restricted or banned in |
| `life` | `int` | Starting life total modifier (Vanguard cards only) |
| `loyalty` | `string` | The loyalty of the card (planeswalkers only) |
| `manaCost` | `string` | The mana cost of the card |
| `multiverseid` | `int` | The multiverseid of the card on Wizard's Gatherer |
| `name` | `string` | The card name |
| `names` | `array` | Only used for split, flip and dual cards. |
| `number` | `string` | The card number |
| `originalText` | `string` | The original text on the card at the time it was printed |
| `originalType` | `string` | The original type on the card at the time it was printed |
| `power` | `string` | The power of the card (creatures only) |
| `printings` | `array` | The sets that this card was printed in |
| `rarity` | `string` | The rarity of the card |
| `releaseDate` | `string` | The release date for promo cards |
| `reserved` | `bool` | True if this card is reserved by Wizards Official Reprint Policy |
| `rulings` | `array` | The rulings for the card |
| `set` | `string` | The set code the card belongs to |
| `setName` | `string` | The set name the card belongs to |
| `source` | `string` | For promo cards, where the card was originally obtained |
| `starter` | `bool` | True if this card was only released as part of a core box set |
| `subtypes` | `array` | The subtypes of the card |
| `supertypes` | `array` | The supertypes of the card |
| `text` | `string` | The oracle text of the card |
| `timeshifted` | `bool` | True if this card was timeshifted in the set |
| `toughness` | `string` | The toughness of the card (creatures only) |
| `type` | `string` | The card type |
| `types` | `array` | The types of the card |
| `variations` | `array` | Multiverseids of alternate art variations |
| `watermark` | `string` | The watermark on the card |

#### Example: Load

```php
// load() returns the ENTITY — call data_get() for the Card record (throws on error).
$card = $client->Card()->load(["id" => "card_id"]);
```

#### Example: List

```php
// list() returns an array of Card records (throws on error).
$cards = $client->Card()->list();
```


### Format

Create an instance: `$format = $client->Format();`

#### Operations

| Method | Description |
| --- | --- |
| `list(match)` | List entities matching the criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `formats` | `array` |  |

#### Example: List

```php
// list() returns an array of Format records (throws on error).
$formats = $client->Format()->list();
```


### Set

Create an instance: `$set = $client->Set();`

#### Operations

| Method | Description |
| --- | --- |
| `list(match)` | List entities matching the criteria. |
| `load(match)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `block` | `string` | The block the set belongs to |
| `booster` | `array` | Booster pack configuration |
| `border` | `string` | The border color of the set |
| `code` | `string` | The set code |
| `gathererCode` | `string` | The Gatherer code for the set |
| `id` | `string` |  |
| `magicCardsInfoCode` | `string` | The Magic Cards Info code for the set |
| `mkm_id` | `int` | The Magic Card Market set ID |
| `mkm_name` | `string` | The Magic Card Market set name |
| `name` | `string` | The name of the set |
| `onlineOnly` | `bool` | True if the set is online only |
| `releaseDate` | `string` | The release date of the set |
| `type` | `string` | The type of the set |

#### Example: Load

```php
// load() returns the ENTITY — call data_get() for the Set record (throws on error).
$set = $client->Set()->load(["id" => "set_id"]);
```

#### Example: List

```php
// list() returns an array of Set records (throws on error).
$sets = $client->Set()->list();
```


### SetBooster

Create an instance: `$set_booster = $client->SetBooster();`

#### Operations

| Method | Description |
| --- | --- |
| `list(match)` | List entities matching the criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `artist` | `string` | The artist of the card |
| `border` | `string` | The border color if different from the set default |
| `cmc` | `float` | Converted mana cost |
| `colorIdentity` | `array` | The card's color identity by color code |
| `colors` | `array` | The card colors |
| `flavor` | `string` | The flavor text of the card |
| `foreignNames` | `array` | Foreign language names for the card |
| `hand` | `int` | Maximum hand size modifier (Vanguard cards only) |
| `id` | `string` | A unique id for this card (SHA1 hash) |
| `imageUrl` | `string` | The image URL for the card |
| `layout` | `string` | The card layout |
| `legalities` | `array` | Which formats this card is legal, restricted or banned in |
| `life` | `int` | Starting life total modifier (Vanguard cards only) |
| `loyalty` | `string` | The loyalty of the card (planeswalkers only) |
| `manaCost` | `string` | The mana cost of the card |
| `multiverseid` | `int` | The multiverseid of the card on Wizard's Gatherer |
| `name` | `string` | The card name |
| `names` | `array` | Only used for split, flip and dual cards. |
| `number` | `string` | The card number |
| `originalText` | `string` | The original text on the card at the time it was printed |
| `originalType` | `string` | The original type on the card at the time it was printed |
| `power` | `string` | The power of the card (creatures only) |
| `printings` | `array` | The sets that this card was printed in |
| `rarity` | `string` | The rarity of the card |
| `releaseDate` | `string` | The release date for promo cards |
| `reserved` | `bool` | True if this card is reserved by Wizards Official Reprint Policy |
| `rulings` | `array` | The rulings for the card |
| `set` | `string` | The set code the card belongs to |
| `setName` | `string` | The set name the card belongs to |
| `source` | `string` | For promo cards, where the card was originally obtained |
| `starter` | `bool` | True if this card was only released as part of a core box set |
| `subtypes` | `array` | The subtypes of the card |
| `supertypes` | `array` | The supertypes of the card |
| `text` | `string` | The oracle text of the card |
| `timeshifted` | `bool` | True if this card was timeshifted in the set |
| `toughness` | `string` | The toughness of the card (creatures only) |
| `type` | `string` | The card type |
| `types` | `array` | The types of the card |
| `variations` | `array` | Multiverseids of alternate art variations |
| `watermark` | `string` | The watermark on the card |

#### Example: List

```php
// list() returns an array of SetBooster records (throws on error).
$set_boosters = $client->SetBooster()->list();
```


### Subtype

Create an instance: `$subtype = $client->Subtype();`

#### Operations

| Method | Description |
| --- | --- |
| `list(match)` | List entities matching the criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `subtypes` | `array` |  |

#### Example: List

```php
// list() returns an array of Subtype records (throws on error).
$subtypes = $client->Subtype()->list();
```


### Supertype

Create an instance: `$supertype = $client->Supertype();`

#### Operations

| Method | Description |
| --- | --- |
| `list(match)` | List entities matching the criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `supertypes` | `array` |  |

#### Example: List

```php
// list() returns an array of Supertype records (throws on error).
$supertypes = $client->Supertype()->list();
```


### Type

Create an instance: `$type = $client->Type();`

#### Operations

| Method | Description |
| --- | --- |
| `list(match)` | List entities matching the criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `types` | `array` |  |

#### Example: List

```php
// list() returns an array of Type records (throws on error).
$types = $client->Type()->list();
```

## Features

This SDK ships 4 optional features. Each is **inactive until you
switch it on**, so an SDK you have not configured behaves exactly as if none of
them existed — no retries, no cache, no logging, no measurable overhead.

Activate a feature by name in the client options, alongside the options shown
above:

| Feature | What it does |
|---|---|
| [`ratelimit`](#ratelimit) | Client-side rate limiting via a token bucket |
| [`retry`](#retry) | Automatic retry of transient failures with exponential backoff |
| [`test`](#test) | In-memory mock transport for testing without a live server |
| [`timeout`](#timeout) | Per-request timeout with transport abort |

> **Order matters for `ratelimit`, `retry`, `timeout`.** These wrap the
> transport, so each one wraps whatever is already installed: the order you
> activate them in IS the nesting order. Activating them as an ordered list
> rather than a map is what fixes that order.

### ratelimit

Client-side rate limiting via a token bucket.

| Option | Default |
|---|---|
| `active` | `false` |
| `burst` | `5` |
| `rate` | `5` |

Set `feature.ratelimit.active` to enable it, then override any of the options above.

`ratelimit` wraps the transport, so its position among the other
transport features decides what it sees. A feature activated later wraps one
activated earlier.

### retry

Automatic retry of transient failures with exponential backoff.

| Option | Default |
|---|---|
| `active` | `false` |
| `factor` | `2` |
| `maxDelay` | `2000` |
| `minDelay` | `50` |
| `retries` | `2` |
| `statuses` | `[408, 425, 429, 500, 502, 503, 504]` |

Set `feature.retry.active` to enable it, then override any of the options above.

`retry` wraps the transport, so its position among the other
transport features decides what it sees. A feature activated later wraps one
activated earlier.

### test

In-memory mock transport for testing without a live server.

| Option | Default |
|---|---|
| `active` | `false` |

Set `feature.test.active` to enable it, then override any of the options above.

### timeout

Per-request timeout with transport abort.

| Option | Default |
|---|---|
| `active` | `false` |
| `ms` | `30000` |

Set `feature.timeout.active` to enable it, then override any of the options above.

`timeout` wraps the transport, so its position among the other
transport features decides what it sees. A feature activated later wraps one
activated earlier.


## Advanced

> The sections above cover everyday use. The material below explains the
> SDK's internals — useful when extending it with custom features, but not
> needed for normal use.

### The operation pipeline

Every entity operation follows a six-stage pipeline. Each stage fires a
feature hook before executing:

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

If any stage errors, the pipeline short-circuits and the error surfaces
to the caller — see [Error handling](#error-handling) for how that looks
in this language.

### Features and hooks

Features are the extension mechanism. A feature is a PHP class
with hook methods named after pipeline stages (e.g. `PrePoint`,
`PreSpec`). Each method receives the context.

The SDK ships with built-in features:

- **RatelimitFeature**: Client-side rate limiting via a token bucket
- **RetryFeature**: Automatic retry of transient failures with exponential backoff
- **TestFeature**: In-memory mock transport for testing without a live server
- **TimeoutFeature**: Per-request timeout with transport abort

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

Entity instances are stateful. After a successful `list`, the entity
stores the returned data and match criteria internally.

```php
$format = $client->Format();
$format->list();

// $format->data_get() now returns the format data from the last list
// $format->match_get() returns the last match criteria
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
