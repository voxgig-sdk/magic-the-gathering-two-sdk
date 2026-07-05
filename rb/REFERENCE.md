# MagicTheGatheringTwo Ruby SDK Reference

Complete API reference for the MagicTheGatheringTwo Ruby SDK.


## MagicTheGatheringTwoSDK

### Constructor

```ruby
require_relative 'MagicTheGatheringTwo_sdk'

client = MagicTheGatheringTwoSDK.new(options)
```

Create a new SDK client instance.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `options` | `Hash` | SDK configuration options. |
| `options["base"]` | `String` | Base URL for API requests. |
| `options["prefix"]` | `String` | URL prefix appended after base. |
| `options["suffix"]` | `String` | URL suffix appended after path. |
| `options["headers"]` | `Hash` | Custom headers for all requests. |
| `options["feature"]` | `Hash` | Feature configuration. |
| `options["system"]` | `Hash` | System overrides (e.g. custom fetch). |


### Static Methods

#### `MagicTheGatheringTwoSDK.test(testopts = nil, sdkopts = nil)`

Create a test client with mock features active. Both arguments may be `nil`.

```ruby
client = MagicTheGatheringTwoSDK.test
```


### Instance Methods

#### `Card(data = nil)`

Create a new `Card` entity instance. Pass `nil` for no initial data.

#### `Format(data = nil)`

Create a new `Format` entity instance. Pass `nil` for no initial data.

#### `Set(data = nil)`

Create a new `Set` entity instance. Pass `nil` for no initial data.

#### `SetBooster(data = nil)`

Create a new `SetBooster` entity instance. Pass `nil` for no initial data.

#### `Subtype(data = nil)`

Create a new `Subtype` entity instance. Pass `nil` for no initial data.

#### `Supertype(data = nil)`

Create a new `Supertype` entity instance. Pass `nil` for no initial data.

#### `Type(data = nil)`

Create a new `Type` entity instance. Pass `nil` for no initial data.

#### `options_map -> Hash`

Return a deep copy of the current SDK options.

#### `get_utility -> Utility`

Return a copy of the SDK utility object.

#### `direct(fetchargs = {}) -> Hash`

Make a direct HTTP request to any API endpoint. Returns a result hash
(`{ "ok" => ..., "status" => ..., "data" => ..., "err" => ... }`); it
does not raise — inspect `result["ok"]`.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `fetchargs["path"]` | `String` | URL path with optional `{param}` placeholders. |
| `fetchargs["method"]` | `String` | HTTP method (default: `"GET"`). |
| `fetchargs["params"]` | `Hash` | Path parameter values for `{param}` substitution. |
| `fetchargs["query"]` | `Hash` | Query string parameters. |
| `fetchargs["headers"]` | `Hash` | Request headers (merged with defaults). |
| `fetchargs["body"]` | `any` | Request body (hashes are JSON-serialized). |
| `fetchargs["ctrl"]` | `Hash` | Control options (e.g. `{ "explain" => true }`). |

**Returns:** `Hash`

#### `prepare(fetchargs = {}) -> Hash`

Prepare a fetch definition without sending the request. Accepts the
same parameters as `direct()`. Raises on error.

**Returns:** `Hash` (the fetch definition; raises on error)


---

## CardEntity

