# MagicTheGatheringTwo Lua SDK Reference

Complete API reference for the MagicTheGatheringTwo Lua SDK.


## MagicTheGatheringTwoSDK

### Constructor

```lua
local sdk = require("magic-the-gathering-two_sdk")
local client = sdk.new(options)
```

Create a new SDK client instance.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `options` | `table` | SDK configuration options. |
| `options.base` | `string` | Base URL for API requests. |
| `options.prefix` | `string` | URL prefix appended after base. |
| `options.suffix` | `string` | URL suffix appended after path. |
| `options.headers` | `table` | Custom headers for all requests. |
| `options.feature` | `table` | Feature configuration. |
| `options.system` | `table` | System overrides (e.g. custom fetch). |


### Static Methods

#### `sdk.test(testopts?, sdkopts?)`

Create a test client with mock features active. Both arguments are optional.

```lua
local client = sdk.test()
```


### Instance Methods

#### `Card(data)`

Create a new `Card` entity instance. Pass `nil` for no initial data.

#### `Format(data)`

Create a new `Format` entity instance. Pass `nil` for no initial data.

#### `Set(data)`

Create a new `Set` entity instance. Pass `nil` for no initial data.

#### `SetBooster(data)`

Create a new `SetBooster` entity instance. Pass `nil` for no initial data.

#### `Subtype(data)`

Create a new `Subtype` entity instance. Pass `nil` for no initial data.

#### `Supertype(data)`

Create a new `Supertype` entity instance. Pass `nil` for no initial data.

#### `Type(data)`

Create a new `Type` entity instance. Pass `nil` for no initial data.

#### `options_map() -> table`

Return a deep copy of the current SDK options.

#### `get_utility() -> Utility`

Return a copy of the SDK utility object.

#### `direct(fetchargs) -> table, err`

Make a direct HTTP request to any API endpoint.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `fetchargs.path` | `string` | URL path with optional `{param}` placeholders. |
| `fetchargs.method` | `string` | HTTP method (default: `"GET"`). |
| `fetchargs.params` | `table` | Path parameter values for `{param}` substitution. |
| `fetchargs.query` | `table` | Query string parameters. |
| `fetchargs.headers` | `table` | Request headers (merged with defaults). |
| `fetchargs.body` | `any` | Request body (tables are JSON-serialized). |
| `fetchargs.ctrl` | `table` | Control options (e.g. `{ explain = true }`). |

**Returns:** `table, err`

#### `prepare(fetchargs) -> table, err`

Prepare a fetch definition without sending the request. Accepts the
same parameters as `direct()`.

**Returns:** `table, err`


---

## CardEntity

```lua
local card = client:Card(nil)
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `artist` | `string` | No | The artist of the card |
| `border` | `string` | No | The border color if different from the set default |
| `cmc` | `number` | No | Converted mana cost |
| `colorIdentity` | `table` | No | The card's color identity by color code |
| `colors` | `table` | No | The card colors |
| `flavor` | `string` | No | The flavor text of the card |
| `foreignNames` | `table` | No | Foreign language names for the card |
| `hand` | `number` | No | Maximum hand size modifier (Vanguard cards only) |
| `id` | `string` | No | A unique id for this card (SHA1 hash) |
| `imageUrl` | `string` | No | The image URL for the card |
| `layout` | `string` | No | The card layout |
| `legalities` | `table` | No | Which formats this card is legal, restricted or banned in |
| `life` | `number` | No | Starting life total modifier (Vanguard cards only) |
| `loyalty` | `string` | No | The loyalty of the card (planeswalkers only) |
| `manaCost` | `string` | No | The mana cost of the card |
| `multiverseid` | `number` | No | The multiverseid of the card on Wizard's Gatherer |
| `name` | `string` | No | The card name |
| `names` | `table` | No | Only used for split, flip and dual cards. |
| `number` | `string` | No | The card number |
| `originalText` | `string` | No | The original text on the card at the time it was printed |
| `originalType` | `string` | No | The original type on the card at the time it was printed |
| `power` | `string` | No | The power of the card (creatures only) |
| `printings` | `table` | No | The sets that this card was printed in |
| `rarity` | `string` | No | The rarity of the card |
| `releaseDate` | `string` | No | The release date for promo cards |
| `reserved` | `boolean` | No | True if this card is reserved by Wizards Official Reprint Policy |
| `rulings` | `table` | No | The rulings for the card |
| `set` | `string` | No | The set code the card belongs to |
| `setName` | `string` | No | The set name the card belongs to |
| `source` | `string` | No | For promo cards, where the card was originally obtained |
| `starter` | `boolean` | No | True if this card was only released as part of a core box set |
| `subtypes` | `table` | No | The subtypes of the card |
| `supertypes` | `table` | No | The supertypes of the card |
| `text` | `string` | No | The oracle text of the card |
| `timeshifted` | `boolean` | No | True if this card was timeshifted in the set |
| `toughness` | `string` | No | The toughness of the card (creatures only) |
| `type` | `string` | No | The card type |
| `types` | `table` | No | The types of the card |
| `variations` | `table` | No | Multiverseids of alternate art variations |
| `watermark` | `string` | No | The watermark on the card |

### Operations

#### `list(reqmatch, ctrl) -> any, err`

List entities matching the given criteria. Returns an array.

```lua
local results, err = client:Card():list()
```

#### `load(reqmatch, ctrl) -> any, err`

Load a single entity matching the given criteria.

```lua
local result, err = client:Card():load({ id = "card_id" })
```

### Common Methods

#### `data_get() -> table`

Get the entity data. Returns a copy of the current data.

#### `data_set(data)`

Set the entity data.

#### `match_get() -> table`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make() -> Entity`

