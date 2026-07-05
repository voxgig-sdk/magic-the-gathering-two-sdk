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
| `artist` | `string` | No |  |
| `border` | `string` | No |  |
| `card` | `table` | No |  |
| `cmc` | `number` | No |  |
| `color` | `table` | No |  |
| `color_identity` | `table` | No |  |
| `flavor` | `string` | No |  |
| `foreign_name` | `table` | No |  |
| `hand` | `number` | No |  |
| `id` | `string` | No |  |
| `image_url` | `string` | No |  |
| `layout` | `string` | No |  |
| `legality` | `table` | No |  |
| `life` | `number` | No |  |
| `loyalty` | `string` | No |  |
| `mana_cost` | `string` | No |  |
| `multiverseid` | `number` | No |  |
| `name` | `string` | No |  |
| `number` | `string` | No |  |
| `original_text` | `string` | No |  |
| `original_type` | `string` | No |  |
| `power` | `string` | No |  |
| `printing` | `table` | No |  |
| `rarity` | `string` | No |  |
| `release_date` | `string` | No |  |
| `reserved` | `boolean` | No |  |
| `ruling` | `table` | No |  |
| `set` | `string` | No |  |
| `set_name` | `string` | No |  |
| `source` | `string` | No |  |
| `starter` | `boolean` | No |  |
| `subtype` | `table` | No |  |
| `supertype` | `table` | No |  |
| `text` | `string` | No |  |
| `timeshifted` | `boolean` | No |  |
| `toughness` | `string` | No |  |
| `type` | `string` | No |  |
| `variation` | `table` | No |  |
| `watermark` | `string` | No |  |

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
| `format` | `table` | No |  |

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
| `block` | `string` | No |  |
| `booster` | `table` | No |  |
| `border` | `string` | No |  |
| `code` | `string` | No |  |
| `gatherer_code` | `string` | No |  |
| `magic_cards_info_code` | `string` | No |  |
| `mkm_id` | `number` | No |  |
| `mkm_name` | `string` | No |  |
| `name` | `string` | No |  |
| `online_only` | `boolean` | No |  |
| `release_date` | `string` | No |  |
| `set` | `table` | No |  |
| `type` | `string` | No |  |

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
| `artist` | `string` | No |  |
| `border` | `string` | No |  |
| `cmc` | `number` | No |  |
| `color` | `table` | No |  |
| `color_identity` | `table` | No |  |
| `flavor` | `string` | No |  |
| `foreign_name` | `table` | No |  |
| `hand` | `number` | No |  |
| `id` | `string` | No |  |
| `image_url` | `string` | No |  |
| `layout` | `string` | No |  |
| `legality` | `table` | No |  |
| `life` | `number` | No |  |
| `loyalty` | `string` | No |  |
| `mana_cost` | `string` | No |  |
| `multiverseid` | `number` | No |  |
| `name` | `string` | No |  |
| `number` | `string` | No |  |
| `original_text` | `string` | No |  |
| `original_type` | `string` | No |  |
| `power` | `string` | No |  |
| `printing` | `table` | No |  |
| `rarity` | `string` | No |  |
| `release_date` | `string` | No |  |
| `reserved` | `boolean` | No |  |
| `ruling` | `table` | No |  |
| `set` | `string` | No |  |
| `set_name` | `string` | No |  |
| `source` | `string` | No |  |
| `starter` | `boolean` | No |  |
| `subtype` | `table` | No |  |
| `supertype` | `table` | No |  |
| `text` | `string` | No |  |
| `timeshifted` | `boolean` | No |  |
| `toughness` | `string` | No |  |
| `type` | `string` | No |  |
| `variation` | `table` | No |  |
| `watermark` | `string` | No |  |

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
| `subtype` | `table` | No |  |

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
| `supertype` | `table` | No |  |

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
| `type` | `table` | No |  |

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

