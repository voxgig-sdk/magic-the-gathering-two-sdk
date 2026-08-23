# MagicTheGatheringTwo Python SDK Reference

Complete API reference for the MagicTheGatheringTwo Python SDK.


## MagicTheGatheringTwoSDK

### Constructor

```python
from magicthegatheringtwo_sdk import MagicTheGatheringTwoSDK

client = MagicTheGatheringTwoSDK(options)
```

Create a new SDK client instance.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `options` | `dict` | SDK configuration options. |
| `options["base"]` | `str` | Base URL for API requests. |
| `options["prefix"]` | `str` | URL prefix appended after base. |
| `options["suffix"]` | `str` | URL suffix appended after path. |
| `options["headers"]` | `dict` | Custom headers for all requests. |
| `options["feature"]` | `dict` | Feature configuration. |
| `options["system"]` | `dict` | System overrides (e.g. custom fetch). |


### Static Methods

#### `MagicTheGatheringTwoSDK.test(testopts=None, sdkopts=None)`

Create a test client with mock features active. Both arguments may be `None`.

```python
client = MagicTheGatheringTwoSDK.test()
```


### Instance Methods

#### `Card(data=None)`

Create a new `CardEntity` instance. Pass `None` for no initial data.

#### `Format(data=None)`

Create a new `FormatEntity` instance. Pass `None` for no initial data.

#### `Set(data=None)`

Create a new `SetEntity` instance. Pass `None` for no initial data.

#### `SetBooster(data=None)`

Create a new `SetBoosterEntity` instance. Pass `None` for no initial data.

#### `Subtype(data=None)`

Create a new `SubtypeEntity` instance. Pass `None` for no initial data.

#### `Supertype(data=None)`

Create a new `SupertypeEntity` instance. Pass `None` for no initial data.

#### `Type(data=None)`

Create a new `TypeEntity` instance. Pass `None` for no initial data.

#### `options_map() -> dict`

Return a deep copy of the current SDK options.

#### `get_utility() -> Utility`

Return a copy of the SDK utility object.

#### `direct(fetchargs=None) -> dict`

Make a direct HTTP request to any API endpoint. Returns a result `dict` with `ok`, `status`, `headers`, and `data` (or `err` on failure). This escape hatch never raises — branch on `result["ok"]`.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `fetchargs["path"]` | `str` | URL path with optional `{param}` placeholders. |
| `fetchargs["method"]` | `str` | HTTP method (default: `"GET"`). |
| `fetchargs["params"]` | `dict` | Path parameter values. |
| `fetchargs["query"]` | `dict` | Query string parameters. |
| `fetchargs["headers"]` | `dict` | Request headers (merged with defaults). |
| `fetchargs["body"]` | `any` | Request body (dicts are JSON-serialized). |

**Returns:** `result_dict`

#### `prepare(fetchargs=None) -> dict`

Prepare a fetch definition without sending. Returns the `fetchdef` and raises on error.


---

## CardEntity

```python
card = client.Card()
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `artist` | `str` | No | The artist of the card |
| `border` | `str` | No | The border color if different from the set default |
| `cmc` | `float` | No | Converted mana cost |
| `colorIdentity` | `list` | No | The card's color identity by color code |
| `colors` | `list` | No | The card colors |
| `flavor` | `str` | No | The flavor text of the card |
| `foreignNames` | `list` | No | Foreign language names for the card |
| `hand` | `int` | No | Maximum hand size modifier (Vanguard cards only) |
| `id` | `str` | No | A unique id for this card (SHA1 hash) |
| `imageUrl` | `str` | No | The image URL for the card |
| `layout` | `str` | No | The card layout |
| `legalities` | `list` | No | Which formats this card is legal, restricted or banned in |
| `life` | `int` | No | Starting life total modifier (Vanguard cards only) |
| `loyalty` | `str` | No | The loyalty of the card (planeswalkers only) |
| `manaCost` | `str` | No | The mana cost of the card |
| `multiverseid` | `int` | No | The multiverseid of the card on Wizard's Gatherer |
| `name` | `str` | No | The card name |
| `names` | `list` | No | Only used for split, flip and dual cards. |
| `number` | `str` | No | The card number |
| `originalText` | `str` | No | The original text on the card at the time it was printed |
| `originalType` | `str` | No | The original type on the card at the time it was printed |
| `power` | `str` | No | The power of the card (creatures only) |
| `printings` | `list` | No | The sets that this card was printed in |
| `rarity` | `str` | No | The rarity of the card |
| `releaseDate` | `str` | No | The release date for promo cards |
| `reserved` | `bool` | No | True if this card is reserved by Wizards Official Reprint Policy |
| `rulings` | `list` | No | The rulings for the card |
| `set` | `str` | No | The set code the card belongs to |
| `setName` | `str` | No | The set name the card belongs to |
| `source` | `str` | No | For promo cards, where the card was originally obtained |
| `starter` | `bool` | No | True if this card was only released as part of a core box set |
| `subtypes` | `list` | No | The subtypes of the card |
| `supertypes` | `list` | No | The supertypes of the card |
| `text` | `str` | No | The oracle text of the card |
| `timeshifted` | `bool` | No | True if this card was timeshifted in the set |
| `toughness` | `str` | No | The toughness of the card (creatures only) |
| `type` | `str` | No | The card type |
| `types` | `list` | No | The types of the card |
| `variations` | `list` | No | Multiverseids of alternate art variations |
| `watermark` | `str` | No | The watermark on the card |

### Operations

#### `list(reqmatch=None, ctrl=None) -> list`

List entities matching the given criteria. The match is optional — call `list()` with no argument to list all records. Returns a list and raises on error.

```python
results = client.Card().list()
for card in results:
    print(card)
