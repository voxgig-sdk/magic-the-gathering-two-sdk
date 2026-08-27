# MagicTheGatheringTwo Golang SDK Reference

Complete API reference for the MagicTheGatheringTwo Golang SDK.


## MagicTheGatheringTwoSDK

### Constructor

```go
func NewMagicTheGatheringTwoSDK(options map[string]any) *MagicTheGatheringTwoSDK
```

Create a new SDK client instance.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `options` | `map[string]any` | SDK configuration options. |
| `options["base"]` | `string` | Base URL for API requests. |
| `options["prefix"]` | `string` | URL prefix appended after base. |
| `options["suffix"]` | `string` | URL suffix appended after path. |
| `options["headers"]` | `map[string]any` | Custom headers for all requests. |
| `options["feature"]` | `map[string]any` | Feature configuration. |
| `options["system"]` | `map[string]any` | System overrides (e.g. custom fetch). |


### Static Methods

#### `Test() *MagicTheGatheringTwoSDK`

No-arg convenience constructor for the common no-options test case.

```go
client := sdk.Test()
```

#### `TestSDK(testopts, sdkopts map[string]any) *MagicTheGatheringTwoSDK`

Test client with options. Both arguments may be `nil`.

```go
client := sdk.TestSDK(testopts, sdkopts)
```


### Instance Methods

#### `Card(data map[string]any) MagicTheGatheringTwoEntity`

Create a new `Card` entity instance. Pass `nil` for no initial data.

#### `Format(data map[string]any) MagicTheGatheringTwoEntity`

Create a new `Format` entity instance. Pass `nil` for no initial data.

#### `Set(data map[string]any) MagicTheGatheringTwoEntity`

Create a new `Set` entity instance. Pass `nil` for no initial data.

#### `SetBooster(data map[string]any) MagicTheGatheringTwoEntity`

Create a new `SetBooster` entity instance. Pass `nil` for no initial data.

#### `Subtype(data map[string]any) MagicTheGatheringTwoEntity`

Create a new `Subtype` entity instance. Pass `nil` for no initial data.

#### `Supertype(data map[string]any) MagicTheGatheringTwoEntity`

Create a new `Supertype` entity instance. Pass `nil` for no initial data.

#### `Type(data map[string]any) MagicTheGatheringTwoEntity`

Create a new `Type` entity instance. Pass `nil` for no initial data.

#### `OptionsMap() map[string]any`

Return a deep copy of the current SDK options.

#### `GetUtility() *Utility`

Return a copy of the SDK utility object.

#### `Direct(fetchargs map[string]any) (map[string]any, error)`

Make a direct HTTP request to any API endpoint.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `fetchargs["path"]` | `string` | URL path with optional `{param}` placeholders. |
| `fetchargs["method"]` | `string` | HTTP method (default: `"GET"`). |
| `fetchargs["params"]` | `map[string]any` | Path parameter values for `{param}` substitution. |
| `fetchargs["query"]` | `map[string]any` | Query string parameters. |
| `fetchargs["headers"]` | `map[string]any` | Request headers (merged with defaults). |
| `fetchargs["body"]` | `any` | Request body (maps are JSON-serialized). |
| `fetchargs["ctrl"]` | `map[string]any` | Control options (e.g. `map[string]any{"explain": true}`). |

**Returns:** `(map[string]any, error)`

#### `Prepare(fetchargs map[string]any) (map[string]any, error)`

Prepare a fetch definition without sending the request. Accepts the
same parameters as `Direct()`.

**Returns:** `(map[string]any, error)`


---

## CardEntity

