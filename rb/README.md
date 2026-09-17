# MagicTheGatheringTwo Ruby SDK



The Ruby SDK for the MagicTheGatheringTwo API — an entity-oriented client using idiomatic Ruby conventions.

The SDK exposes the API as capitalised, semantic **Entities** — for example `client.Card` — with named operations (`list`/`load`) instead of raw URL paths and query strings. Working with resources and verbs keeps call sites self-describing and reduces cognitive load.

> Other languages, the CLI, and MCP server live alongside this one — see
> the [top-level README](../README.md).


## Install
This package is not yet published to RubyGems. Install it from the
GitHub release tag (`rb/vX.Y.Z`):

- Releases: [https://github.com/voxgig-sdk/magic-the-gathering-two-sdk/releases](https://github.com/voxgig-sdk/magic-the-gathering-two-sdk/releases)


## Tutorial: your first API call

This tutorial walks through creating a client, listing entities, and
loading a specific record.

### 1. Create a client

```ruby
require_relative "MagicTheGatheringTwo_sdk"

client = MagicTheGatheringTwoSDK.new
```

### 2. List card records

```ruby
begin
  # list returns an Array of Card records — iterate directly.
  cards = client.Card.list
  cards.each do |item|
    puts "#{item["id"]} #{item["artist"]}"
  end
rescue => err
  warn "list failed: #{err}"
end
```

### 3. Load a card

```ruby
begin
  # load returns the ENTITY — call data_get for the Card record (raises on error).
  card = client.Card.load({ "id" => "example_id" })
  puts card
rescue => err
  warn "load failed: #{err}"
end
```


## Error handling

Entity operations raise on failure, so rescue them:

```ruby
begin
  formats = client.Format.list()
rescue => err
  warn "list failed: #{err}"
end
```

`direct` does **not** raise — it returns the result hash. Branch on
`ok`; on failure `status` holds the HTTP status (for error responses) and
`err` holds a transport error, so read both defensively:

```ruby
result = client.direct({
  "path" => "/api/resource/{id}",
  "method" => "GET",
  "params" => { "id" => "example_id" },
})

warn "request failed: #{result["err"] || "HTTP #{result["status"]}"}" unless result["ok"]
```


## How-to guides

### Make a direct HTTP request

For endpoints not covered by entity methods:

```ruby
result = client.direct({
  "path" => "/api/resource/{id}",
  "method" => "GET",
  "params" => { "id" => "example" },
})

if result["ok"]
  puts result["status"]  # 200
  puts result["data"]    # response body
else
  # On an HTTP error status there is no err (only a transport failure sets
  # it), so fall back to the status code.
  warn(result["err"] || "HTTP #{result["status"]}")
end
```

### Prepare a request without sending it

```ruby
begin
  fetchdef = client.prepare({
    "path" => "/api/resource/{id}",
    "method" => "DELETE",
    "params" => { "id" => "example" },
  })
  puts fetchdef["url"]
  puts fetchdef["method"]
  puts fetchdef["headers"]
rescue => err
  warn "prepare failed: #{err}"
end
```

### Use test mode

Create a mock client for unit testing — no server required:

```ruby
client = MagicTheGatheringTwoSDK.test

# Entity ops return the ENTITY (raises on error);
# call data_get for the mock record.
format = client.Format.list()
puts format
```

### Use a custom fetch function

Replace the HTTP transport with your own function:

```ruby
mock_fetch = ->(url, init) {
  return {
    "status" => 200,
    "statusText" => "OK",
    "headers" => {},
    "json" => ->() { { "id" => "mock01" } },
  }, nil
}

client = MagicTheGatheringTwoSDK.new({
  "base" => "http://localhost:8080",
  "system" => {
    "fetch" => mock_fetch,
  },
})
```

### Run live tests

Create a `.env.local` file at the project root:

```
MAGIC_THE_GATHERING_TWO_TEST_LIVE=TRUE
```

Then run:

```bash
cd rb && ruby -Itest -e "Dir['test/*_test.rb'].each { |f| require_relative f }"
```


## Reference

### MagicTheGatheringTwoSDK

```ruby
require_relative "MagicTheGatheringTwo_sdk"
client = MagicTheGatheringTwoSDK.new(options)
```

Creates a new SDK client.

| Option | Type | Description |
| --- | --- | --- |
| `base` | `String` | Base URL of the API server. |
| `prefix` | `String` | URL path prefix prepended to all requests. |
| `suffix` | `String` | URL path suffix appended to all requests. |
| `feature` | `Hash` | Feature activation flags. |
| `extend` | `Hash` | Additional Feature instances to load. |
| `system` | `Hash` | System overrides (e.g. custom `fetch` lambda). |

### test

```ruby
client = MagicTheGatheringTwoSDK.test(testopts, sdkopts)
```

Creates a test-mode client with mock transport. Both arguments may be `nil`.

### MagicTheGatheringTwoSDK methods

| Method | Signature | Description |
| --- | --- | --- |
| `options_map` | `() -> Hash` | Deep copy of current SDK options. |
| `get_utility` | `() -> Utility` | Copy of the SDK utility object. |
| `prepare` | `(fetchargs) -> Hash` | Build an HTTP request definition without sending. Raises on error. |
| `direct` | `(fetchargs) -> Hash` | Build and send an HTTP request. Returns a result hash (`result["ok"]`); does not raise. |
| `Card` | `(data) -> CardEntity` | Create a Card entity instance. |
| `Format` | `(data) -> FormatEntity` | Create a Format entity instance. |
| `Set` | `(data) -> SetEntity` | Create a Set entity instance. |
| `SetBooster` | `(data) -> SetBoosterEntity` | Create a SetBooster entity instance. |
| `Subtype` | `(data) -> SubtypeEntity` | Create a Subtype entity instance. |
| `Supertype` | `(data) -> SupertypeEntity` | Create a Supertype entity instance. |
| `Type` | `(data) -> TypeEntity` | Create a Type entity instance. |

### Entity interface

All entities share the same interface.

| Method | Signature | Description |
| --- | --- | --- |
| `load` | `(reqmatch, ctrl) -> any` | Load a single entity by match criteria. Raises on error. |
| `list` | `(reqmatch = nil, ctrl) -> Array` | List entities matching the criteria (call with no argument to list all). Raises on error. |
| `data_get` | `() -> Hash` | Get entity data. |
| `data_set` | `(data)` | Set entity data. |
| `match_get` | `() -> Hash` | Get entity match criteria. |
| `match_set` | `(match)` | Set entity match criteria. |
| `make` | `() -> Entity` | Create a new instance with the same options. |
| `get_name` | `() -> String` | Return the entity name. |

### Result shape

Entity operations return the result data directly. On failure they
raise a `MagicTheGatheringTwoError` (a `StandardError` subclass), so wrap
calls in `begin`/`rescue` where you need to handle errors.

The `direct` escape hatch is the exception: it never raises and instead
returns a result `Hash` with these keys:

| Key | Type | Description |
| --- | --- | --- |
| `ok` | `Boolean` | `true` if the HTTP status is 2xx. |
| `status` | `Integer` | HTTP status code. |
| `headers` | `Hash` | Response headers. |
| `data` | `any` | Parsed JSON response body. |
| `err` | `Error` | Present when `ok` is `false`. |

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

Create an instance: `card = client.Card`

#### Operations

| Method | Description |
| --- | --- |
| `list(match)` | List entities matching the criteria. |
| `load(match)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `artist` | `String` | The artist of the card |
| `border` | `String` | The border color if different from the set default |
| `cmc` | `Float` | Converted mana cost |
| `colorIdentity` | `Array` | The card's color identity by color code |
| `colors` | `Array` | The card colors |
| `flavor` | `String` | The flavor text of the card |
| `foreignNames` | `Array` | Foreign language names for the card |
| `hand` | `Integer` | Maximum hand size modifier (Vanguard cards only) |
| `id` | `String` | A unique id for this card (SHA1 hash) |
| `imageUrl` | `String` | The image URL for the card |
| `layout` | `String` | The card layout |
| `legalities` | `Array` | Which formats this card is legal, restricted or banned in |
| `life` | `Integer` | Starting life total modifier (Vanguard cards only) |
| `loyalty` | `String` | The loyalty of the card (planeswalkers only) |
| `manaCost` | `String` | The mana cost of the card |
| `multiverseid` | `Integer` | The multiverseid of the card on Wizard's Gatherer |
| `name` | `String` | The card name |
| `names` | `Array` | Only used for split, flip and dual cards. |
| `number` | `String` | The card number |
| `originalText` | `String` | The original text on the card at the time it was printed |
| `originalType` | `String` | The original type on the card at the time it was printed |
| `power` | `String` | The power of the card (creatures only) |
| `printings` | `Array` | The sets that this card was printed in |
| `rarity` | `String` | The rarity of the card |
| `releaseDate` | `String` | The release date for promo cards |
| `reserved` | `Boolean` | True if this card is reserved by Wizards Official Reprint Policy |
| `rulings` | `Array` | The rulings for the card |
| `set` | `String` | The set code the card belongs to |
| `setName` | `String` | The set name the card belongs to |
| `source` | `String` | For promo cards, where the card was originally obtained |
| `starter` | `Boolean` | True if this card was only released as part of a core box set |
| `subtypes` | `Array` | The subtypes of the card |
| `supertypes` | `Array` | The supertypes of the card |
| `text` | `String` | The oracle text of the card |
| `timeshifted` | `Boolean` | True if this card was timeshifted in the set |
| `toughness` | `String` | The toughness of the card (creatures only) |
| `type` | `String` | The card type |
| `types` | `Array` | The types of the card |
| `variations` | `Array` | Multiverseids of alternate art variations |
| `watermark` | `String` | The watermark on the card |

#### Example: Load

```ruby
# load returns the ENTITY — call data_get for the Card record (raises on error).
card = client.Card.load({ "id" => "card_id" })
```

#### Example: List

```ruby
# list returns an Array of Card records (raises on error).
cards = client.Card.list
```


### Format

Create an instance: `format = client.Format`

#### Operations

| Method | Description |
| --- | --- |
| `list(match)` | List entities matching the criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `formats` | `Array` |  |

#### Example: List

```ruby
# list returns an Array of Format records (raises on error).
formats = client.Format.list
```


### Set

Create an instance: `set = client.Set`

#### Operations

| Method | Description |
| --- | --- |
| `list(match)` | List entities matching the criteria. |
| `load(match)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `block` | `String` | The block the set belongs to |
| `booster` | `Array` | Booster pack configuration |
| `border` | `String` | The border color of the set |
| `code` | `String` | The set code |
| `gathererCode` | `String` | The Gatherer code for the set |
| `id` | `String` |  |
| `magicCardsInfoCode` | `String` | The Magic Cards Info code for the set |
| `mkm_id` | `Integer` | The Magic Card Market set ID |
| `mkm_name` | `String` | The Magic Card Market set name |
| `name` | `String` | The name of the set |
| `onlineOnly` | `Boolean` | True if the set is online only |
| `releaseDate` | `String` | The release date of the set |
| `type` | `String` | The type of the set |

#### Example: Load

```ruby
# load returns the ENTITY — call data_get for the Set record (raises on error).
set = client.Set.load({ "id" => "set_id" })
```

#### Example: List

```ruby
# list returns an Array of Set records (raises on error).
sets = client.Set.list
```


### SetBooster

Create an instance: `set_booster = client.SetBooster`

#### Operations

| Method | Description |
| --- | --- |
| `list(match)` | List entities matching the criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `artist` | `String` | The artist of the card |
| `border` | `String` | The border color if different from the set default |
| `cmc` | `Float` | Converted mana cost |
| `colorIdentity` | `Array` | The card's color identity by color code |
| `colors` | `Array` | The card colors |
| `flavor` | `String` | The flavor text of the card |
| `foreignNames` | `Array` | Foreign language names for the card |
| `hand` | `Integer` | Maximum hand size modifier (Vanguard cards only) |
| `id` | `String` | A unique id for this card (SHA1 hash) |
| `imageUrl` | `String` | The image URL for the card |
| `layout` | `String` | The card layout |
| `legalities` | `Array` | Which formats this card is legal, restricted or banned in |
| `life` | `Integer` | Starting life total modifier (Vanguard cards only) |
| `loyalty` | `String` | The loyalty of the card (planeswalkers only) |
| `manaCost` | `String` | The mana cost of the card |
| `multiverseid` | `Integer` | The multiverseid of the card on Wizard's Gatherer |
| `name` | `String` | The card name |
| `names` | `Array` | Only used for split, flip and dual cards. |
| `number` | `String` | The card number |
| `originalText` | `String` | The original text on the card at the time it was printed |
| `originalType` | `String` | The original type on the card at the time it was printed |
| `power` | `String` | The power of the card (creatures only) |
| `printings` | `Array` | The sets that this card was printed in |
| `rarity` | `String` | The rarity of the card |
| `releaseDate` | `String` | The release date for promo cards |
| `reserved` | `Boolean` | True if this card is reserved by Wizards Official Reprint Policy |
| `rulings` | `Array` | The rulings for the card |
| `set` | `String` | The set code the card belongs to |
| `setName` | `String` | The set name the card belongs to |
| `source` | `String` | For promo cards, where the card was originally obtained |
| `starter` | `Boolean` | True if this card was only released as part of a core box set |
| `subtypes` | `Array` | The subtypes of the card |
| `supertypes` | `Array` | The supertypes of the card |
| `text` | `String` | The oracle text of the card |
| `timeshifted` | `Boolean` | True if this card was timeshifted in the set |
| `toughness` | `String` | The toughness of the card (creatures only) |
| `type` | `String` | The card type |
| `types` | `Array` | The types of the card |
| `variations` | `Array` | Multiverseids of alternate art variations |
| `watermark` | `String` | The watermark on the card |

#### Example: List

```ruby
# list returns an Array of SetBooster records (raises on error).
set_boosters = client.SetBooster.list
```


### Subtype

Create an instance: `subtype = client.Subtype`

#### Operations

| Method | Description |
| --- | --- |
| `list(match)` | List entities matching the criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `subtypes` | `Array` |  |

#### Example: List

```ruby
# list returns an Array of Subtype records (raises on error).
subtypes = client.Subtype.list
```


### Supertype

Create an instance: `supertype = client.Supertype`

#### Operations

| Method | Description |
| --- | --- |
| `list(match)` | List entities matching the criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `supertypes` | `Array` |  |

#### Example: List

```ruby
# list returns an Array of Supertype records (raises on error).
supertypes = client.Supertype.list
```


### Type

Create an instance: `type = client.Type`

#### Operations

| Method | Description |
| --- | --- |
| `list(match)` | List entities matching the criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `types` | `Array` |  |

#### Example: List

```ruby
# list returns an Array of Type records (raises on error).
types = client.Type.list
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

Features are the extension mechanism. A feature is a Ruby class
with hook methods named after pipeline stages (e.g. `PrePoint`,
`PreSpec`). Each method receives the context.

The SDK ships with built-in features:

- **RatelimitFeature**: Client-side rate limiting via a token bucket
- **RetryFeature**: Automatic retry of transient failures with exponential backoff
- **TestFeature**: In-memory mock transport for testing without a live server
- **TimeoutFeature**: Per-request timeout with transport abort

Features are initialized in order. Hooks fire in the order features
were added, so later features can override earlier ones.

### Data as hashes

The Ruby SDK uses plain Ruby hashes throughout rather than typed
objects. This mirrors the dynamic nature of the API and keeps the
SDK flexible — no code generation is needed when the API schema
changes.

Use `Helpers.to_map()` to safely validate that a value is a hash.

### Module structure

```
rb/
├── MagicTheGatheringTwo_sdk.rb       -- Main SDK module
├── config.rb                  -- Configuration
├── schema.rb                  -- Generated option + entity specs
├── features.rb                -- Feature factory
├── core/                      -- Core types and context
├── entity/                    -- Entity implementations
├── feature/                   -- Built-in features (Base, Test, Log)
├── utility/                   -- Utility functions and struct library
└── test/                      -- Test suites
```

The main module (`MagicTheGatheringTwo_sdk`) exports the SDK class
and test helper. Import entity or utility modules directly only
when needed.

### Entity state

Entity instances are stateful. After a successful `list`, the entity
stores the returned data and match criteria internally.

```ruby
format = client.Format
format.list()

# format.data_get now returns the format data from the last list
# format.match_get returns the last match criteria
```

Call `make` to create a fresh instance with the same configuration
but no stored state.

### Direct vs entity access

The entity interface handles URL construction, parameter placement,
and response parsing automatically. Use it for standard CRUD operations.

`direct` gives full control over the HTTP request. Use it for
non-standard endpoints, bulk operations, or any path not modelled as
an entity. `prepare` builds the request without sending it — useful
for debugging or custom transport.


## Full Reference

See [REFERENCE.md](REFERENCE.md) for complete API reference
documentation including all method signatures, entity field schemas,
and detailed usage examples.