```ruby
card = client.Card
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `artist` | `String` | No |  |
| `border` | `String` | No |  |
| `card` | `Hash` | No |  |
| `cmc` | `Float` | No |  |
| `color` | `Array` | No |  |
| `color_identity` | `Array` | No |  |
| `flavor` | `String` | No |  |
| `foreign_name` | `Array` | No |  |
| `hand` | `Integer` | No |  |
| `id` | `String` | No |  |
| `image_url` | `String` | No |  |
| `layout` | `String` | No |  |
| `legality` | `Array` | No |  |
| `life` | `Integer` | No |  |
| `loyalty` | `String` | No |  |
| `mana_cost` | `String` | No |  |
| `multiverseid` | `Integer` | No |  |
| `name` | `String` | No |  |
| `number` | `String` | No |  |
| `original_text` | `String` | No |  |
| `original_type` | `String` | No |  |
| `power` | `String` | No |  |
| `printing` | `Array` | No |  |
| `rarity` | `String` | No |  |
| `release_date` | `String` | No |  |
| `reserved` | `Boolean` | No |  |
| `ruling` | `Array` | No |  |
| `set` | `String` | No |  |
| `set_name` | `String` | No |  |
| `source` | `String` | No |  |
| `starter` | `Boolean` | No |  |
| `subtype` | `Array` | No |  |
| `supertype` | `Array` | No |  |
| `text` | `String` | No |  |
| `timeshifted` | `Boolean` | No |  |
| `toughness` | `String` | No |  |
| `type` | `String` | No |  |
| `variation` | `Array` | No |  |
| `watermark` | `String` | No |  |

### Operations

#### `list(reqmatch = nil, ctrl = nil) -> Array`

List entities matching the given criteria (call with no argument to list all). Returns an array. Raises on error.

```ruby
results = client.Card.list
```

#### `load(reqmatch, ctrl = nil) -> result`

Load a single entity matching the given criteria. Raises on error.

```ruby
result = client.Card.load({ "id" => "card_id" })
```

### Common Methods

#### `data_get -> Hash`

Get the entity data. Returns a copy of the current data.

#### `data_set(data)`

Set the entity data.

#### `match_get -> Hash`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make -> Entity`

Create a new `CardEntity` instance with the same client and
options.

#### `get_name -> String`

Return the entity name.


---

## FormatEntity

```ruby
format = client.Format
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `format` | `Array` | No |  |

### Operations

#### `list(reqmatch = nil, ctrl = nil) -> Array`

List entities matching the given criteria (call with no argument to list all). Returns an array. Raises on error.

```ruby
results = client.Format.list
```

### Common Methods

#### `data_get -> Hash`

Get the entity data. Returns a copy of the current data.

#### `data_set(data)`

Set the entity data.

#### `match_get -> Hash`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make -> Entity`

Create a new `FormatEntity` instance with the same client and
options.

#### `get_name -> String`

Return the entity name.


---

## SetEntity

```ruby
set = client.Set
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `block` | `String` | No |  |
| `booster` | `Array` | No |  |
| `border` | `String` | No |  |
| `code` | `String` | No |  |
| `gatherer_code` | `String` | No |  |
| `magic_cards_info_code` | `String` | No |  |
| `mkm_id` | `Integer` | No |  |
| `mkm_name` | `String` | No |  |
| `name` | `String` | No |  |
| `online_only` | `Boolean` | No |  |
| `release_date` | `String` | No |  |
| `set` | `Hash` | No |  |
| `type` | `String` | No |  |

### Operations

#### `list(reqmatch = nil, ctrl = nil) -> Array`

List entities matching the given criteria (call with no argument to list all). Returns an array. Raises on error.

```ruby
results = client.Set.list
```

#### `load(reqmatch, ctrl = nil) -> result`

Load a single entity matching the given criteria. Raises on error.

```ruby
result = client.Set.load({ "id" => "set_id" })
```

### Common Methods

#### `data_get -> Hash`

Get the entity data. Returns a copy of the current data.

#### `data_set(data)`

Set the entity data.

#### `match_get -> Hash`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make -> Entity`

Create a new `SetEntity` instance with the same client and
options.

#### `get_name -> String`

Return the entity name.


---

## SetBoosterEntity

