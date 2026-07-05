# MagicTheGatheringTwo TypeScript SDK Reference

Complete API reference for the MagicTheGatheringTwo TypeScript SDK.


## MagicTheGatheringTwoSDK

### Constructor

```ts
new MagicTheGatheringTwoSDK(options?: object)
```

Create a new SDK client instance.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `options` | `object` | SDK configuration options. |
| `options.base` | `string` | Base URL for API requests. |
| `options.prefix` | `string` | URL prefix appended after base. |
| `options.suffix` | `string` | URL suffix appended after path. |
| `options.headers` | `object` | Custom headers for all requests. |
| `options.feature` | `object` | Feature configuration. |
| `options.system` | `object` | System overrides (e.g. custom fetch). |


### Static Methods

#### `MagicTheGatheringTwoSDK.test(testopts?, sdkopts?)`

Create a test client with mock features active.

```ts
const client = MagicTheGatheringTwoSDK.test()
```

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `testopts` | `object` | Test feature options. |
| `sdkopts` | `object` | Additional SDK options merged with test defaults. |

**Returns:** `MagicTheGatheringTwoSDK` instance in test mode.


### Instance Methods

#### `Card(data?: object)`

Create a new `Card` entity instance.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `data` | `object` | Initial entity data. |

**Returns:** `CardEntity` instance.

#### `Format(data?: object)`

Create a new `Format` entity instance.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `data` | `object` | Initial entity data. |

**Returns:** `FormatEntity` instance.

#### `Set(data?: object)`

Create a new `Set` entity instance.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `data` | `object` | Initial entity data. |

**Returns:** `SetEntity` instance.

#### `SetBooster(data?: object)`

Create a new `SetBooster` entity instance.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `data` | `object` | Initial entity data. |

**Returns:** `SetBoosterEntity` instance.

#### `Subtype(data?: object)`

Create a new `Subtype` entity instance.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `data` | `object` | Initial entity data. |

**Returns:** `SubtypeEntity` instance.

#### `Supertype(data?: object)`

Create a new `Supertype` entity instance.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `data` | `object` | Initial entity data. |

**Returns:** `SupertypeEntity` instance.

#### `Type(data?: object)`

Create a new `Type` entity instance.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `data` | `object` | Initial entity data. |

**Returns:** `TypeEntity` instance.

#### `options()`

Return a deep copy of the current SDK options.

**Returns:** `object`

#### `utility()`

Return a copy of the SDK utility object.

**Returns:** `object`

#### `direct(fetchargs?: object)`

Make a direct HTTP request to any API endpoint.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `fetchargs.path` | `string` | URL path with optional `{param}` placeholders. |
| `fetchargs.method` | `string` | HTTP method (default: `GET`). |
| `fetchargs.params` | `object` | Path parameter values for `{param}` substitution. |
| `fetchargs.query` | `object` | Query string parameters. |
| `fetchargs.headers` | `object` | Request headers (merged with defaults). |
| `fetchargs.body` | `any` | Request body (objects are JSON-serialized). |
| `fetchargs.ctrl` | `object` | Control options (e.g. `{ explain: true }`). |

**Returns:** `Promise<{ ok, status, headers, data } | Error>`

#### `prepare(fetchargs?: object)`

Prepare a fetch definition without sending the request. Accepts the
same parameters as `direct()`.

**Returns:** `Promise<{ url, method, headers, body } | Error>`

#### `tester(testopts?, sdkopts?)`

Alias for `MagicTheGatheringTwoSDK.test()`.

**Returns:** `MagicTheGatheringTwoSDK` instance in test mode.


---

## CardEntity

