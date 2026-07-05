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
| `artist` | `str` | No |  |
| `border` | `str` | No |  |
| `card` | `dict` | No |  |
| `cmc` | `float` | No |  |
| `color` | `list` | No |  |
| `color_identity` | `list` | No |  |
| `flavor` | `str` | No |  |
| `foreign_name` | `list` | No |  |
| `hand` | `int` | No |  |
| `id` | `str` | No |  |
| `image_url` | `str` | No |  |
| `layout` | `str` | No |  |
| `legality` | `list` | No |  |
| `life` | `int` | No |  |
| `loyalty` | `str` | No |  |
| `mana_cost` | `str` | No |  |
| `multiverseid` | `int` | No |  |
| `name` | `str` | No |  |
| `number` | `str` | No |  |
| `original_text` | `str` | No |  |
| `original_type` | `str` | No |  |
| `power` | `str` | No |  |
| `printing` | `list` | No |  |
| `rarity` | `str` | No |  |
| `release_date` | `str` | No |  |
| `reserved` | `bool` | No |  |
| `ruling` | `list` | No |  |
| `set` | `str` | No |  |
| `set_name` | `str` | No |  |
| `source` | `str` | No |  |
| `starter` | `bool` | No |  |
| `subtype` | `list` | No |  |
| `supertype` | `list` | No |  |
| `text` | `str` | No |  |
| `timeshifted` | `bool` | No |  |
| `toughness` | `str` | No |  |
| `type` | `str` | No |  |
| `variation` | `list` | No |  |
| `watermark` | `str` | No |  |

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
| `format` | `list` | No |  |

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
| `block` | `str` | No |  |
| `booster` | `list` | No |  |
| `border` | `str` | No |  |
| `code` | `str` | No |  |
| `gatherer_code` | `str` | No |  |
| `magic_cards_info_code` | `str` | No |  |
| `mkm_id` | `int` | No |  |
| `mkm_name` | `str` | No |  |
| `name` | `str` | No |  |
| `online_only` | `bool` | No |  |
| `release_date` | `str` | No |  |
| `set` | `dict` | No |  |
| `type` | `str` | No |  |

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
| `artist` | `str` | No |  |
| `border` | `str` | No |  |
| `cmc` | `float` | No |  |
| `color` | `list` | No |  |
| `color_identity` | `list` | No |  |
| `flavor` | `str` | No |  |
| `foreign_name` | `list` | No |  |
| `hand` | `int` | No |  |
| `id` | `str` | No |  |
| `image_url` | `str` | No |  |
| `layout` | `str` | No |  |
| `legality` | `list` | No |  |
| `life` | `int` | No |  |
| `loyalty` | `str` | No |  |
| `mana_cost` | `str` | No |  |
| `multiverseid` | `int` | No |  |
| `name` | `str` | No |  |
| `number` | `str` | No |  |
| `original_text` | `str` | No |  |
| `original_type` | `str` | No |  |
| `power` | `str` | No |  |
| `printing` | `list` | No |  |
| `rarity` | `str` | No |  |
| `release_date` | `str` | No |  |
| `reserved` | `bool` | No |  |
| `ruling` | `list` | No |  |
| `set` | `str` | No |  |
| `set_name` | `str` | No |  |
| `source` | `str` | No |  |
| `starter` | `bool` | No |  |
| `subtype` | `list` | No |  |
| `supertype` | `list` | No |  |
| `text` | `str` | No |  |
| `timeshifted` | `bool` | No |  |
| `toughness` | `str` | No |  |
| `type` | `str` | No |  |
| `variation` | `list` | No |  |
| `watermark` | `str` | No |  |

### Operations

#### `list(reqmatch=None, ctrl=None) -> list`

List entities matching the given criteria. The match is optional — call `list()` with no argument to list all records. Returns a list and raises on error.

```python
results = client.SetBooster().list()
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
| `subtype` | `list` | No |  |

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
| `supertype` | `list` | No |  |

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
| `type` | `list` | No |  |

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