```ruby
set_booster = client.SetBooster
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `artist` | `String` | No |  |
| `border` | `String` | No |  |
| `cmc` | `Float` | No |  |
| `color` | `Array` | No |  |
| `color_identity` | `Array` | No |  |
| `flavor` | `String` | No |  |
| `foreign_name` | `Array` | No |  |
| `hand` | `Integer` | No |  |
| `id` | `String` | No |  |
| `image_url` | `String` | No |  |
| `layout` | `String` | No |  |
| `legality` | `Array` | No |  |
| `life` | `Integer` | No |  |
| `loyalty` | `String` | No |  |
| `mana_cost` | `String` | No |  |
| `multiverseid` | `Integer` | No |  |
| `name` | `String` | No |  |
| `number` | `String` | No |  |
| `original_text` | `String` | No |  |
| `original_type` | `String` | No |  |
| `power` | `String` | No |  |
| `printing` | `Array` | No |  |
| `rarity` | `String` | No |  |
| `release_date` | `String` | No |  |
| `reserved` | `Boolean` | No |  |
| `ruling` | `Array` | No |  |
| `set` | `String` | No |  |
| `set_name` | `String` | No |  |
| `source` | `String` | No |  |
| `starter` | `Boolean` | No |  |
| `subtype` | `Array` | No |  |
| `supertype` | `Array` | No |  |
| `text` | `String` | No |  |
| `timeshifted` | `Boolean` | No |  |
| `toughness` | `String` | No |  |
| `type` | `String` | No |  |
| `variation` | `Array` | No |  |
| `watermark` | `String` | No |  |

### Operations

#### `list(reqmatch = nil, ctrl = nil) -> Array`

List entities matching the given criteria (call with no argument to list all). Returns an array. Raises on error.

```ruby
results = client.SetBooster.list
```

### Common Methods

#### `data_get -> Hash`

Get the entity data. Returns a copy of the current data.

#### `data_set(data)`

Set the entity data.

#### `match_get -> Hash`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make -> Entity`

Create a new `SetBoosterEntity` instance with the same client and
options.

#### `get_name -> String`

Return the entity name.


---

## SubtypeEntity

```ruby
subtype = client.Subtype
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `subtype` | `Array` | No |  |

### Operations

#### `list(reqmatch = nil, ctrl = nil) -> Array`

List entities matching the given criteria (call with no argument to list all). Returns an array. Raises on error.

```ruby
results = client.Subtype.list
```

### Common Methods

#### `data_get -> Hash`

Get the entity data. Returns a copy of the current data.

#### `data_set(data)`

Set the entity data.

#### `match_get -> Hash`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make -> Entity`

Create a new `SubtypeEntity` instance with the same client and
options.

#### `get_name -> String`

Return the entity name.


---

## SupertypeEntity

```ruby
supertype = client.Supertype
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `supertype` | `Array` | No |  |

### Operations

#### `list(reqmatch = nil, ctrl = nil) -> Array`

List entities matching the given criteria (call with no argument to list all). Returns an array. Raises on error.

```ruby
results = client.Supertype.list
```

### Common Methods

#### `data_get -> Hash`

Get the entity data. Returns a copy of the current data.

#### `data_set(data)`

Set the entity data.

#### `match_get -> Hash`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make -> Entity`

Create a new `SupertypeEntity` instance with the same client and
options.

#### `get_name -> String`

Return the entity name.


---

## TypeEntity

```ruby
type = client.Type
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `type` | `Array` | No |  |

### Operations

#### `list(reqmatch = nil, ctrl = nil) -> Array`

List entities matching the given criteria (call with no argument to list all). Returns an array. Raises on error.

```ruby
results = client.Type.list
```

### Common Methods

#### `data_get -> Hash`

Get the entity data. Returns a copy of the current data.

#### `data_set(data)`

Set the entity data.

#### `match_get -> Hash`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make -> Entity`

Create a new `TypeEntity` instance with the same client and
options.

#### `get_name -> String`

Return the entity name.


---

## Features

| Feature | Version | Description |
| --- | --- | --- |
| `test` | 0.0.1 | In-memory mock transport for testing without a live server |


Features are activated via the `feature` option:

```ruby
client = MagicTheGatheringTwoSDK.new({
  "feature" => {
    "test" => { "active" => true },
  },
})
```

