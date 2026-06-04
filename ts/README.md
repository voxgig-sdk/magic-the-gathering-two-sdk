# MagicTheGatheringTwo TypeScript SDK

The TypeScript SDK for the MagicTheGatheringTwo API. Provides a type-safe, entity-oriented interface with full async/await support.


## Install
```bash
npm install magic-the-gathering-two
```
## Tutorial: your first API call

This tutorial walks through creating a client, listing entities, and
loading a specific record.

### 1. Create a client

```ts
import { MagicTheGatheringTwoSDK } from 'magic-the-gathering-two'

const client = new MagicTheGatheringTwoSDK({})
```

### 2. List cards

```ts
const result = await client.Card().list()

if (result.ok) {
  for (const item of result.data) {
    console.log(item.id, item.name)
  }
}
```

### 3. Load a card

```ts
const result = await client.Card().load({ id: 'example_id' })

if (result.ok) {
  console.log(result.data)
}
```


## How-to guides

### Make a direct HTTP request

For endpoints not covered by entity methods:

```ts
const result = await client.direct({
  path: '/api/resource/{id}',
  method: 'GET',
  params: { id: 'example' },
})

if (result.ok) {
  console.log(result.status)  // 200
  console.log(result.data)    // response body
}
```

### Prepare a request without sending it

```ts
const fetchdef = await client.prepare({
  path: '/api/resource/{id}',
  method: 'DELETE',
  params: { id: 'example' },
})

// Inspect before sending
console.log(fetchdef.url)
console.log(fetchdef.method)
console.log(fetchdef.headers)
```

### Use test mode

Create a mock client for unit testing — no server required:

```ts
const client = MagicTheGatheringTwoSDK.test()

const result = await client.Planet().load({ id: 'test01' })
// result.ok === true
// result.data contains mock response data
```

You can also use the instance method:

```ts
const client = new MagicTheGatheringTwoSDK()
const testClient = client.tester()
```

### Retain entity state across calls

Entity instances remember their last match and data:

```ts
const entity = client.Planet()

// First call sets internal match
await entity.load({ id: 'example' })

// Subsequent calls reuse the stored match
const data = entity.data()
console.log(data.id) // 'example'
```

### Add custom middleware

Pass features via the `extend` option:

```ts
const logger = {
  hooks: {
    PreRequest: (ctx: any) => {
      console.log('Requesting:', ctx.spec.method, ctx.spec.path)
    },
    PreResponse: (ctx: any) => {
      console.log('Status:', ctx.out.request?.status)
    },
  },
}

const client = new MagicTheGatheringTwoSDK({
  extend: [logger],
})
```

### Run live tests

Create a `.env.local` file at the project root:

```
MAGIC-THE-GATHERING-TWO_TEST_LIVE=TRUE
```

Then run:

```bash
cd ts && npm test
```


## Reference

### MagicTheGatheringTwoSDK

#### Constructor

```ts
new MagicTheGatheringTwoSDK(options?: {
  base?: string
  prefix?: string
  suffix?: string
  feature?: Record<string, { active: boolean }>
  extend?: Feature[]
})
```

| Option | Type | Description |
| --- | --- | --- |
| `base` | `string` | Base URL of the API server. |
| `prefix` | `string` | URL path prefix prepended to all requests. |
| `suffix` | `string` | URL path suffix appended to all requests. |
| `feature` | `object` | Feature activation flags (e.g. `{ test: { active: true } }`). |
| `extend` | `Feature[]` | Additional feature instances to load. |

#### Methods