```go
card := client.Card(nil)
fmt.Println(card.GetName()) // "card"
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `artist` | `string` | No | The artist of the card |
| `border` | `string` | No | The border color if different from the set default |
| `cmc` | `float64` | No | Converted mana cost |
| `colorIdentity` | `[]any` | No | The card's color identity by color code |
| `colors` | `[]any` | No | The card colors |
| `flavor` | `string` | No | The flavor text of the card |
| `foreignNames` | `[]any` | No | Foreign language names for the card |
| `hand` | `int` | No | Maximum hand size modifier (Vanguard cards only) |
| `id` | `string` | No | A unique id for this card (SHA1 hash) |
| `imageUrl` | `string` | No | The image URL for the card |
| `layout` | `string` | No | The card layout |
| `legalities` | `[]any` | No | Which formats this card is legal, restricted or banned in |
| `life` | `int` | No | Starting life total modifier (Vanguard cards only) |
| `loyalty` | `string` | No | The loyalty of the card (planeswalkers only) |
| `manaCost` | `string` | No | The mana cost of the card |
| `multiverseid` | `int` | No | The multiverseid of the card on Wizard's Gatherer |
| `name` | `string` | No | The card name |
| `names` | `[]any` | No | Only used for split, flip and dual cards. |
| `number` | `string` | No | The card number |
| `originalText` | `string` | No | The original text on the card at the time it was printed |
| `originalType` | `string` | No | The original type on the card at the time it was printed |
| `power` | `string` | No | The power of the card (creatures only) |
| `printings` | `[]any` | No | The sets that this card was printed in |
| `rarity` | `string` | No | The rarity of the card |
| `releaseDate` | `string` | No | The release date for promo cards |
| `reserved` | `bool` | No | True if this card is reserved by Wizards Official Reprint Policy |
| `rulings` | `[]any` | No | The rulings for the card |
| `set` | `string` | No | The set code the card belongs to |
| `setName` | `string` | No | The set name the card belongs to |
| `source` | `string` | No | For promo cards, where the card was originally obtained |
| `starter` | `bool` | No | True if this card was only released as part of a core box set |
| `subtypes` | `[]any` | No | The subtypes of the card |
| `supertypes` | `[]any` | No | The supertypes of the card |
| `text` | `string` | No | The oracle text of the card |
| `timeshifted` | `bool` | No | True if this card was timeshifted in the set |
| `toughness` | `string` | No | The toughness of the card (creatures only) |
| `type` | `string` | No | The card type |
| `types` | `[]any` | No | The types of the card |
| `variations` | `[]any` | No | Multiverseids of alternate art variations |
| `watermark` | `string` | No | The watermark on the card |

### Operations

#### `List(reqmatch, ctrl map[string]any) (any, error)`

List entities matching the given criteria. Returns an array.

```go
results, err := client.Card(nil).List(nil, nil)
if err != nil {
    panic(err)
}
fmt.Println(results)
```

#### `Load(reqmatch, ctrl map[string]any) (any, error)`

Load a single entity matching the given criteria.

```go
result, err := client.Card(nil).Load(map[string]any{"id": "card_id"}, nil)
if err != nil {
    panic(err)
}
fmt.Println(result)
```

### Common Methods

#### `Data(args ...any) any`

Get or set the entity data. When called with data, sets the entity's
internal data and returns the current data. When called without
arguments, returns a copy of the current data.

#### `Match(args ...any) any`

Get or set the entity match criteria. Works the same as `Data()`.

#### `Make() Entity`

Create a new `CardEntity` instance with the same client and
options.

#### `GetName() string`

Return the entity name.


---

## FormatEntity

```go
format := client.Format(nil)
fmt.Println(format.GetName()) // "format"
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `formats` | `[]any` | No |  |

### Operations

#### `List(reqmatch, ctrl map[string]any) (any, error)`

List entities matching the given criteria. Returns an array.

```go
results, err := client.Format(nil).List(nil, nil)
if err != nil {
    panic(err)
}
fmt.Println(results)
```

### Common Methods

#### `Data(args ...any) any`

Get or set the entity data. When called with data, sets the entity's
internal data and returns the current data. When called without
arguments, returns a copy of the current data.

#### `Match(args ...any) any`

Get or set the entity match criteria. Works the same as `Data()`.

#### `Make() Entity`

Create a new `FormatEntity` instance with the same client and
options.

#### `GetName() string`

Return the entity name.


---

## SetEntity

```go
set := client.Set(nil)
fmt.Println(set.GetName()) // "set"
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `block` | `string` | No | The block the set belongs to |
| `booster` | `[]any` | No | Booster pack configuration |
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

#### `List(reqmatch, ctrl map[string]any) (any, error)`

List entities matching the given criteria. Returns an array.

```go
results, err := client.Set(nil).List(nil, nil)
if err != nil {
    panic(err)
}
fmt.Println(results)
```

#### `Load(reqmatch, ctrl map[string]any) (any, error)`

Load a single entity matching the given criteria.

```go
result, err := client.Set(nil).Load(map[string]any{"id": "set_id"}, nil)
if err != nil {
    panic(err)
}
fmt.Println(result)
```

### Common Methods

#### `Data(args ...any) any`

Get or set the entity data. When called with data, sets the entity's
internal data and returns the current data. When called without
arguments, returns a copy of the current data.

#### `Match(args ...any) any`

Get or set the entity match criteria. Works the same as `Data()`.

#### `Make() Entity`

Create a new `SetEntity` instance with the same client and
options.

#### `GetName() string`

Return the entity name.


---

## SetBoosterEntity

```go
setBooster := client.SetBooster(nil)
fmt.Println(setBooster.GetName()) // "set_booster"
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `artist` | `string` | No | The artist of the card |
| `border` | `string` | No | The border color if different from the set default |
| `cmc` | `float64` | No | Converted mana cost |
| `colorIdentity` | `[]any` | No | The card's color identity by color code |
| `colors` | `[]any` | No | The card colors |
| `flavor` | `string` | No | The flavor text of the card |
| `foreignNames` | `[]any` | No | Foreign language names for the card |
| `hand` | `int` | No | Maximum hand size modifier (Vanguard cards only) |
| `id` | `string` | No | A unique id for this card (SHA1 hash) |
| `imageUrl` | `string` | No | The image URL for the card |
| `layout` | `string` | No | The card layout |
| `legalities` | `[]any` | No | Which formats this card is legal, restricted or banned in |
| `life` | `int` | No | Starting life total modifier (Vanguard cards only) |
| `loyalty` | `string` | No | The loyalty of the card (planeswalkers only) |
| `manaCost` | `string` | No | The mana cost of the card |
| `multiverseid` | `int` | No | The multiverseid of the card on Wizard's Gatherer |
| `name` | `string` | No | The card name |
| `names` | `[]any` | No | Only used for split, flip and dual cards. |
| `number` | `string` | No | The card number |
| `originalText` | `string` | No | The original text on the card at the time it was printed |
| `originalType` | `string` | No | The original type on the card at the time it was printed |
| `power` | `string` | No | The power of the card (creatures only) |
| `printings` | `[]any` | No | The sets that this card was printed in |
| `rarity` | `string` | No | The rarity of the card |
| `releaseDate` | `string` | No | The release date for promo cards |
| `reserved` | `bool` | No | True if this card is reserved by Wizards Official Reprint Policy |
| `rulings` | `[]any` | No | The rulings for the card |
| `set` | `string` | No | The set code the card belongs to |
| `setName` | `string` | No | The set name the card belongs to |
| `source` | `string` | No | For promo cards, where the card was originally obtained |
| `starter` | `bool` | No | True if this card was only released as part of a core box set |
| `subtypes` | `[]any` | No | The subtypes of the card |
| `supertypes` | `[]any` | No | The supertypes of the card |
| `text` | `string` | No | The oracle text of the card |
| `timeshifted` | `bool` | No | True if this card was timeshifted in the set |
| `toughness` | `string` | No | The toughness of the card (creatures only) |
| `type` | `string` | No | The card type |
| `types` | `[]any` | No | The types of the card |
| `variations` | `[]any` | No | Multiverseids of alternate art variations |
| `watermark` | `string` | No | The watermark on the card |

