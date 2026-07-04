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
| `format` | ``$ARRAY`` | No |  |

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
| `subtype` | ``$ARRAY`` | No |  |

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
| `supertype` | ``$ARRAY`` | No |  |

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
| `type` | ``$ARRAY`` | No |  |

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