| Method | Returns | Description |
| --- | --- | --- |
| `options()` | `object` | Deep copy of current SDK options. |
| `utility()` | `Utility` | Deep copy of the SDK utility object. |
| `prepare(fetchargs?)` | `Promise<FetchDef>` | Build an HTTP request definition without sending it. |
| `direct(fetchargs?)` | `Promise<DirectResult>` | Build and send an HTTP request. |
| `Card(data?)` | `CardEntity` | Create a Card entity instance. |
| `Format(data?)` | `FormatEntity` | Create a Format entity instance. |
| `Set(data?)` | `SetEntity` | Create a Set entity instance. |
| `SetBooster(data?)` | `SetBoosterEntity` | Create a SetBooster entity instance. |
| `Subtype(data?)` | `SubtypeEntity` | Create a Subtype entity instance. |
| `Supertype(data?)` | `SupertypeEntity` | Create a Supertype entity instance. |
| `Type(data?)` | `TypeEntity` | Create a Type entity instance. |
| `tester(testopts?, sdkopts?)` | `MagicTheGatheringTwoSDK` | Create a test-mode client instance. |

#### Static methods

| Method | Returns | Description |
| --- | --- | --- |
| `MagicTheGatheringTwoSDK.test(testopts?, sdkopts?)` | `MagicTheGatheringTwoSDK` | Create a test-mode client. |

### Entity interface

All entities share the same interface.

#### Methods

| Method | Signature | Description |
| --- | --- | --- |
| `load` | `load(reqmatch?, ctrl?): Promise<Result>` | Load a single entity by match criteria. |
| `list` | `list(reqmatch?, ctrl?): Promise<Result>` | List entities matching the criteria. |
| `create` | `create(reqdata?, ctrl?): Promise<Result>` | Create a new entity. |
| `update` | `update(reqdata?, ctrl?): Promise<Result>` | Update an existing entity. |
| `remove` | `remove(reqmatch?, ctrl?): Promise<Result>` | Remove an entity. |
| `data` | `data(data?): any` | Get or set entity data. |
| `match` | `match(match?): any` | Get or set entity match criteria. |
| `make` | `make(): Entity` | Create a new instance with the same options. |
| `client` | `client(): MagicTheGatheringTwoSDK` | Return the parent SDK client. |
| `entopts` | `entopts(): object` | Return a copy of the entity options. |

#### Result shape

All entity operations return a Result object:

```ts
{
  ok: boolean      // true if the HTTP status is 2xx
  status: number   // HTTP status code
  headers: object  // response headers
  data: any        // parsed JSON response body
}
```

### DirectResult shape

The `direct()` method returns:

```ts
{
  ok: boolean
  status: number
  headers: object
  data: any
}
```

On error, `ok` is `false` and an `err` property contains the error.

### FetchDef shape

The `prepare()` method returns:

```ts
{
  url: string
  method: string
  headers: Record<string, string>
  body?: any
}
```

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

Operations: list, load.

API path: `/cards`

#### Format

| Field | Description |
| --- | --- |
| `format` |  |

Operations: list.

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

Operations: list, load.

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

Operations: list.

API path: `/sets/{id}/booster`

#### Subtype

| Field | Description |
| --- | --- |
| `subtype` |  |

Operations: list.

API path: `/subtypes`

#### Supertype

| Field | Description |
| --- | --- |
| `supertype` |  |

Operations: list.

API path: `/supertypes`

#### Type

| Field | Description |
| --- | --- |
| `type` |  |

Operations: list.

API path: `/types`



## Entities


### Card

Create an instance: `const card = client.Card()`

#### Operations