Create a new `CardEntity` instance with the same client and
options.

#### `get_name() -> string`

Return the entity name.


---

## FormatEntity

```lua
local format = client:Format(nil)
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `formats` | `table` | No |  |

### Operations

#### `list(reqmatch, ctrl) -> any, err`

List entities matching the given criteria. Returns an array.

```lua
local results, err = client:Format():list()
```

### Common Methods

#### `data_get() -> table`

Get the entity data. Returns a copy of the current data.

#### `data_set(data)`

Set the entity data.

#### `match_get() -> table`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make() -> Entity`

Create a new `FormatEntity` instance with the same client and
options.

#### `get_name() -> string`

Return the entity name.


---

## SetEntity

```lua
local set = client:Set(nil)
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `block` | `string` | No | The block the set belongs to |
| `booster` | `table` | No | Booster pack configuration |
| `border` | `string` | No | The border color of the set |
| `code` | `string` | No | The set code |
| `gathererCode` | `string` | No | The Gatherer code for the set |
| `id` | `string` | No |  |
| `magicCardsInfoCode` | `string` | No | The Magic Cards Info code for the set |
| `mkm_id` | `number` | No | The Magic Card Market set ID |
| `mkm_name` | `string` | No | The Magic Card Market set name |
| `name` | `string` | No | The name of the set |
| `onlineOnly` | `boolean` | No | True if the set is online only |
| `releaseDate` | `string` | No | The release date of the set |
| `type` | `string` | No | The type of the set |

### Operations

#### `list(reqmatch, ctrl) -> any, err`

List entities matching the given criteria. Returns an array.

```lua
local results, err = client:Set():list()
```

#### `load(reqmatch, ctrl) -> any, err`

Load a single entity matching the given criteria.

```lua
local result, err = client:Set():load({ id = "set_id" })
```

### Common Methods

#### `data_get() -> table`

Get the entity data. Returns a copy of the current data.

#### `data_set(data)`

Set the entity data.

#### `match_get() -> table`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make() -> Entity`

Create a new `SetEntity` instance with the same client and
options.

#### `get_name() -> string`

Return the entity name.


---

## SetBoosterEntity