### Operations

#### `List(reqmatch, ctrl map[string]any) (any, error)`

List entities matching the given criteria. Returns an array.

```go
results, err := client.SetBooster(nil).List(nil, nil)
if err != nil {
    panic(err)
}
fmt.Println(results)
```

### Common Methods

#### `Data(args ...any) any`

Get or set the entity data. When called with data, sets the entity's
internal data and returns the current data. When called without
arguments, returns a copy of the current data.

#### `Match(args ...any) any`

Get or set the entity match criteria. Works the same as `Data()`.

#### `Make() Entity`

Create a new `SetBoosterEntity` instance with the same client and
options.

#### `GetName() string`

Return the entity name.


---

## SubtypeEntity

```go
subtype := client.Subtype(nil)
fmt.Println(subtype.GetName()) // "subtype"
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `subtypes` | `[]any` | No |  |

### Operations

#### `List(reqmatch, ctrl map[string]any) (any, error)`

List entities matching the given criteria. Returns an array.

```go
results, err := client.Subtype(nil).List(nil, nil)
if err != nil {
    panic(err)
}
fmt.Println(results)
```

### Common Methods

#### `Data(args ...any) any`

Get or set the entity data. When called with data, sets the entity's
internal data and returns the current data. When called without
arguments, returns a copy of the current data.

#### `Match(args ...any) any`

Get or set the entity match criteria. Works the same as `Data()`.

#### `Make() Entity`

Create a new `SubtypeEntity` instance with the same client and
options.

#### `GetName() string`

Return the entity name.


---

## SupertypeEntity

```go
supertype := client.Supertype(nil)
fmt.Println(supertype.GetName()) // "supertype"
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `supertypes` | `[]any` | No |  |

### Operations

#### `List(reqmatch, ctrl map[string]any) (any, error)`

List entities matching the given criteria. Returns an array.

```go
results, err := client.Supertype(nil).List(nil, nil)
if err != nil {
    panic(err)
}
fmt.Println(results)
```

### Common Methods

#### `Data(args ...any) any`

Get or set the entity data. When called with data, sets the entity's
internal data and returns the current data. When called without
arguments, returns a copy of the current data.

#### `Match(args ...any) any`

Get or set the entity match criteria. Works the same as `Data()`.

#### `Make() Entity`

Create a new `SupertypeEntity` instance with the same client and
options.

#### `GetName() string`

Return the entity name.


---

## TypeEntity

```go
type_ := client.Type(nil)
fmt.Println(type_.GetName()) // "type"
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `types` | `[]any` | No |  |

### Operations

#### `List(reqmatch, ctrl map[string]any) (any, error)`

List entities matching the given criteria. Returns an array.

```go
results, err := client.Type(nil).List(nil, nil)
if err != nil {
    panic(err)
}
fmt.Println(results)
```

### Common Methods

#### `Data(args ...any) any`

Get or set the entity data. When called with data, sets the entity's
internal data and returns the current data. When called without
arguments, returns a copy of the current data.

#### `Match(args ...any) any`

Get or set the entity match criteria. Works the same as `Data()`.

#### `Make() Entity`

Create a new `TypeEntity` instance with the same client and
options.

#### `GetName() string`

Return the entity name.


---

## Features

| Feature | Version | Description |
| --- | --- | --- |
| `test` | 0.0.1 | In-memory mock transport for testing without a live server |


Features are activated via the `feature` option:

```go
client := sdk.NewMagicTheGatheringTwoSDK(map[string]any{
    "feature": map[string]any{
        "test": map[string]any{"active": true},
    },
})
```