| Method | Description |
| --- | --- |
| `list(match)` | List entities matching the criteria. |
| `load(match)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `artist` | ``$STRING`` |  |
| `border` | ``$STRING`` |  |
| `card` | ``$OBJECT`` |  |
| `cmc` | ``$NUMBER`` |  |
| `color` | ``$ARRAY`` |  |
| `color_identity` | ``$ARRAY`` |  |
| `flavor` | ``$STRING`` |  |
| `foreign_name` | ``$ARRAY`` |  |
| `hand` | ``$INTEGER`` |  |
| `id` | ``$STRING`` |  |
| `image_url` | ``$STRING`` |  |
| `layout` | ``$STRING`` |  |
| `legality` | ``$ARRAY`` |  |
| `life` | ``$INTEGER`` |  |
| `loyalty` | ``$STRING`` |  |
| `mana_cost` | ``$STRING`` |  |
| `multiverseid` | ``$INTEGER`` |  |
| `name` | ``$STRING`` |  |
| `number` | ``$STRING`` |  |
| `original_text` | ``$STRING`` |  |
| `original_type` | ``$STRING`` |  |
| `power` | ``$STRING`` |  |
| `printing` | ``$ARRAY`` |  |
| `rarity` | ``$STRING`` |  |
| `release_date` | ``$STRING`` |  |
| `reserved` | ``$BOOLEAN`` |  |
| `ruling` | ``$ARRAY`` |  |
| `set` | ``$STRING`` |  |
| `set_name` | ``$STRING`` |  |
| `source` | ``$STRING`` |  |
| `starter` | ``$BOOLEAN`` |  |
| `subtype` | ``$ARRAY`` |  |
| `supertype` | ``$ARRAY`` |  |
| `text` | ``$STRING`` |  |
| `timeshifted` | ``$BOOLEAN`` |  |
| `toughness` | ``$STRING`` |  |
| `type` | ``$STRING`` |  |
| `variation` | ``$ARRAY`` |  |
| `watermark` | ``$STRING`` |  |

#### Example: Load

```ts
const card = await client.Card().load({ id: 'card_id' })
```

#### Example: List

```ts
const cards = await client.Card().list()
```


### Format

Create an instance: `const format = client.Format()`

#### Operations

| Method | Description |
| --- | --- |
| `list(match)` | List entities matching the criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `format` | ``$ARRAY`` |  |

#### Example: List

```ts
const formats = await client.Format().list()
```


### Set

Create an instance: `const set = client.Set()`

#### Operations

| Method | Description |
| --- | --- |
| `list(match)` | List entities matching the criteria. |
| `load(match)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `block` | ``$STRING`` |  |
| `booster` | ``$ARRAY`` |  |
| `border` | ``$STRING`` |  |
| `code` | ``$STRING`` |  |
| `gatherer_code` | ``$STRING`` |  |
| `magic_cards_info_code` | ``$STRING`` |  |
| `mkm_id` | ``$INTEGER`` |  |
| `mkm_name` | ``$STRING`` |  |
| `name` | ``$STRING`` |  |
| `online_only` | ``$BOOLEAN`` |  |
| `release_date` | ``$STRING`` |  |
| `set` | ``$OBJECT`` |  |
| `type` | ``$STRING`` |  |

#### Example: Load

```ts
const set = await client.Set().load({ id: 'set_id' })
```

#### Example: List

```ts
const sets = await client.Set().list()
```


### SetBooster

Create an instance: `const set_booster = client.SetBooster()`

#### Operations

| Method | Description |
| --- | --- |
| `list(match)` | List entities matching the criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `artist` | ``$STRING`` |  |
| `border` | ``$STRING`` |  |
| `cmc` | ``$NUMBER`` |  |
| `color` | ``$ARRAY`` |  |
| `color_identity` | ``$ARRAY`` |  |
| `flavor` | ``$STRING`` |  |
| `foreign_name` | ``$ARRAY`` |  |
| `hand` | ``$INTEGER`` |  |
| `id` | ``$STRING`` |  |
| `image_url` | ``$STRING`` |  |
| `layout` | ``$STRING`` |  |
| `legality` | ``$ARRAY`` |  |
| `life` | ``$INTEGER`` |  |
| `loyalty` | ``$STRING`` |  |
| `mana_cost` | ``$STRING`` |  |
| `multiverseid` | ``$INTEGER`` |  |
| `name` | ``$STRING`` |  |
| `number` | ``$STRING`` |  |
| `original_text` | ``$STRING`` |  |
| `original_type` | ``$STRING`` |  |
| `power` | ``$STRING`` |  |
| `printing` | ``$ARRAY`` |  |
| `rarity` | ``$STRING`` |  |
| `release_date` | ``$STRING`` |  |
| `reserved` | ``$BOOLEAN`` |  |
| `ruling` | ``$ARRAY`` |  |
| `set` | ``$STRING`` |  |
| `set_name` | ``$STRING`` |  |
| `source` | ``$STRING`` |  |
| `starter` | ``$BOOLEAN`` |  |
| `subtype` | ``$ARRAY`` |  |
| `supertype` | ``$ARRAY`` |  |
| `text` | ``$STRING`` |  |
| `timeshifted` | ``$BOOLEAN`` |  |
| `toughness` | ``$STRING`` |  |
| `type` | ``$STRING`` |  |
| `variation` | ``$ARRAY`` |  |
| `watermark` | ``$STRING`` |  |

