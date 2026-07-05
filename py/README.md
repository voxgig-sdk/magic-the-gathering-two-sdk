# MagicTheGatheringTwo Python SDK



The Python SDK for the MagicTheGatheringTwo API — an entity-oriented client following Pythonic conventions.

The SDK exposes the API as capitalised, semantic **Entities** — for example `client.Card()` — each
carrying a small, uniform set of operations (`list`, `load`) instead of raw URL
paths and query strings. You work with named resources and verbs, which
keeps the cognitive load low.

> Other languages, the CLI, and MCP server live alongside this one — see
> the [top-level README](../README.md).


## Install
This package is not yet published to PyPI. Install it from the GitHub
release tag (`py/vX.Y.Z`, see [Releases](https://github.com/voxgig-sdk/magic-the-gathering-two-sdk/releases)) or
from a source checkout:

```bash
pip install -e .
```


## Tutorial: your first API call

This tutorial walks through creating a client, listing entities, and
loading a specific record.

### 1. Create a client

```python
from magicthegatheringtwo_sdk import MagicTheGatheringTwoSDK

client = MagicTheGatheringTwoSDK()
```

### 2. List card records

`list()` returns a `list` of records (each a `dict`) and raises on
error — iterate it directly.

```python
try:
    cards = client.Card().list()
    for card in cards:
        print(card)
except Exception as err:
    print(f"list failed: {err}")
```

### 3. Load a card

`load()` returns the bare record (a `dict`) and raises on error.

```python
try:
    card = client.Card().load({"id": "example_id"})
    print(card)
except Exception as err:
    print(f"load failed: {err}")
```


## Error handling

Entity operations raise on failure, so wrap them in `try` / `except`:

```python
try:
    cards = client.Card().list()
    print(cards)
except Exception as err:
    print(f"list failed: {err}")
```

`direct()` does **not** raise — it returns the result envelope. Branch
on `ok`; on failure `status` holds the HTTP status (for error responses)
and `err` holds a transport error, so read both defensively:

```python
result = client.direct({
    "path": "/api/resource/{id}",
    "method": "GET",
    "params": {"id": "example_id"},
})

if not result["ok"]:
    print("request failed:", result.get("status"), result.get("err"))
```


## How-to guides

### Make a direct HTTP request

For endpoints not covered by entity methods:

```python
result = client.direct({
    "path": "/api/resource/{id}",
    "method": "GET",
    "params": {"id": "example"},
})

if result["ok"]:
    print(result["status"])  # 200
    print(result["data"])    # response body
else:
    # A non-2xx response carries status + data (the error body); a
    # transport-level failure carries err instead. Only one is present, so
    # read both with .get() rather than indexing a key that may be absent.
    print(result.get("status"), result.get("err"))
```

### Prepare a request without sending it

```python
# prepare() returns the fetch definition and raises on error.
fetchdef = client.prepare({
    "path": "/api/resource/{id}",
    "method": "DELETE",
    "params": {"id": "example"},
})

print(fetchdef["url"])
print(fetchdef["method"])
print(fetchdef["headers"])
```

### Use test mode

Create a mock client for unit testing — no server required:

```python
client = MagicTheGatheringTwoSDK.test()

# Entity ops return the bare record and raise on error.
card = client.Card().list()
# card contains the mock response record
```

### Use a custom fetch function

Replace the HTTP transport with your own function:

```python
def mock_fetch(url, init):
    return {
        "status": 200,
        "statusText": "OK",
        "headers": {},
        "json": lambda: {"id": "mock01"},
    }, None

client = MagicTheGatheringTwoSDK({
    "base": "http://localhost:8080",
    "system": {
        "fetch": mock_fetch,
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
cd py && pytest test/
```


## Reference

### MagicTheGatheringTwoSDK

```python
from magicthegatheringtwo_sdk import MagicTheGatheringTwoSDK

client = MagicTheGatheringTwoSDK(options)
```

Creates a new SDK client.

| Option | Type | Description |
| --- | --- | --- |
| `base` | `str` | Base URL of the API server. |
| `prefix` | `str` | URL path prefix prepended to all requests. |
| `suffix` | `str` | URL path suffix appended to all requests. |
| `feature` | `dict` | Feature activation flags. |
| `extend` | `list` | Additional Feature instances to load. |
| `system` | `dict` | System overrides (e.g. custom `fetch` function). |

### test

```python
client = MagicTheGatheringTwoSDK.test(testopts, sdkopts)
```

Creates a test-mode client with mock transport. Both arguments may be `None`.

### MagicTheGatheringTwoSDK methods

| Method | Signature | Description |
| --- | --- | --- |
| `options_map` | `() -> dict` | Deep copy of current SDK options. |
| `get_utility` | `() -> Utility` | Copy of the SDK utility object. |
| `prepare` | `(fetchargs) -> dict` | Build an HTTP request definition without sending. Raises on error. |
| `direct` | `(fetchargs) -> dict` | Build and send an HTTP request. Returns a result dict (branch on `ok`). |
| `Card` | `(data) -> CardEntity` | Create a Card entity instance. |
| `Format` | `(data) -> FormatEntity` | Create a Format entity instance. |
| `Set` | `(data) -> SetEntity` | Create a Set entity instance. |
| `SetBooster` | `(data) -> SetBoosterEntity` | Create a SetBooster entity instance. |
| `Subtype` | `(data) -> SubtypeEntity` | Create a Subtype entity instance. |
| `Supertype` | `(data) -> SupertypeEntity` | Create a Supertype entity instance. |
| `Type` | `(data) -> TypeEntity` | Create a Type entity instance. |

### Entity interface

All entities share the same interface.

| Method | Signature | Description |
| --- | --- | --- |
| `load` | `(reqmatch, ctrl) -> any` | Load a single entity by match criteria. Raises on error. |
| `list` | `(reqmatch, ctrl) -> list` | List entities matching the criteria. Raises on error. |
| `data_get` | `() -> dict` | Get entity data. |
| `data_set` | `(data)` | Set entity data. |
| `match_get` | `() -> dict` | Get entity match criteria. |
| `match_set` | `(match)` | Set entity match criteria. |
| `make` | `() -> Entity` | Create a new instance with the same options. |
| `get_name` | `() -> str` | Return the entity name. |

### Result shape

Entity operations return the bare result data (a `dict` for single-entity
ops, a `list` for `list`) and raise on error. Wrap calls in
`try`/`except` to handle failures.

The `direct()` escape hatch never raises — it returns a result `dict`
you branch on via `result["ok"]`:

| Key | Type | Description |
| --- | --- | --- |
| `ok` | `bool` | `True` if the HTTP status is 2xx. |
| `status` | `int` | HTTP status code. |
| `headers` | `dict` | Response headers. |
| `data` | `any` | Parsed JSON response body. |

On error, `ok` is `False` and `err` contains the error value.

### Entities

#### Card

| Field | Description |
| --- | --- |
| `artist` |  |
| `border` |  |
| `card` |  |
| `cmc` |  |
| `color` |  |
| `color_identity` |  |
| `flavor` |  |
| `foreign_name` |  |
| `hand` |  |
| `id` |  |
| `image_url` |  |
| `layout` |  |
| `legality` |  |
| `life` |  |
| `loyalty` |  |
| `mana_cost` |  |
| `multiverseid` |  |
| `name` |  |
| `number` |  |
| `original_text` |  |
| `original_type` |  |
| `power` |  |
| `printing` |  |
| `rarity` |  |
| `release_date` |  |
| `reserved` |  |
| `ruling` |  |
| `set` |  |
| `set_name` |  |
| `source` |  |
| `starter` |  |
| `subtype` |  |
| `supertype` |  |
| `text` |  |
| `timeshifted` |  |
| `toughness` |  |
| `type` |  |
| `variation` |  |
| `watermark` |  |

Operations: List, Load.

API path: `/cards`

#### Format

| Field | Description |
| --- | --- |
| `format` |  |

Operations: List.

API path: `/formats`

#### Set

| Field | Description |
| --- | --- |
| `block` |  |
| `booster` |  |
| `border` |  |
| `code` |  |
| `gatherer_code` |  |
| `magic_cards_info_code` |  |
| `mkm_id` |  |
| `mkm_name` |  |
| `name` |  |
| `online_only` |  |
| `release_date` |  |
| `set` |  |
| `type` |  |

Operations: List, Load.

API path: `/sets`

#### SetBooster

| Field | Description |
| --- | --- |
| `artist` |  |
| `border` |  |
| `cmc` |  |
| `color` |  |
| `color_identity` |  |
| `flavor` |  |
| `foreign_name` |  |
| `hand` |  |
| `id` |  |
| `image_url` |  |
| `layout` |  |
| `legality` |  |
| `life` |  |
| `loyalty` |  |
| `mana_cost` |  |
| `multiverseid` |  |
| `name` |  |
| `number` |  |
| `original_text` |  |
| `original_type` |  |
| `power` |  |
| `printing` |  |
| `rarity` |  |
| `release_date` |  |
| `reserved` |  |
| `ruling` |  |
| `set` |  |
| `set_name` |  |
| `source` |  |
| `starter` |  |
| `subtype` |  |
| `supertype` |  |
| `text` |  |
| `timeshifted` |  |
| `toughness` |  |
| `type` |  |
| `variation` |  |
| `watermark` |  |

Operations: List.

API path: `/sets/{id}/booster`

#### Subtype

| Field | Description |
| --- | --- |
| `subtype` |  |

Operations: List.

API path: `/subtypes`

#### Supertype

| Field | Description |
| --- | --- |
| `supertype` |  |

Operations: List.

API path: `/supertypes`

#### Type

| Field | Description |
| --- | --- |
| `type` |  |

Operations: List.

API path: `/types`



## Entities


### Card

Create an instance: `card = client.Card()`

#### Operations

| Method | Description |
| --- | --- |
| `list()` | List entities, optionally matching the given criteria. |
| `load(match)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `artist` | `str` |  |
| `border` | `str` |  |
| `card` | `dict` |  |
| `cmc` | `float` |  |
| `color` | `list` |  |
| `color_identity` | `list` |  |
| `flavor` | `str` |  |
| `foreign_name` | `list` |  |
| `hand` | `int` |  |
| `id` | `str` |  |
| `image_url` | `str` |  |
| `layout` | `str` |  |
| `legality` | `list` |  |
| `life` | `int` |  |
| `loyalty` | `str` |  |
| `mana_cost` | `str` |  |
| `multiverseid` | `int` |  |
| `name` | `str` |  |
| `number` | `str` |  |
| `original_text` | `str` |  |
| `original_type` | `str` |  |
| `power` | `str` |  |
| `printing` | `list` |  |
| `rarity` | `str` |  |
| `release_date` | `str` |  |
| `reserved` | `bool` |  |
| `ruling` | `list` |  |
| `set` | `str` |  |
| `set_name` | `str` |  |
| `source` | `str` |  |
| `starter` | `bool` |  |
| `subtype` | `list` |  |
| `supertype` | `list` |  |
| `text` | `str` |  |
| `timeshifted` | `bool` |  |
| `toughness` | `str` |  |
| `type` | `str` |  |
| `variation` | `list` |  |
| `watermark` | `str` |  |

#### Example: Load

```python
card = client.Card().load({"id": "card_id"})
```

#### Example: List

```python
cards = client.Card().list()
```


### Format

Create an instance: `format = client.Format()`

#### Operations

| Method | Description |
| --- | --- |
| `list()` | List entities, optionally matching the given criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `format` | `list` |  |

#### Example: List

```python
formats = client.Format().list()
```


### Set

Create an instance: `set = client.Set()`

#### Operations

| Method | Description |
| --- | --- |
| `list()` | List entities, optionally matching the given criteria. |
| `load(match)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `block` | `str` |  |
| `booster` | `list` |  |
| `border` | `str` |  |
| `code` | `str` |  |
| `gatherer_code` | `str` |  |
| `magic_cards_info_code` | `str` |  |
| `mkm_id` | `int` |  |
| `mkm_name` | `str` |  |
| `name` | `str` |  |
| `online_only` | `bool` |  |
| `release_date` | `str` |  |
| `set` | `dict` |  |
| `type` | `str` |  |

#### Example: Load

```python
set = client.Set().load({"id": "set_id"})
```

#### Example: List

```python
sets = client.Set().list()
```


### SetBooster

Create an instance: `set_booster = client.SetBooster()`

#### Operations

| Method | Description |
| --- | --- |
| `list()` | List entities, optionally matching the given criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `artist` | `str` |  |
| `border` | `str` |  |
| `cmc` | `float` |  |
| `color` | `list` |  |
| `color_identity` | `list` |  |
| `flavor` | `str` |  |
| `foreign_name` | `list` |  |
| `hand` | `int` |  |
| `id` | `str` |  |
| `image_url` | `str` |  |
| `layout` | `str` |  |
| `legality` | `list` |  |
| `life` | `int` |  |
| `loyalty` | `str` |  |
| `mana_cost` | `str` |  |
| `multiverseid` | `int` |  |
| `name` | `str` |  |
| `number` | `str` |  |
| `original_text` | `str` |  |
| `original_type` | `str` |  |
| `power` | `str` |  |
| `printing` | `list` |  |
| `rarity` | `str` |  |
| `release_date` | `str` |  |
| `reserved` | `bool` |  |
| `ruling` | `list` |  |
| `set` | `str` |  |
| `set_name` | `str` |  |
| `source` | `str` |  |
| `starter` | `bool` |  |
| `subtype` | `list` |  |
| `supertype` | `list` |  |
| `text` | `str` |  |
| `timeshifted` | `bool` |  |
| `toughness` | `str` |  |
| `type` | `str` |  |
| `variation` | `list` |  |
| `watermark` | `str` |  |

#### Example: List

```python
set_boosters = client.SetBooster().list()
```


### Subtype

Create an instance: `subtype = client.Subtype()`

#### Operations

| Method | Description |
| --- | --- |
| `list()` | List entities, optionally matching the given criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `subtype` | `list` |  |

#### Example: List

```python
subtypes = client.Subtype().list()
```


### Supertype

Create an instance: `supertype = client.Supertype()`

#### Operations

| Method | Description |
| --- | --- |
| `list()` | List entities, optionally matching the given criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `supertype` | `list` |  |

#### Example: List

```python
supertypes = client.Supertype().list()
```


### Type

Create an instance: `type = client.Type()`

#### Operations

| Method | Description |
| --- | --- |
| `list()` | List entities, optionally matching the given criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `type` | `list` |  |

#### Example: List

```python
types = client.Type().list()
```


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

Features are the extension mechanism. A feature is a Python class
with hook methods named after pipeline stages (e.g. `PrePoint`,
`PreSpec`). Each method receives the context.

The SDK ships with built-in features:

- **TestFeature**: In-memory mock transport for testing without a live server

Features are initialized in order. Hooks fire in the order features
were added, so later features can override earlier ones.

### Data as dicts

The Python SDK uses plain dicts throughout rather than typed
objects. This mirrors the dynamic nature of the API and keeps the
SDK flexible — no code generation is needed when the API schema
changes.

Use `helpers.to_map()` to safely validate that a value is a dict.

### Module structure

```
py/
├── magicthegatheringtwo_sdk.py         -- Main SDK module
├── config.py                    -- Configuration
├── features.py                  -- Feature factory
├── core/                        -- Core types and context
├── entity/                      -- Entity implementations
├── feature/                     -- Built-in features (Base, Test, Log)
├── utility/                     -- Utility functions and struct library
└── test/                        -- Test suites
```

The main module (`magicthegatheringtwo_sdk`) exports the SDK class.
Import entity or utility modules directly only when needed.

### Entity state

Entity instances are stateful. After a successful `list`, the entity
stores the returned data and match criteria internally.

```python
card = client.Card()
card.list()

# card.data_get() now returns the card data from the last list
# card.match_get() returns the last match criteria
```

Call `make()` to create a fresh instance with the same configuration
but no stored state.

### Direct vs entity access

The entity interface handles URL construction, parameter placement,
and response parsing automatically. Use it for standard CRUD operations.

`direct()` gives full control over the HTTP request. Use it for
non-standard endpoints, bulk operations, or any path not modelled as
an entity. `prepare()` builds the request without sending it — useful
for debugging or custom transport.


## Full Reference

See [REFERENCE.md](REFERENCE.md) for complete API reference
documentation including all method signatures, entity field schemas,
and detailed usage examples.