```

#### `load(reqmatch, ctrl=None) -> dict`

Load a single entity matching the given criteria. Returns the entity data and raises on error.

```python
result = client.Card().load({"id": "card_id"})
```

### Common Methods

#### `data_get() -> dict`

Get the entity data.

#### `data_set(data)`

Set the entity data.

#### `match_get() -> dict`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make() -> Entity`

Create a new `CardEntity` instance with the same options.

#### `get_name() -> str`

Return the entity name.


---

## FormatEntity

```python
format = client.Format()
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `formats` | `list` | No |  |

### Operations

#### `list(reqmatch=None, ctrl=None) -> list`

List entities matching the given criteria. The match is optional — call `list()` with no argument to list all records. Returns a list and raises on error.

```python
results = client.Format().list()
for format in results:
    print(format)
```

### Common Methods

#### `data_get() -> dict`

Get the entity data.

#### `data_set(data)`

Set the entity data.

#### `match_get() -> dict`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make() -> Entity`

Create a new `FormatEntity` instance with the same options.

#### `get_name() -> str`

Return the entity name.


---

## SetEntity

```python
set = client.Set()
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `block` | `str` | No | The block the set belongs to |
| `booster` | `list` | No | Booster pack configuration |
| `border` | `str` | No | The border color of the set |
| `code` | `str` | No | The set code |
| `gathererCode` | `str` | No | The Gatherer code for the set |
| `magicCardsInfoCode` | `str` | No | The Magic Cards Info code for the set |
| `mkm_id` | `int` | No | The Magic Card Market set ID |
| `mkm_name` | `str` | No | The Magic Card Market set name |
| `name` | `str` | No | The name of the set |
| `onlineOnly` | `bool` | No | True if the set is online only |
| `releaseDate` | `str` | No | The release date of the set |
| `type` | `str` | No | The type of the set |

### Operations

#### `list(reqmatch=None, ctrl=None) -> list`

List entities matching the given criteria. The match is optional — call `list()` with no argument to list all records. Returns a list and raises on error.

```python
results = client.Set().list()
for set in results:
    print(set)
```

#### `load(reqmatch, ctrl=None) -> dict`

Load a single entity matching the given criteria. Returns the entity data and raises on error.

```python
result = client.Set().load({"id": "set_id"})
```

### Common Methods

#### `data_get() -> dict`

Get the entity data.

#### `data_set(data)`

Set the entity data.

#### `match_get() -> dict`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make() -> Entity`

Create a new `SetEntity` instance with the same options.

#### `get_name() -> str`

Return the entity name.


---

## SetBoosterEntity