#### Example: List

```ts
const set_boosters = await client.SetBooster().list()
```


### Subtype

Create an instance: `const subtype = client.Subtype()`

#### Operations

| Method | Description |
| --- | --- |
| `list(match)` | List entities matching the criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `subtype` | ``$ARRAY`` |  |

#### Example: List

```ts
const subtypes = await client.Subtype().list()
```


### Supertype

Create an instance: `const supertype = client.Supertype()`

#### Operations

| Method | Description |
| --- | --- |
| `list(match)` | List entities matching the criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `supertype` | ``$ARRAY`` |  |

#### Example: List

```ts
const supertypes = await client.Supertype().list()
```


### Type

Create an instance: `const type = client.Type()`

#### Operations

| Method | Description |
| --- | --- |
| `list(match)` | List entities matching the criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `type` | ``$ARRAY`` |  |

#### Example: List

```ts
const types = await client.Type().list()
```


## Explanation

### The operation pipeline

Every entity operation (load, list, create, update, remove) follows a
six-stage pipeline. Each stage fires a feature hook before executing:

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

If any stage returns an error, the pipeline short-circuits and the
error is returned to the caller.

An unexpected exception triggers the `PreUnexpected` hook before
propagating.

### Features and hooks

Features are the extension mechanism. A feature is an object with a
`hooks` map. Each hook key is a pipeline stage name, and the value is
a function that receives the context.

The SDK ships with built-in features:

- **TestFeature**: In-memory mock transport for testing without a live server

Features are initialized in order. Hooks fire in the order features
were added, so later features can override earlier ones.

### Module structure

```
magic-the-gathering-two/
├── src/
│   ├── MagicTheGatheringTwoSDK.ts        # Main SDK class
│   ├── entity/             # Entity implementations
│   ├── feature/            # Built-in features (Base, Test, Log)
│   └── utility/            # Utility functions
├── test/                   # Test suites
└── dist/                   # Compiled output
```

Import the SDK from the package root:

```ts
import { MagicTheGatheringTwoSDK } from 'magic-the-gathering-two'
```

### Entity state

Entity instances are stateful. After a successful `load`, the entity
stores the returned data and match criteria internally. Subsequent
calls on the same instance can rely on this state.

```ts
const moon = client.Moon()
await moon.load({ planet_id: 'earth', id: 'luna' })

// moon.data() now returns the loaded moon data
// moon.match() returns { planet_id: 'earth', id: 'luna' }
```

Call `make()` to create a fresh instance with the same configuration
but no stored state.

### Direct vs entity access

The entity interface handles URL construction, parameter placement,
and response parsing automatically. Use it for standard CRUD operations.

The `direct` method gives full control over the HTTP request. Use it
for non-standard endpoints, bulk operations, or any path not modelled
as an entity. The `prepare` method is useful for debugging — it
shows exactly what `direct` would send.


## Full Reference

See [REFERENCE.md](REFERENCE.md) for complete API reference
documentation including all method signatures, entity field schemas,
and detailed usage examples.