```lua
local set_booster = client:SetBooster(nil)
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `artist` | `string` | No | The artist of the card |
| `border` | `string` | No | The border color if different from the set default |
| `cmc` | `number` | No | Converted mana cost |
| `colorIdentity` | `table` | No | The card's color identity by color code |
| `colors` | `table` | No | The card colors |
| `flavor` | `string` | No | The flavor text of the card |
| `foreignNames` | `table` | No | Foreign language names for the card |
| `hand` | `number` | No | Maximum hand size modifier (Vanguard cards only) |
| `id` | `string` | No | A unique id for this card (SHA1 hash) |
| `imageUrl` | `string` | No | The image URL for the card |
| `layout` | `string` | No | The card layout |
| `legalities` | `table` | No | Which formats this card is legal, restricted or banned in |
| `life` | `number` | No | Starting life total modifier (Vanguard cards only) |
| `loyalty` | `string` | No | The loyalty of the card (planeswalkers only) |
| `manaCost` | `string` | No | The mana cost of the card |
| `multiverseid` | `number` | No | The multiverseid of the card on Wizard's Gatherer |
| `name` | `string` | No | The card name |
| `names` | `table` | No | Only used for split, flip and dual cards. |
| `number` | `string` | No | The card number |
| `originalText` | `string` | No | The original text on the card at the time it was printed |
| `originalType` | `string` | No | The original type on the card at the time it was printed |
| `power` | `string` | No | The power of the card (creatures only) |
| `printings` | `table` | No | The sets that this card was printed in |
| `rarity` | `string` | No | The rarity of the card |
| `releaseDate` | `string` | No | The release date for promo cards |
| `reserved` | `boolean` | No | True if this card is reserved by Wizards Official Reprint Policy |
| `rulings` | `table` | No | The rulings for the card |
| `set` | `string` | No | The set code the card belongs to |
| `setName` | `string` | No | The set name the card belongs to |
| `source` | `string` | No | For promo cards, where the card was originally obtained |
| `starter` | `boolean` | No | True if this card was only released as part of a core box set |
| `subtypes` | `table` | No | The subtypes of the card |
| `supertypes` | `table` | No | The supertypes of the card |
| `text` | `string` | No | The oracle text of the card |
| `timeshifted` | `boolean` | No | True if this card was timeshifted in the set |
| `toughness` | `string` | No | The toughness of the card (creatures only) |
| `type` | `string` | No | The card type |
| `types` | `table` | No | The types of the card |
| `variations` | `table` | No | Multiverseids of alternate art variations |
| `watermark` | `string` | No | The watermark on the card |

### Operations

#### `list(reqmatch, ctrl) -> any, err`

List entities matching the given criteria. Returns an array.

```lua
local results, err = client:SetBooster():list()
```

### Common Methods

#### `data_get() -> table`

Get the entity data. Returns a copy of the current data.

#### `data_set(data)`

Set the entity data.

#### `match_get() -> table`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make() -> Entity`

Create a new `SetBoosterEntity` instance with the same client and
options.

#### `get_name() -> string`

Return the entity name.


---

## SubtypeEntity

```lua
local subtype = client:Subtype(nil)
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `subtypes` | `table` | No |  |

### Operations

#### `list(reqmatch, ctrl) -> any, err`

List entities matching the given criteria. Returns an array.

```lua
local results, err = client:Subtype():list()
```

### Common Methods

#### `data_get() -> table`

Get the entity data. Returns a copy of the current data.

#### `data_set(data)`

Set the entity data.

#### `match_get() -> table`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make() -> Entity`

Create a new `SubtypeEntity` instance with the same client and
options.

#### `get_name() -> string`

Return the entity name.


---

## SupertypeEntity

```lua
local supertype = client:Supertype(nil)
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `supertypes` | `table` | No |  |

### Operations

#### `list(reqmatch, ctrl) -> any, err`

List entities matching the given criteria. Returns an array.

```lua
local results, err = client:Supertype():list()
```

### Common Methods

#### `data_get() -> table`

Get the entity data. Returns a copy of the current data.

#### `data_set(data)`

Set the entity data.

#### `match_get() -> table`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make() -> Entity`

Create a new `SupertypeEntity` instance with the same client and
options.

#### `get_name() -> string`

Return the entity name.


---

## TypeEntity

```lua
local type = client:Type(nil)
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `types` | `table` | No |  |

### Operations

#### `list(reqmatch, ctrl) -> any, err`

List entities matching the given criteria. Returns an array.

```lua
local results, err = client:Type():list()
```

### Common Methods

#### `data_get() -> table`

Get the entity data. Returns a copy of the current data.

#### `data_set(data)`

Set the entity data.

#### `match_get() -> table`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make() -> Entity`

Create a new `TypeEntity` instance with the same client and
options.

#### `get_name() -> string`

Return the entity name.


---

## Features

| Feature | Version | Description |
| --- | --- | --- |
| `test` | 0.0.1 | In-memory mock transport for testing without a live server |


Features are activated via the `feature` option:

```lua
local client = sdk.new({
  feature = {
    test = { active = true },
  },
})
```