```python
set_booster = client.SetBooster()
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `artist` | `str` | No | The artist of the card |
| `border` | `str` | No | The border color if different from the set default |
| `cmc` | `float` | No | Converted mana cost |
| `colorIdentity` | `list` | No | The card's color identity by color code |
| `colors` | `list` | No | The card colors |
| `flavor` | `str` | No | The flavor text of the card |
| `foreignNames` | `list` | No | Foreign language names for the card |
| `hand` | `int` | No | Maximum hand size modifier (Vanguard cards only) |
| `id` | `str` | No | A unique id for this card (SHA1 hash) |
| `imageUrl` | `str` | No | The image URL for the card |
| `layout` | `str` | No | The card layout |
| `legalities` | `list` | No | Which formats this card is legal, restricted or banned in |
| `life` | `int` | No | Starting life total modifier (Vanguard cards only) |
| `loyalty` | `str` | No | The loyalty of the card (planeswalkers only) |
| `manaCost` | `str` | No | The mana cost of the card |
| `multiverseid` | `int` | No | The multiverseid of the card on Wizard's Gatherer |
| `name` | `str` | No | The card name |
| `names` | `list` | No | Only used for split, flip and dual cards. |
| `number` | `str` | No | The card number |
| `originalText` | `str` | No | The original text on the card at the time it was printed |
| `originalType` | `str` | No | The original type on the card at the time it was printed |
| `power` | `str` | No | The power of the card (creatures only) |
| `printings` | `list` | No | The sets that this card was printed in |
| `rarity` | `str` | No | The rarity of the card |
| `releaseDate` | `str` | No | The release date for promo cards |
| `reserved` | `bool` | No | True if this card is reserved by Wizards Official Reprint Policy |
| `rulings` | `list` | No | The rulings for the card |
| `set` | `str` | No | The set code the card belongs to |
| `setName` | `str` | No | The set name the card belongs to |
| `source` | `str` | No | For promo cards, where the card was originally obtained |
| `starter` | `bool` | No | True if this card was only released as part of a core box set |
| `subtypes` | `list` | No | The subtypes of the card |
| `supertypes` | `list` | No | The supertypes of the card |
| `text` | `str` | No | The oracle text of the card |
| `timeshifted` | `bool` | No | True if this card was timeshifted in the set |
| `toughness` | `str` | No | The toughness of the card (creatures only) |
| `type` | `str` | No | The card type |
| `types` | `list` | No | The types of the card |
| `variations` | `list` | No | Multiverseids of alternate art variations |
| `watermark` | `str` | No | The watermark on the card |

### Operations

#### `list(reqmatch=None, ctrl=None) -> list`

List entities matching the given criteria. The match is optional — call `list()` with no argument to list all records. Returns a list and raises on error.

```python
results = client.SetBooster().list({"id": "example"})
for set_booster in results:
    print(set_booster)
```

### Common Methods

#### `data_get() -> dict`

Get the entity data.

#### `data_set(data)`

Set the entity data.

#### `match_get() -> dict`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make() -> Entity`

Create a new `SetBoosterEntity` instance with the same options.

#### `get_name() -> str`

Return the entity name.


---

## SubtypeEntity

```python
subtype = client.Subtype()
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `subtypes` | `list` | No |  |

### Operations

#### `list(reqmatch=None, ctrl=None) -> list`

List entities matching the given criteria. The match is optional — call `list()` with no argument to list all records. Returns a list and raises on error.

```python
results = client.Subtype().list()
for subtype in results:
    print(subtype)
```

### Common Methods

#### `data_get() -> dict`

Get the entity data.

#### `data_set(data)`

Set the entity data.

#### `match_get() -> dict`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make() -> Entity`

Create a new `SubtypeEntity` instance with the same options.

#### `get_name() -> str`

Return the entity name.


---

## SupertypeEntity

```python
supertype = client.Supertype()
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `supertypes` | `list` | No |  |

### Operations

#### `list(reqmatch=None, ctrl=None) -> list`

List entities matching the given criteria. The match is optional — call `list()` with no argument to list all records. Returns a list and raises on error.

```python
results = client.Supertype().list()
for supertype in results:
    print(supertype)
```

### Common Methods

#### `data_get() -> dict`

Get the entity data.

#### `data_set(data)`

Set the entity data.

#### `match_get() -> dict`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make() -> Entity`

Create a new `SupertypeEntity` instance with the same options.

#### `get_name() -> str`

Return the entity name.


---

## TypeEntity

```python
type = client.Type()
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `types` | `list` | No |  |

### Operations

#### `list(reqmatch=None, ctrl=None) -> list`

List entities matching the given criteria. The match is optional — call `list()` with no argument to list all records. Returns a list and raises on error.

```python
results = client.Type().list()
for type in results:
    print(type)
```

### Common Methods

#### `data_get() -> dict`

Get the entity data.

#### `data_set(data)`

Set the entity data.

#### `match_get() -> dict`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make() -> Entity`

Create a new `TypeEntity` instance with the same options.

#### `get_name() -> str`

Return the entity name.


---

## Features

| Feature | Version | Description |
| --- | --- | --- |
| `test` | 0.0.1 | In-memory mock transport for testing without a live server |


Features are activated via the `feature` option:

```python
client = MagicTheGatheringTwoSDK({
    "feature": {
        "test": {"active": True},
    },
})
```

