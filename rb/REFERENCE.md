# MagicTheGatheringTwo Ruby SDK Reference

Complete API reference for the MagicTheGatheringTwo Ruby SDK.


## MagicTheGatheringTwoSDK

### Constructor

```ruby
require_relative 'magic-the-gathering-two_sdk'

client = MagicTheGatheringTwoSDK.new(options)
```

Create a new SDK client instance.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `options` | `Hash` | SDK configuration options. |
| `options["apikey"]` | `String` | API key for authentication. |
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

#### `direct(fetchargs = {}) -> Hash, err`

Make a direct HTTP request to any API endpoint.

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

**Returns:** `Hash, err`

#### `prepare(fetchargs = {}) -> Hash, err`

Prepare a fetch definition without sending the request. Accepts the
same parameters as `direct()`.

**Returns:** `Hash, err`


---

## CardEntity

```ruby
card = client.Card
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

#### `list(reqmatch, ctrl = nil) -> result, err`

List entities matching the given criteria. Returns an array.

```ruby
results, err = client.Card.list(nil)
```

#### `load(reqmatch, ctrl = nil) -> result, err`

Load a single entity matching the given criteria.

```ruby
result, err = client.Card.load({ "id" => "card_id" })
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
| `format` | ``$ARRAY`` | No |  |

### Operations

#### `list(reqmatch, ctrl = nil) -> result, err`

List entities matching the given criteria. Returns an array.

```ruby
results, err = client.Format.list(nil)
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

#### `list(reqmatch, ctrl = nil) -> result, err`

List entities matching the given criteria. Returns an array.

```ruby
results, err = client.Set.list(nil)
```

#### `load(reqmatch, ctrl = nil) -> result, err`

Load a single entity matching the given criteria.

```ruby
result, err = client.Set.load({ "id" => "set_id" })
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

#### `list(reqmatch, ctrl = nil) -> result, err`

List entities matching the given criteria. Returns an array.

```ruby
results, err = client.SetBooster.list(nil)
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
| `subtype` | ``$ARRAY`` | No |  |

### Operations

#### `list(reqmatch, ctrl = nil) -> result, err`

List entities matching the given criteria. Returns an array.

```ruby
results, err = client.Subtype.list(nil)
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
| `supertype` | ``$ARRAY`` | No |  |

### Operations

#### `list(reqmatch, ctrl = nil) -> result, err`

List entities matching the given criteria. Returns an array.

```ruby
results, err = client.Supertype.list(nil)
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
| `type` | ``$ARRAY`` | No |  |

### Operations

#### `list(reqmatch, ctrl = nil) -> result, err`

List entities matching the given criteria. Returns an array.

```ruby
results, err = client.Type.list(nil)
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