```ts
const card = client.Card()
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `artist` | `string` | No |  |
| `border` | `string` | No |  |
| `card` | `Record<string, any>` | No |  |
| `cmc` | `number` | No |  |
| `color` | `any[]` | No |  |
| `color_identity` | `any[]` | No |  |
| `flavor` | `string` | No |  |
| `foreign_name` | `any[]` | No |  |
| `hand` | `number` | No |  |
| `id` | `string` | No |  |
| `image_url` | `string` | No |  |
| `layout` | `string` | No |  |
| `legality` | `any[]` | No |  |
| `life` | `number` | No |  |
| `loyalty` | `string` | No |  |
| `mana_cost` | `string` | No |  |
| `multiverseid` | `number` | No |  |
| `name` | `string` | No |  |
| `number` | `string` | No |  |
| `original_text` | `string` | No |  |
| `original_type` | `string` | No |  |
| `power` | `string` | No |  |
| `printing` | `any[]` | No |  |
| `rarity` | `string` | No |  |
| `release_date` | `string` | No |  |
| `reserved` | `boolean` | No |  |
| `ruling` | `any[]` | No |  |
| `set` | `string` | No |  |
| `set_name` | `string` | No |  |
| `source` | `string` | No |  |
| `starter` | `boolean` | No |  |
| `subtype` | `any[]` | No |  |
| `supertype` | `any[]` | No |  |
| `text` | `string` | No |  |
| `timeshifted` | `boolean` | No |  |
| `toughness` | `string` | No |  |
| `type` | `string` | No |  |
| `variation` | `any[]` | No |  |
| `watermark` | `string` | No |  |

### Operations

#### `list(match: object, ctrl?: object)`

List entities matching the given criteria. Returns an array.

```ts
const results = await client.Card().list()
```

#### `load(match: object, ctrl?: object)`

Load a single entity matching the given criteria.

```ts
const result = await client.Card().load({ id: 'card_id' })
```

### Common Methods

#### `data(data?: object)`

Get or set the entity data. When called with data, sets the entity's
internal data and returns the current data. When called without
arguments, returns a copy of the current data.

#### `match(match?: object)`

Get or set the entity match criteria. Works the same as `data()`.

#### `make()`

Create a new `CardEntity` instance with the same client and
options.

#### `client()`

Return the parent `MagicTheGatheringTwoSDK` instance.

#### `entopts()`

Return a copy of the entity options.


---

## FormatEntity

```ts
const format = client.Format()
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `format` | `any[]` | No |  |

### Operations

#### `list(match: object, ctrl?: object)`

List entities matching the given criteria. Returns an array.

```ts
const results = await client.Format().list()
```

### Common Methods

#### `data(data?: object)`

Get or set the entity data. When called with data, sets the entity's
internal data and returns the current data. When called without
arguments, returns a copy of the current data.

#### `match(match?: object)`

Get or set the entity match criteria. Works the same as `data()`.

#### `make()`

Create a new `FormatEntity` instance with the same client and
options.

#### `client()`

Return the parent `MagicTheGatheringTwoSDK` instance.

#### `entopts()`

Return a copy of the entity options.


---

## SetEntity

```ts
const set = client.Set()
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `block` | `string` | No |  |
| `booster` | `any[]` | No |  |
| `border` | `string` | No |  |
| `code` | `string` | No |  |
| `gatherer_code` | `string` | No |  |
| `magic_cards_info_code` | `string` | No |  |
| `mkm_id` | `number` | No |  |
| `mkm_name` | `string` | No |  |
| `name` | `string` | No |  |
| `online_only` | `boolean` | No |  |
| `release_date` | `string` | No |  |
| `set` | `Record<string, any>` | No |  |
| `type` | `string` | No |  |

### Operations

#### `list(match: object, ctrl?: object)`

List entities matching the given criteria. Returns an array.

```ts
const results = await client.Set().list()
```

#### `load(match: object, ctrl?: object)`

Load a single entity matching the given criteria.

```ts
const result = await client.Set().load({ id: 'set_id' })
```

### Common Methods

#### `data(data?: object)`

Get or set the entity data. When called with data, sets the entity's
internal data and returns the current data. When called without
arguments, returns a copy of the current data.

#### `match(match?: object)`

Get or set the entity match criteria. Works the same as `data()`.

#### `make()`

Create a new `SetEntity` instance with the same client and
options.

#### `client()`

Return the parent `MagicTheGatheringTwoSDK` instance.

#### `entopts()`

Return a copy of the entity options.


---

## SetBoosterEntity

```ts
const set_booster = client.SetBooster()
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `artist` | `string` | No |  |
| `border` | `string` | No |  |
| `cmc` | `number` | No |  |
| `color` | `any[]` | No |  |
| `color_identity` | `any[]` | No |  |
| `flavor` | `string` | No |  |
| `foreign_name` | `any[]` | No |  |
| `hand` | `number` | No |  |
| `id` | `string` | No |  |
| `image_url` | `string` | No |  |
| `layout` | `string` | No |  |
| `legality` | `any[]` | No |  |
| `life` | `number` | No |  |
| `loyalty` | `string` | No |  |
| `mana_cost` | `string` | No |  |
| `multiverseid` | `number` | No |  |
| `name` | `string` | No |  |
| `number` | `string` | No |  |
| `original_text` | `string` | No |  |
| `original_type` | `string` | No |  |
| `power` | `string` | No |  |
| `printing` | `any[]` | No |  |
| `rarity` | `string` | No |  |
| `release_date` | `string` | No |  |
| `reserved` | `boolean` | No |  |
| `ruling` | `any[]` | No |  |
| `set` | `string` | No |  |
| `set_name` | `string` | No |  |
| `source` | `string` | No |  |
| `starter` | `boolean` | No |  |
| `subtype` | `any[]` | No |  |
| `supertype` | `any[]` | No |  |
| `text` | `string` | No |  |
| `timeshifted` | `boolean` | No |  |
| `toughness` | `string` | No |  |
| `type` | `string` | No |  |
| `variation` | `any[]` | No |  |
| `watermark` | `string` | No |  |

