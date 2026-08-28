# MagicTheGatheringTwo Golang SDK



The Golang SDK for the MagicTheGatheringTwo API — an entity-oriented client using standard Go conventions. No generics required; data flows as `map[string]any`.

It exposes the API as capitalised, semantic **Entities** — e.g. `client.Card(nil)` — each with the same small set of operations (`List`, `Load`) instead of raw URL paths and query strings. You call meaning, not endpoints, which keeps the cognitive load low.

> Also generated from this model: `go-cli`, `go-mcp`, `lua`, `php`, `py`, `rb`, `ts` — see
> the [top-level README](../README.md).


## Install
```bash
go get github.com/voxgig-sdk/magic-the-gathering-two-sdk/go@latest
```

The Go module proxy resolves the version from the `go/vX.Y.Z` GitHub
release tag — see [Releases](https://github.com/voxgig-sdk/magic-the-gathering-two-sdk/releases) for the available versions.

To vendor from a local checkout instead, clone this repo alongside your
project and add a `replace` directive pointing at the checked-out
`go/` directory:

```bash
go mod edit -replace github.com/voxgig-sdk/magic-the-gathering-two-sdk/go=../magic-the-gathering-two-sdk/go
```


## Tutorial: your first API call

This tutorial walks through creating a client, listing entities, and
loading a specific record.

### Quickstart

A complete program: create a client, then call the entity operations.
Each operation returns `(value, error)` — the value is the data itself
(there is no `{ok, data}` wrapper), so check `err` and use the value
directly.

```go
package main

import (
    "fmt"
    sdk "github.com/voxgig-sdk/magic-the-gathering-two-sdk/go"
)

func main() {
    client := sdk.New()

    // List card records — the value is the array of records itself.
    cards, err := client.Card(nil).List(nil, nil)
    if err != nil {
        panic(err)
    }
    for _, item := range cards.([]any) {
        fmt.Println(item)
    }

    // Load a single card — the value is the loaded record.
    card, err := client.Card(nil).Load(map[string]any{"id": "example_id"}, nil)
    if err != nil {
        panic(err)
    }
    fmt.Println(card)
}
```


## Error handling

Every entity operation returns `(value, error)`. Check `err` before
using the value — there is no exception to catch:

```go
formats, err := client.Format(nil).List(nil, nil)
if err != nil {
    // handle err
    return
}
_ = formats
```

`Direct` follows the same `(value, error)` convention:

```go
result, err := client.Direct(map[string]any{
    "path":   "/api/resource/{id}",
    "method": "GET",
    "params": map[string]any{"id": "example_id"},
})
if err != nil {
    // handle err
}
_ = result
```


## How-to guides

### Make a direct HTTP request

For endpoints not covered by entity methods:

```go
result, err := client.Direct(map[string]any{
    "path":   "/api/resource/{id}",
    "method": "GET",
    "params": map[string]any{"id": "example"},
})
if err != nil {
    panic(err)
}

if result["ok"] == true {
    fmt.Println(result["status"]) // 200
    fmt.Println(result["data"])   // response body
}
```

### Prepare a request without sending it

```go
fetchdef, err := client.Prepare(map[string]any{
    "path":   "/api/resource/{id}",
    "method": "DELETE",
    "params": map[string]any{"id": "example"},
})
if err != nil {
    panic(err)
}

fmt.Println(fetchdef["url"])
fmt.Println(fetchdef["method"])
fmt.Println(fetchdef["headers"])
```

### Use test mode

Create a mock client for unit testing — no server required:

```go
client := sdk.Test()

format, err := client.Format(nil).List(
    nil, nil,
)
if err != nil {
    panic(err)
}
fmt.Println(format) // the returned mock data
```

### Use a custom fetch function

Replace the HTTP transport with your own function:

```go
mockFetch := func(url string, init map[string]any) (map[string]any, error) {
    return map[string]any{
        "status":     200,
        "statusText": "OK",
        "headers":    map[string]any{},
        "json": (func() any)(func() any {
            return map[string]any{"id": "mock01"}
        }),
    }, nil
}

client := sdk.NewMagicTheGatheringTwoSDK(map[string]any{
    "base": "http://localhost:8080",
    "system": map[string]any{
        "fetch": (func(string, map[string]any) (map[string]any, error))(mockFetch),
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
cd go && go test ./test/...
```


## Reference

### NewMagicTheGatheringTwoSDK

```go
func NewMagicTheGatheringTwoSDK(options map[string]any) *MagicTheGatheringTwoSDK
```

Creates a new SDK client.

| Option | Type | Description |
| --- | --- | --- |
| `"base"` | `string` | Base URL of the API server. |
| `"prefix"` | `string` | URL path prefix prepended to all requests. |
| `"suffix"` | `string` | URL path suffix appended to all requests. |
| `"feature"` | `map[string]any` | Feature activation flags. |
| `"extend"` | `[]any` | Additional Feature instances to load. |
| `"system"` | `map[string]any` | System overrides (e.g. custom `"fetch"` function). |

### TestSDK

```go
func TestSDK(testopts map[string]any, sdkopts map[string]any) *MagicTheGatheringTwoSDK
```

Creates a test-mode client with mock transport. Both arguments may be `nil`.

### MagicTheGatheringTwoSDK methods

| Method | Signature | Description |
| --- | --- | --- |
| `OptionsMap` | `() map[string]any` | Deep copy of current SDK options. |
| `GetUtility` | `() *Utility` | Copy of the SDK utility object. |
| `Prepare` | `(fetchargs map[string]any) (map[string]any, error)` | Build an HTTP request definition without sending. |
| `Direct` | `(fetchargs map[string]any) (map[string]any, error)` | Build and send an HTTP request. |
| `Card` | `(data map[string]any) MagicTheGatheringTwoEntity` | Create a Card entity instance. |
| `Format` | `(data map[string]any) MagicTheGatheringTwoEntity` | Create a Format entity instance. |
| `Set` | `(data map[string]any) MagicTheGatheringTwoEntity` | Create a Set entity instance. |
| `SetBooster` | `(data map[string]any) MagicTheGatheringTwoEntity` | Create a SetBooster entity instance. |
| `Subtype` | `(data map[string]any) MagicTheGatheringTwoEntity` | Create a Subtype entity instance. |
| `Supertype` | `(data map[string]any) MagicTheGatheringTwoEntity` | Create a Supertype entity instance. |
| `Type` | `(data map[string]any) MagicTheGatheringTwoEntity` | Create a Type entity instance. |

### Entity interface (MagicTheGatheringTwoEntity)

All entities implement the `MagicTheGatheringTwoEntity` interface.

| Method | Signature | Description |
| --- | --- | --- |
| `Load` | `(reqmatch, ctrl map[string]any) (any, error)` | Load a single entity by match criteria. |
| `List` | `(reqmatch, ctrl map[string]any) (any, error)` | List entities matching the criteria. |
| `Data` | `(args ...any) any` | Get or set entity data. |
| `Match` | `(args ...any) any` | Get or set entity match criteria. |
| `Make` | `() Entity` | Create a new instance with the same options. |
| `GetName` | `() string` | Return the entity name. |

### Result shape

Entity operations return `(value, error)`. The `value` is the
operation's data **directly** — there is no wrapper:

| Operation | `value` |
| --- | --- |
| `Load` | the entity record (`map[string]any`) |
| `List` | a `[]any` of entity records |

Check `err` first, then use the value directly (or the typed
`...Typed` variants, which return the entity's model struct and a typed
slice):

    card, err := client.Card(nil).List(map[string]any{/* fields */}, nil)
    if err != nil { /* handle */ }
    // card is the returned record

Only `Direct()` returns a response envelope — a `map[string]any` with
`"ok"`, `"status"`, `"headers"`, and `"data"` keys.

### Entities

#### Card

| Field | Description |
| --- | --- |
| `"artist"` | The artist of the card |
| `"border"` | The border color if different from the set default |
| `"cmc"` | Converted mana cost |
| `"colorIdentity"` | The card's color identity by color code |
| `"colors"` | The card colors |
| `"flavor"` | The flavor text of the card |
| `"foreignNames"` | Foreign language names for the card |
| `"hand"` | Maximum hand size modifier (Vanguard cards only) |
| `"id"` | A unique id for this card (SHA1 hash) |
| `"imageUrl"` | The image URL for the card |
| `"layout"` | The card layout |
| `"legalities"` | Which formats this card is legal, restricted or banned in |
| `"life"` | Starting life total modifier (Vanguard cards only) |
| `"loyalty"` | The loyalty of the card (planeswalkers only) |
| `"manaCost"` | The mana cost of the card |
| `"multiverseid"` | The multiverseid of the card on Wizard's Gatherer |
| `"name"` | The card name |
| `"names"` | Only used for split, flip and dual cards. |
| `"number"` | The card number |
| `"originalText"` | The original text on the card at the time it was printed |
| `"originalType"` | The original type on the card at the time it was printed |
| `"power"` | The power of the card (creatures only) |
| `"printings"` | The sets that this card was printed in |
| `"rarity"` | The rarity of the card |
| `"releaseDate"` | The release date for promo cards |
| `"reserved"` | True if this card is reserved by Wizards Official Reprint Policy |
| `"rulings"` | The rulings for the card |
| `"set"` | The set code the card belongs to |
| `"setName"` | The set name the card belongs to |
| `"source"` | For promo cards, where the card was originally obtained |
| `"starter"` | True if this card was only released as part of a core box set |
| `"subtypes"` | The subtypes of the card |
| `"supertypes"` | The supertypes of the card |
| `"text"` | The oracle text of the card |
| `"timeshifted"` | True if this card was timeshifted in the set |
| `"toughness"` | The toughness of the card (creatures only) |
| `"type"` | The card type |
| `"types"` | The types of the card |
| `"variations"` | Multiverseids of alternate art variations |
| `"watermark"` | The watermark on the card |

Operations: List, Load.

API path: `/cards`

#### Format

| Field | Description |
| --- | --- |
| `"formats"` |  |

Operations: List.

API path: `/formats`

#### Set

| Field | Description |
| --- | --- |
| `"block"` | The block the set belongs to |
| `"booster"` | Booster pack configuration |
| `"border"` | The border color of the set |
| `"code"` | The set code |
| `"gathererCode"` | The Gatherer code for the set |
| `"id"` |  |
| `"magicCardsInfoCode"` | The Magic Cards Info code for the set |
| `"mkm_id"` | The Magic Card Market set ID |
| `"mkm_name"` | The Magic Card Market set name |
| `"name"` | The name of the set |
| `"onlineOnly"` | True if the set is online only |
| `"releaseDate"` | The release date of the set |
| `"type"` | The type of the set |

Operations: List, Load.

API path: `/sets`

#### SetBooster

| Field | Description |
| --- | --- |
| `"artist"` | The artist of the card |
| `"border"` | The border color if different from the set default |
| `"cmc"` | Converted mana cost |
| `"colorIdentity"` | The card's color identity by color code |
| `"colors"` | The card colors |
| `"flavor"` | The flavor text of the card |
| `"foreignNames"` | Foreign language names for the card |
| `"hand"` | Maximum hand size modifier (Vanguard cards only) |
| `"id"` | A unique id for this card (SHA1 hash) |
| `"imageUrl"` | The image URL for the card |
| `"layout"` | The card layout |
| `"legalities"` | Which formats this card is legal, restricted or banned in |
| `"life"` | Starting life total modifier (Vanguard cards only) |
| `"loyalty"` | The loyalty of the card (planeswalkers only) |
| `"manaCost"` | The mana cost of the card |
| `"multiverseid"` | The multiverseid of the card on Wizard's Gatherer |
| `"name"` | The card name |
| `"names"` | Only used for split, flip and dual cards. |
| `"number"` | The card number |
| `"originalText"` | The original text on the card at the time it was printed |
| `"originalType"` | The original type on the card at the time it was printed |
| `"power"` | The power of the card (creatures only) |
| `"printings"` | The sets that this card was printed in |
| `"rarity"` | The rarity of the card |
| `"releaseDate"` | The release date for promo cards |
| `"reserved"` | True if this card is reserved by Wizards Official Reprint Policy |
| `"rulings"` | The rulings for the card |
| `"set"` | The set code the card belongs to |
| `"setName"` | The set name the card belongs to |
| `"source"` | For promo cards, where the card was originally obtained |
| `"starter"` | True if this card was only released as part of a core box set |
| `"subtypes"` | The subtypes of the card |
| `"supertypes"` | The supertypes of the card |
| `"text"` | The oracle text of the card |
| `"timeshifted"` | True if this card was timeshifted in the set |
| `"toughness"` | The toughness of the card (creatures only) |
| `"type"` | The card type |
| `"types"` | The types of the card |
| `"variations"` | Multiverseids of alternate art variations |
| `"watermark"` | The watermark on the card |

Operations: List.

API path: `/sets/{id}/booster`

#### Subtype

| Field | Description |
| --- | --- |
| `"subtypes"` |  |

Operations: List.

API path: `/subtypes`

#### Supertype

| Field | Description |
| --- | --- |
| `"supertypes"` |  |

Operations: List.

API path: `/supertypes`

#### Type

| Field | Description |
| --- | --- |
| `"types"` |  |

Operations: List.

API path: `/types`



## Entities


### Card

Create an instance: `card := client.Card(nil)`

#### Operations

| Method | Description |
| --- | --- |
| `List(match, ctrl)` | List entities matching the criteria. |
| `Load(match, ctrl)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `artist` | `string` | The artist of the card |
| `border` | `string` | The border color if different from the set default |
| `cmc` | `float64` | Converted mana cost |
| `colorIdentity` | `[]any` | The card's color identity by color code |
| `colors` | `[]any` | The card colors |
| `flavor` | `string` | The flavor text of the card |
| `foreignNames` | `[]any` | Foreign language names for the card |
| `hand` | `int` | Maximum hand size modifier (Vanguard cards only) |
| `id` | `string` | A unique id for this card (SHA1 hash) |
| `imageUrl` | `string` | The image URL for the card |
| `layout` | `string` | The card layout |
| `legalities` | `[]any` | Which formats this card is legal, restricted or banned in |
| `life` | `int` | Starting life total modifier (Vanguard cards only) |
| `loyalty` | `string` | The loyalty of the card (planeswalkers only) |
| `manaCost` | `string` | The mana cost of the card |
| `multiverseid` | `int` | The multiverseid of the card on Wizard's Gatherer |
| `name` | `string` | The card name |
| `names` | `[]any` | Only used for split, flip and dual cards. |
| `number` | `string` | The card number |
| `originalText` | `string` | The original text on the card at the time it was printed |
| `originalType` | `string` | The original type on the card at the time it was printed |
| `power` | `string` | The power of the card (creatures only) |
| `printings` | `[]any` | The sets that this card was printed in |
| `rarity` | `string` | The rarity of the card |
| `releaseDate` | `string` | The release date for promo cards |
| `reserved` | `bool` | True if this card is reserved by Wizards Official Reprint Policy |
| `rulings` | `[]any` | The rulings for the card |
| `set` | `string` | The set code the card belongs to |
| `setName` | `string` | The set name the card belongs to |
| `source` | `string` | For promo cards, where the card was originally obtained |
| `starter` | `bool` | True if this card was only released as part of a core box set |
| `subtypes` | `[]any` | The subtypes of the card |
| `supertypes` | `[]any` | The supertypes of the card |
| `text` | `string` | The oracle text of the card |
| `timeshifted` | `bool` | True if this card was timeshifted in the set |
| `toughness` | `string` | The toughness of the card (creatures only) |
| `type` | `string` | The card type |
| `types` | `[]any` | The types of the card |
| `variations` | `[]any` | Multiverseids of alternate art variations |
| `watermark` | `string` | The watermark on the card |

#### Example: Load

```go
card, err := client.Card(nil).Load(map[string]any{"id": "card_id"}, nil)
if err != nil {
    panic(err)
}
fmt.Println(card) // the loaded record
```

#### Example: List

```go
cards, err := client.Card(nil).List(nil, nil)
if err != nil {
    panic(err)
}
fmt.Println(cards) // the array of records
```


### Format

Create an instance: `format := client.Format(nil)`

#### Operations

| Method | Description |
| --- | --- |
| `List(match, ctrl)` | List entities matching the criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `formats` | `[]any` |  |

#### Example: List

```go
formats, err := client.Format(nil).List(nil, nil)
if err != nil {
    panic(err)
}
fmt.Println(formats) // the array of records
```


### Set

Create an instance: `set := client.Set(nil)`

#### Operations

| Method | Description |
| --- | --- |
| `List(match, ctrl)` | List entities matching the criteria. |
| `Load(match, ctrl)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `block` | `string` | The block the set belongs to |
| `booster` | `[]any` | Booster pack configuration |
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

```go
set, err := client.Set(nil).Load(map[string]any{"id": "set_id"}, nil)
if err != nil {
    panic(err)
}
fmt.Println(set) // the loaded record
```

#### Example: List

```go
sets, err := client.Set(nil).List(nil, nil)
if err != nil {
    panic(err)
}
fmt.Println(sets) // the array of records
```


### SetBooster

Create an instance: `setBooster := client.SetBooster(nil)`

#### Operations

| Method | Description |
| --- | --- |
| `List(match, ctrl)` | List entities matching the criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `artist` | `string` | The artist of the card |
| `border` | `string` | The border color if different from the set default |
| `cmc` | `float64` | Converted mana cost |
| `colorIdentity` | `[]any` | The card's color identity by color code |
| `colors` | `[]any` | The card colors |
| `flavor` | `string` | The flavor text of the card |
| `foreignNames` | `[]any` | Foreign language names for the card |
| `hand` | `int` | Maximum hand size modifier (Vanguard cards only) |
| `id` | `string` | A unique id for this card (SHA1 hash) |
| `imageUrl` | `string` | The image URL for the card |
| `layout` | `string` | The card layout |
| `legalities` | `[]any` | Which formats this card is legal, restricted or banned in |
| `life` | `int` | Starting life total modifier (Vanguard cards only) |
| `loyalty` | `string` | The loyalty of the card (planeswalkers only) |
| `manaCost` | `string` | The mana cost of the card |
| `multiverseid` | `int` | The multiverseid of the card on Wizard's Gatherer |
| `name` | `string` | The card name |
| `names` | `[]any` | Only used for split, flip and dual cards. |
| `number` | `string` | The card number |
| `originalText` | `string` | The original text on the card at the time it was printed |
| `originalType` | `string` | The original type on the card at the time it was printed |
| `power` | `string` | The power of the card (creatures only) |
| `printings` | `[]any` | The sets that this card was printed in |
| `rarity` | `string` | The rarity of the card |
| `releaseDate` | `string` | The release date for promo cards |
| `reserved` | `bool` | True if this card is reserved by Wizards Official Reprint Policy |
| `rulings` | `[]any` | The rulings for the card |
| `set` | `string` | The set code the card belongs to |
| `setName` | `string` | The set name the card belongs to |
| `source` | `string` | For promo cards, where the card was originally obtained |
| `starter` | `bool` | True if this card was only released as part of a core box set |
| `subtypes` | `[]any` | The subtypes of the card |
| `supertypes` | `[]any` | The supertypes of the card |
| `text` | `string` | The oracle text of the card |
| `timeshifted` | `bool` | True if this card was timeshifted in the set |
| `toughness` | `string` | The toughness of the card (creatures only) |
| `type` | `string` | The card type |
| `types` | `[]any` | The types of the card |
| `variations` | `[]any` | Multiverseids of alternate art variations |
| `watermark` | `string` | The watermark on the card |

#### Example: List

```go
setBoosters, err := client.SetBooster(nil).List(nil, nil)
if err != nil {
    panic(err)
}
fmt.Println(setBoosters) // the array of records
```


### Subtype

Create an instance: `subtype := client.Subtype(nil)`

#### Operations

| Method | Description |
| --- | --- |
| `List(match, ctrl)` | List entities matching the criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `subtypes` | `[]any` |  |

#### Example: List

```go
subtypes, err := client.Subtype(nil).List(nil, nil)
if err != nil {
    panic(err)
}
fmt.Println(subtypes) // the array of records
```


### Supertype

Create an instance: `supertype := client.Supertype(nil)`

#### Operations

| Method | Description |
| --- | --- |
| `List(match, ctrl)` | List entities matching the criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `supertypes` | `[]any` |  |

#### Example: List

```go
supertypes, err := client.Supertype(nil).List(nil, nil)
if err != nil {
    panic(err)
}
fmt.Println(supertypes) // the array of records
```


### Type

Create an instance: `type_ := client.Type(nil)`

#### Operations

| Method | Description |
| --- | --- |
| `List(match, ctrl)` | List entities matching the criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `types` | `[]any` |  |

#### Example: List

```go
type_s, err := client.Type(nil).List(nil, nil)
if err != nil {
    panic(err)
}
fmt.Println(type_s) // the array of records
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

Features are the extension mechanism. A feature implements the
`Feature` interface and provides hooks — functions keyed by pipeline
stage names.

The SDK ships with built-in features:

- **TestFeature**: In-memory mock transport for testing without a live server

Features are initialized in order. Hooks fire in the order features
were added, so later features can override earlier ones.

### Data as maps

The Go SDK uses `map[string]any` throughout rather than typed structs.
This mirrors the dynamic nature of the API and keeps the SDK
flexible — no code generation is needed when the API schema changes.

Use `core.ToMapAny()` to safely cast results and nested data.

### Package structure

```
github.com/voxgig-sdk/magic-the-gathering-two-sdk/go/
├── magic-the-gathering-two.go        # Root package — type aliases and constructors
├── core/               # SDK core — client, types, pipeline
├── entity/             # Entity implementations
├── feature/            # Built-in features (Base, Test, Log)
├── utility/            # Utility functions and struct library
└── test/               # Test suites
```

The root package (`github.com/voxgig-sdk/magic-the-gathering-two-sdk/go`) re-exports everything needed
for normal use. Import sub-packages only when you need specific types
like `core.ToMapAny`.

### Entity state

Entity instances are stateful. After a successful `List`, the entity
stores the returned data and match criteria internally.

```go
format := client.Format(nil)
format.List(nil, nil)

// format.Data() now returns the format data from the last list
// format.Match() returns the last match criteria
```

Call `Make()` to create a fresh instance with the same configuration
but no stored state.

### Direct vs entity access

The entity interface handles URL construction, parameter placement,
and response parsing automatically. Use it for standard CRUD operations.

`Direct()` gives full control over the HTTP request. Use it for
non-standard endpoints, bulk operations, or any path not modelled as
an entity. `Prepare()` builds the request without sending it — useful
for debugging or custom transport.


## Full Reference

See [REFERENCE.md](REFERENCE.md) for complete API reference
documentation including all method signatures, entity field schemas,
and detailed usage examples.
