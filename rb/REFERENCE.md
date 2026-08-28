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
| `artist` | `String` | No | The artist of the card |
| `border` | `String` | No | The border color if different from the set default |
| `cmc` | `Float` | No | Converted mana cost |
| `colorIdentity` | `Array` | No | The card's color identity by color code |
| `colors` | `Array` | No | The card colors |
| `flavor` | `String` | No | The flavor text of the card |
| `foreignNames` | `Array` | No | Foreign language names for the card |
| `hand` | `Integer` | No | Maximum hand size modifier (Vanguard cards only) |
| `id` | `String` | No | A unique id for this card (SHA1 hash) |
| `imageUrl` | `String` | No | The image URL for the card |
| `layout` | `String` | No | The card layout |
| `legalities` | `Array` | No | Which formats this card is legal, restricted or banned in |
| `life` | `Integer` | No | Starting life total modifier (Vanguard cards only) |
| `loyalty` | `String` | No | The loyalty of the card (planeswalkers only) |
| `manaCost` | `String` | No | The mana cost of the card |
| `multiverseid` | `Integer` | No | The multiverseid of the card on Wizard's Gatherer |
| `name` | `String` | No | The card name |
| `names` | `Array` | No | Only used for split, flip and dual cards. |
| `number` | `String` | No | The card number |
| `originalText` | `String` | No | The original text on the card at the time it was printed |
| `originalType` | `String` | No | The original type on the card at the time it was printed |
| `power` | `String` | No | The power of the card (creatures only) |
| `printings` | `Array` | No | The sets that this card was printed in |
| `rarity` | `String` | No | The rarity of the card |
| `releaseDate` | `String` | No | The release date for promo cards |
| `reserved` | `Boolean` | No | True if this card is reserved by Wizards Official Reprint Policy |
| `rulings` | `Array` | No | The rulings for the card |
| `set` | `String` | No | The set code the card belongs to |
| `setName` | `String` | No | The set name the card belongs to |
| `source` | `String` | No | For promo cards, where the card was originally obtained |
| `starter` | `Boolean` | No | True if this card was only released as part of a core box set |
| `subtypes` | `Array` | No | The subtypes of the card |
| `supertypes` | `Array` | No | The supertypes of the card |
| `text` | `String` | No | The oracle text of the card |
| `timeshifted` | `Boolean` | No | True if this card was timeshifted in the set |
| `toughness` | `String` | No | The toughness of the card (creatures only) |
| `type` | `String` | No | The card type |
| `types` | `Array` | No | The types of the card |
| `variations` | `Array` | No | Multiverseids of alternate art variations |
| `watermark` | `String` | No | The watermark on the card |

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
| `formats` | `Array` | No |  |

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
| `block` | `String` | No | The block the set belongs to |
| `booster` | `Array` | No | Booster pack configuration |
| `border` | `String` | No | The border color of the set |
| `code` | `String` | No | The set code |
| `gathererCode` | `String` | No | The Gatherer code for the set |
| `id` | `String` | No |  |
| `magicCardsInfoCode` | `String` | No | The Magic Cards Info code for the set |
| `mkm_id` | `Integer` | No | The Magic Card Market set ID |
| `mkm_name` | `String` | No | The Magic Card Market set name |
| `name` | `String` | No | The name of the set |
| `onlineOnly` | `Boolean` | No | True if the set is online only |
| `releaseDate` | `String` | No | The release date of the set |
| `type` | `String` | No | The type of the set |

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
| `artist` | `String` | No | The artist of the card |
| `border` | `String` | No | The border color if different from the set default |
| `cmc` | `Float` | No | Converted mana cost |
| `colorIdentity` | `Array` | No | The card's color identity by color code |
| `colors` | `Array` | No | The card colors |
| `flavor` | `String` | No | The flavor text of the card |
| `foreignNames` | `Array` | No | Foreign language names for the card |
| `hand` | `Integer` | No | Maximum hand size modifier (Vanguard cards only) |
| `id` | `String` | No | A unique id for this card (SHA1 hash) |
| `imageUrl` | `String` | No | The image URL for the card |
| `layout` | `String` | No | The card layout |
| `legalities` | `Array` | No | Which formats this card is legal, restricted or banned in |
| `life` | `Integer` | No | Starting life total modifier (Vanguard cards only) |
| `loyalty` | `String` | No | The loyalty of the card (planeswalkers only) |
| `manaCost` | `String` | No | The mana cost of the card |
| `multiverseid` | `Integer` | No | The multiverseid of the card on Wizard's Gatherer |
| `name` | `String` | No | The card name |
| `names` | `Array` | No | Only used for split, flip and dual cards. |
| `number` | `String` | No | The card number |
| `originalText` | `String` | No | The original text on the card at the time it was printed |
| `originalType` | `String` | No | The original type on the card at the time it was printed |
| `power` | `String` | No | The power of the card (creatures only) |
| `printings` | `Array` | No | The sets that this card was printed in |
| `rarity` | `String` | No | The rarity of the card |
| `releaseDate` | `String` | No | The release date for promo cards |
| `reserved` | `Boolean` | No | True if this card is reserved by Wizards Official Reprint Policy |
| `rulings` | `Array` | No | The rulings for the card |
| `set` | `String` | No | The set code the card belongs to |
| `setName` | `String` | No | The set name the card belongs to |
| `source` | `String` | No | For promo cards, where the card was originally obtained |
| `starter` | `Boolean` | No | True if this card was only released as part of a core box set |
| `subtypes` | `Array` | No | The subtypes of the card |
| `supertypes` | `Array` | No | The supertypes of the card |
| `text` | `String` | No | The oracle text of the card |
| `timeshifted` | `Boolean` | No | True if this card was timeshifted in the set |
| `toughness` | `String` | No | The toughness of the card (creatures only) |
| `type` | `String` | No | The card type |
| `types` | `Array` | No | The types of the card |
| `variations` | `Array` | No | Multiverseids of alternate art variations |
| `watermark` | `String` | No | The watermark on the card |

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
| `subtypes` | `Array` | No |  |

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
| `supertypes` | `Array` | No |  |

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
| `types` | `Array` | No |  |

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

