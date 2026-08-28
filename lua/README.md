# MagicTheGatheringTwo Lua SDK



The Lua SDK for the MagicTheGatheringTwo API — an entity-oriented client using Lua conventions.

It exposes the API as capitalised, semantic **Entities** — e.g. `client:Card()` — each with the same small set of operations (`list`, `load`) instead of raw URL paths and query strings. You call meaning, not endpoints, which keeps the cognitive load low.

> Other languages, the CLI, and MCP server live alongside this one — see
> the [top-level README](../README.md).


## Install
This package is not yet published to LuaRocks. Install it from the
GitHub release tag (`lua/vX.Y.Z`, see [Releases](https://github.com/voxgig-sdk/magic-the-gathering-two-sdk/releases)),
or add the source directory to your `LUA_PATH`:

```bash
export LUA_PATH="path/to/lua/?.lua;path/to/lua/?/init.lua;;"
```


## Tutorial: your first API call

This tutorial walks through creating a client, listing entities, and
loading a specific record.

### 1. Create a client

```lua
local sdk = require("magic-the-gathering-two_sdk")

local client = sdk.new()
```

### 2. List card records

Entity operations return `(value, err)`. For `list`, `value` is the
array of records itself — iterate it directly (there is no wrapper).

```lua
local cards, err = client:Card():list()
if err then error(err) end

for _, item in ipairs(cards) do
  print(item["id"], item["artist"])
end
```

### 3. Load a card

```lua
local card, err = client:Card():load({ id = "example_id" })
if err then error(err) end
print(card)
```


## Error handling

Entity operations return `(value, err)`. Check `err` before using
the value:

```lua
local formats, err = client:Format():list()
if err then error(err) end
```

`direct` follows the same `(value, err)` convention:

```lua
local result, err = client:direct({
  path = "/api/resource/{id}",
  method = "GET",
  params = { id = "example_id" },
})
if err then error(err) end
```


## How-to guides

### Make a direct HTTP request

For endpoints not covered by entity methods:

```lua
local result, err = client:direct({
  path = "/api/resource/{id}",
  method = "GET",
  params = { id = "example" },
})
if err then error(err) end

if result["ok"] then
  print(result["status"])  -- 200
  print(result["data"])    -- response body
end
```

### Prepare a request without sending it

```lua
local fetchdef, err = client:prepare({
  path = "/api/resource/{id}",
  method = "DELETE",
  params = { id = "example" },
})
if err then error(err) end

print(fetchdef["url"])
print(fetchdef["method"])
print(fetchdef["headers"])
```

### Use test mode

Create a mock client for unit testing — no server required:

```lua
local client = sdk.test()

local result, err = client:Format():list()
-- result is the returned data; err is set on failure
```

### Use a custom fetch function

Replace the HTTP transport with your own function:

```lua
local function mock_fetch(url, init)
  return {
    status = 200,
    statusText = "OK",
    headers = {},
    json = function()
      return { id = "mock01" }
    end,
  }, nil
end

local client = sdk.new({
  base = "http://localhost:8080",
  system = {
    fetch = mock_fetch,
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
cd lua && busted test/
```


## Reference

### MagicTheGatheringTwoSDK

```lua
local sdk = require("magic-the-gathering-two_sdk")
local client = sdk.new(options)
```

Creates a new SDK client.

| Option | Type | Description |
| --- | --- | --- |
| `base` | `string` | Base URL of the API server. |
| `prefix` | `string` | URL path prefix prepended to all requests. |
| `suffix` | `string` | URL path suffix appended to all requests. |
| `feature` | `table` | Feature activation flags. |
| `extend` | `table` | Additional Feature instances to load. |
| `system` | `table` | System overrides (e.g. custom `fetch` function). |

### test

```lua
local client = sdk.test(testopts, sdkopts)
```

Creates a test-mode client with mock transport. Both arguments may be `nil`.

### MagicTheGatheringTwoSDK methods

| Method | Signature | Description |
| --- | --- | --- |
| `options_map` | `() -> table` | Deep copy of current SDK options. |
| `get_utility` | `() -> Utility` | Copy of the SDK utility object. |
| `prepare` | `(fetchargs) -> table, err` | Build an HTTP request definition without sending. |
| `direct` | `(fetchargs) -> table, err` | Build and send an HTTP request. |
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
| `load` | `(reqmatch, ctrl) -> any, err` | Load a single entity by match criteria. |
| `list` | `(reqmatch, ctrl) -> any, err` | List entities matching the criteria. |
| `data_get` | `() -> table` | Get entity data. |
| `data_set` | `(data)` | Set entity data. |
| `match_get` | `() -> table` | Get entity match criteria. |
| `match_set` | `(match)` | Set entity match criteria. |
| `make` | `() -> Entity` | Create a new instance with the same options. |
| `get_name` | `() -> string` | Return the entity name. |

### Result shape

Entity operations return `(value, err)`. The `value` is the operation's
data **directly** — there is no wrapper:

| Operation | `value` |
| --- | --- |
| `load` | the entity record (a `table`) |
| `list` | an array (`table`) of entity records |

Check `err` first (it is non-`nil` on failure), then use `value`:

    local card, err = client:Card():load({ id = "example_id" })
    if err then error(err) end
    -- card is the loaded record

Only `direct()` returns a response envelope — a `table` with `ok`,
`status`, `headers`, and `data` keys.

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

Create an instance: `local card = client:Card(nil)`

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
| `cmc` | `number` | Converted mana cost |
| `colorIdentity` | `table` | The card's color identity by color code |
| `colors` | `table` | The card colors |
| `flavor` | `string` | The flavor text of the card |
| `foreignNames` | `table` | Foreign language names for the card |
| `hand` | `number` | Maximum hand size modifier (Vanguard cards only) |
| `id` | `string` | A unique id for this card (SHA1 hash) |
| `imageUrl` | `string` | The image URL for the card |
| `layout` | `string` | The card layout |
| `legalities` | `table` | Which formats this card is legal, restricted or banned in |
| `life` | `number` | Starting life total modifier (Vanguard cards only) |
| `loyalty` | `string` | The loyalty of the card (planeswalkers only) |
| `manaCost` | `string` | The mana cost of the card |
| `multiverseid` | `number` | The multiverseid of the card on Wizard's Gatherer |
| `name` | `string` | The card name |
| `names` | `table` | Only used for split, flip and dual cards. |
| `number` | `string` | The card number |
| `originalText` | `string` | The original text on the card at the time it was printed |
| `originalType` | `string` | The original type on the card at the time it was printed |
| `power` | `string` | The power of the card (creatures only) |
| `printings` | `table` | The sets that this card was printed in |
| `rarity` | `string` | The rarity of the card |
| `releaseDate` | `string` | The release date for promo cards |
| `reserved` | `boolean` | True if this card is reserved by Wizards Official Reprint Policy |
| `rulings` | `table` | The rulings for the card |
| `set` | `string` | The set code the card belongs to |
| `setName` | `string` | The set name the card belongs to |
| `source` | `string` | For promo cards, where the card was originally obtained |
| `starter` | `boolean` | True if this card was only released as part of a core box set |
| `subtypes` | `table` | The subtypes of the card |
| `supertypes` | `table` | The supertypes of the card |
| `text` | `string` | The oracle text of the card |
| `timeshifted` | `boolean` | True if this card was timeshifted in the set |
| `toughness` | `string` | The toughness of the card (creatures only) |
| `type` | `string` | The card type |
| `types` | `table` | The types of the card |
| `variations` | `table` | Multiverseids of alternate art variations |
| `watermark` | `string` | The watermark on the card |

#### Example: Load

```lua
local card, err = client:Card():load({ id = "card_id" })
```

#### Example: List

```lua
local cards, err = client:Card():list()
```


### Format

Create an instance: `local format = client:Format(nil)`

#### Operations

| Method | Description |
| --- | --- |
| `list(match)` | List entities matching the criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `formats` | `table` |  |

#### Example: List

```lua
local formats, err = client:Format():list()
```


### Set

Create an instance: `local set = client:Set(nil)`

#### Operations

| Method | Description |
| --- | --- |
| `list(match)` | List entities matching the criteria. |
| `load(match)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `block` | `string` | The block the set belongs to |
| `booster` | `table` | Booster pack configuration |
| `border` | `string` | The border color of the set |
| `code` | `string` | The set code |
| `gathererCode` | `string` | The Gatherer code for the set |
| `id` | `string` |  |
| `magicCardsInfoCode` | `string` | The Magic Cards Info code for the set |
| `mkm_id` | `number` | The Magic Card Market set ID |
| `mkm_name` | `string` | The Magic Card Market set name |
| `name` | `string` | The name of the set |
| `onlineOnly` | `boolean` | True if the set is online only |
| `releaseDate` | `string` | The release date of the set |
| `type` | `string` | The type of the set |

#### Example: Load

```lua
local set, err = client:Set():load({ id = "set_id" })
```

#### Example: List

```lua
local sets, err = client:Set():list()
```


### SetBooster

Create an instance: `local set_booster = client:SetBooster(nil)`

#### Operations

| Method | Description |
| --- | --- |
| `list(match)` | List entities matching the criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `artist` | `string` | The artist of the card |
| `border` | `string` | The border color if different from the set default |
| `cmc` | `number` | Converted mana cost |
| `colorIdentity` | `table` | The card's color identity by color code |
| `colors` | `table` | The card colors |
| `flavor` | `string` | The flavor text of the card |
| `foreignNames` | `table` | Foreign language names for the card |
| `hand` | `number` | Maximum hand size modifier (Vanguard cards only) |
| `id` | `string` | A unique id for this card (SHA1 hash) |
| `imageUrl` | `string` | The image URL for the card |
| `layout` | `string` | The card layout |
| `legalities` | `table` | Which formats this card is legal, restricted or banned in |
| `life` | `number` | Starting life total modifier (Vanguard cards only) |
| `loyalty` | `string` | The loyalty of the card (planeswalkers only) |
| `manaCost` | `string` | The mana cost of the card |
| `multiverseid` | `number` | The multiverseid of the card on Wizard's Gatherer |
| `name` | `string` | The card name |
| `names` | `table` | Only used for split, flip and dual cards. |
| `number` | `string` | The card number |
| `originalText` | `string` | The original text on the card at the time it was printed |
| `originalType` | `string` | The original type on the card at the time it was printed |
| `power` | `string` | The power of the card (creatures only) |
| `printings` | `table` | The sets that this card was printed in |
| `rarity` | `string` | The rarity of the card |
| `releaseDate` | `string` | The release date for promo cards |
| `reserved` | `boolean` | True if this card is reserved by Wizards Official Reprint Policy |
| `rulings` | `table` | The rulings for the card |
| `set` | `string` | The set code the card belongs to |
| `setName` | `string` | The set name the card belongs to |
| `source` | `string` | For promo cards, where the card was originally obtained |
| `starter` | `boolean` | True if this card was only released as part of a core box set |
| `subtypes` | `table` | The subtypes of the card |
| `supertypes` | `table` | The supertypes of the card |
| `text` | `string` | The oracle text of the card |
| `timeshifted` | `boolean` | True if this card was timeshifted in the set |
| `toughness` | `string` | The toughness of the card (creatures only) |
| `type` | `string` | The card type |
| `types` | `table` | The types of the card |
| `variations` | `table` | Multiverseids of alternate art variations |
| `watermark` | `string` | The watermark on the card |

#### Example: List

```lua
local set_boosters, err = client:SetBooster():list()
```


### Subtype

Create an instance: `local subtype = client:Subtype(nil)`

#### Operations

| Method | Description |
| --- | --- |
| `list(match)` | List entities matching the criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `subtypes` | `table` |  |

#### Example: List

```lua
local subtypes, err = client:Subtype():list()
```


### Supertype

Create an instance: `local supertype = client:Supertype(nil)`

#### Operations

| Method | Description |
| --- | --- |
| `list(match)` | List entities matching the criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `supertypes` | `table` |  |

#### Example: List

```lua
local supertypes, err = client:Supertype():list()
```


### Type

Create an instance: `local type = client:Type(nil)`

#### Operations

| Method | Description |
| --- | --- |
| `list(match)` | List entities matching the criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `types` | `table` |  |

#### Example: List

```lua
local types, err = client:Type():list()
```

## Features

This SDK ships 1 optional features. Each is **inactive until you
switch it on**, so an SDK you have not configured behaves exactly as if none of
them existed — no retries, no cache, no logging, no measurable overhead.

Activate a feature by name in the client options, alongside the options shown
above:

| Feature | What it does |
|---|---|
| [`test`](#test) | In-memory mock transport for testing without a live server |

### test

In-memory mock transport for testing without a live server.

| Option | Default |
|---|---|
| `active` | `false` |

Set `feature.test.active` to enable it, then override any of the options above.


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

Features are the extension mechanism. A feature is a Lua table
with hook methods named after pipeline stages (e.g. `PrePoint`,
`PreSpec`). Each method receives the context.

The SDK ships with built-in features:

- **TestFeature**: In-memory mock transport for testing without a live server

Features are initialized in order. Hooks fire in the order features
were added, so later features can override earlier ones.

### Data as tables

The Lua SDK uses plain Lua tables throughout rather than typed
objects. This mirrors the dynamic nature of the API and keeps the
SDK flexible — no code generation is needed when the API schema
changes.

Use `helpers.to_map()` to safely validate that a value is a table.

### Module structure

```
lua/
├── magic-the-gathering-two_sdk.lua    -- Main SDK module
├── config.lua               -- Configuration
├── features.lua             -- Feature factory
├── core/                    -- Core types and context
├── entity/                  -- Entity implementations
├── feature/                 -- Built-in features (Base, Test, Log)
├── utility/                 -- Utility functions and struct library
└── test/                    -- Test suites
```

The main module (`magic-the-gathering-two_sdk`) exports the SDK constructor
and test helper. Import entity or utility modules directly only
when needed.

### Entity state

Entity instances are stateful. After a successful `list`, the entity
stores the returned data and match criteria internally.

```lua
local format = client:Format()
format:list()

-- format:data_get() now returns the format data from the last list
-- format:match_get() returns the last match criteria
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