### Operations

#### `list(match: object, ctrl?: object)`

List entities matching the given criteria. Returns an array.

```ts
const results = await client.SetBooster().list()
```

### Common Methods

#### `data(data?: object)`

Get or set the entity data. When called with data, sets the entity's
internal data and returns the current data. When called without
arguments, returns a copy of the current data.

#### `match(match?: object)`

Get or set the entity match criteria. Works the same as `data()`.

#### `make()`

Create a new `SetBoosterEntity` instance with the same client and
options.

#### `client()`

Return the parent `MagicTheGatheringTwoSDK` instance.

#### `entopts()`

Return a copy of the entity options.


---

## SubtypeEntity

```ts
const subtype = client.Subtype()
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `subtype` | `any[]` | No |  |

### Operations

#### `list(match: object, ctrl?: object)`

List entities matching the given criteria. Returns an array.

```ts
const results = await client.Subtype().list()
```

### Common Methods

#### `data(data?: object)`

Get or set the entity data. When called with data, sets the entity's
internal data and returns the current data. When called without
arguments, returns a copy of the current data.

#### `match(match?: object)`

Get or set the entity match criteria. Works the same as `data()`.

#### `make()`

Create a new `SubtypeEntity` instance with the same client and
options.

#### `client()`

Return the parent `MagicTheGatheringTwoSDK` instance.

#### `entopts()`

Return a copy of the entity options.


---

## SupertypeEntity

```ts
const supertype = client.Supertype()
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `supertype` | `any[]` | No |  |

### Operations

#### `list(match: object, ctrl?: object)`

List entities matching the given criteria. Returns an array.

```ts
const results = await client.Supertype().list()
```

### Common Methods

#### `data(data?: object)`

Get or set the entity data. When called with data, sets the entity's
internal data and returns the current data. When called without
arguments, returns a copy of the current data.

#### `match(match?: object)`

Get or set the entity match criteria. Works the same as `data()`.

#### `make()`

Create a new `SupertypeEntity` instance with the same client and
options.

#### `client()`

Return the parent `MagicTheGatheringTwoSDK` instance.

#### `entopts()`

Return a copy of the entity options.


---

## TypeEntity

```ts
const type = client.Type()
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `type` | `any[]` | No |  |

### Operations

#### `list(match: object, ctrl?: object)`

List entities matching the given criteria. Returns an array.

```ts
const results = await client.Type().list()
```

### Common Methods

#### `data(data?: object)`

Get or set the entity data. When called with data, sets the entity's
internal data and returns the current data. When called without
arguments, returns a copy of the current data.

#### `match(match?: object)`

Get or set the entity match criteria. Works the same as `data()`.

#### `make()`

Create a new `TypeEntity` instance with the same client and
options.

#### `client()`

Return the parent `MagicTheGatheringTwoSDK` instance.

#### `entopts()`

Return a copy of the entity options.


---

## Features

| Feature | Version | Description |
| --- | --- | --- |
| `test` | 0.0.1 | In-memory mock transport for testing without a live server |


Features are activated via the `feature` option:

```ts
const client = new MagicTheGatheringTwoSDK({
  feature: {
    test: { active: true },
  }
})
```

