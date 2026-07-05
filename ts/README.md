# MagicTheGatheringTwo TypeScript SDK



The TypeScript SDK for the MagicTheGatheringTwo API — a type-safe, entity-oriented client with full async/await support.

The API is exposed as capitalised, semantic **Entities** — e.g.
`client.Card()` — each with a small set of operations (`list`, `load`)
instead of raw URL paths and query parameters. This keeps the surface
predictable and low-friction for both humans and AI agents.

> Other languages, the CLI, and MCP server live alongside this one — see
> the [top-level README](../README.md).


## Install
This package is not yet published to npm. Install it from the GitHub
release tag (`ts/vX.Y.Z`):

- Releases: [https://github.com/voxgig-sdk/magic-the-gathering-two-sdk/releases](https://github.com/voxgig-sdk/magic-the-gathering-two-sdk/releases)


## Tutorial: your first API call

This tutorial walks through creating a client, listing entities, and
loading a specific record.

### 1. Create a client

```ts
import { MagicTheGatheringTwoSDK } from '@voxgig-sdk/magic-the-gathering-two'

const client = new MagicTheGatheringTwoSDK()
```

### 2. List card records

`list()` resolves to an array of Card objects — iterate it directly:

```ts
const cards = await client.Card().list()

for (const card of cards) {
  console.log(card)
}
```

### 3. Load a card

`load()` returns the entity directly and throws on failure:

```ts
try {
  const card = await client.Card().load({ id: 'example_id' })
  console.log(card)
} catch (err) {
  console.error('load failed:', err)
}
```


## Error handling

Entity operations reject on failure, so wrap them in `try` / `catch`:

```ts
try {
  const cards = await client.Card().list()
  console.log(cards)
} catch (err) {
  console.error('list failed:', err)
}
```

The low-level `direct()` method does **not** throw — it returns the
value or an `Error`, so check the result before using it:

```ts
const result = await client.direct({
  path: '/api/resource/{id}',
  method: 'GET',
  params: { id: 'example_id' },
})

if (result instanceof Error) {
  throw result
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

if (result instanceof Error) {
  throw result
}
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

const card = await client.Card().list()
// card is a bare entity populated with mock response data
console.log(card)
```

You can also use the instance method:

```ts
const client = new MagicTheGatheringTwoSDK()
const testClient = client.tester()
```

### Retain entity state across calls

Entity instances remember their last match and data:

```ts
const entity = client.Card()

// First call runs the operation and stores its result
await entity.list()

// Subsequent calls reuse the stored state
const data = entity.data()
console.log(data.id)
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
MAGIC_THE_GATHERING_TWO_TEST_LIVE=TRUE
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
| `load` | `load(reqmatch?, ctrl?): Promise<Entity>` | Load a single entity by match criteria. |
| `list` | `list(reqmatch?, ctrl?): Promise<Entity[]>` | List entities matching the criteria. |
| `data` | `data(data?: Partial<Entity>): Entity` | Get or set entity data. |
| `match` | `match(match?: Partial<Entity>): Partial<Entity>` | Get or set entity match criteria. |
| `make` | `make(): Entity` | Create a new instance with the same options. |
| `client` | `client(): MagicTheGatheringTwoSDK` | Return the parent SDK client. |
| `entopts` | `entopts(): object` | Return a copy of the entity options. |

#### Return values

Entity operations resolve to the entity data directly — there is no
result envelope:

- `load` resolves to a single entity object.
- `list` resolves to an **array** of entity objects (iterate it directly;
  there is no `.data` and no `.ok`).

On a failed request these methods **throw**, so wrap calls in
`try`/`catch` to handle errors. Only `direct()` returns the result
envelope described below.

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
| `artist` | `string` |  |
| `border` | `string` |  |
| `card` | `Record<string, any>` |  |
| `cmc` | `number` |  |
| `color` | `any[]` |  |
| `color_identity` | `any[]` |  |
| `flavor` | `string` |  |
| `foreign_name` | `any[]` |  |
| `hand` | `number` |  |
| `id` | `string` |  |
| `image_url` | `string` |  |
| `layout` | `string` |  |
| `legality` | `any[]` |  |
| `life` | `number` |  |
| `loyalty` | `string` |  |
| `mana_cost` | `string` |  |
| `multiverseid` | `number` |  |
| `name` | `string` |  |
| `number` | `string` |  |
| `original_text` | `string` |  |
| `original_type` | `string` |  |
| `power` | `string` |  |
| `printing` | `any[]` |  |
| `rarity` | `string` |  |
| `release_date` | `string` |  |
| `reserved` | `boolean` |  |
| `ruling` | `any[]` |  |
| `set` | `string` |  |
| `set_name` | `string` |  |
| `source` | `string` |  |
| `starter` | `boolean` |  |
| `subtype` | `any[]` |  |
| `supertype` | `any[]` |  |
| `text` | `string` |  |
| `timeshifted` | `boolean` |  |
| `toughness` | `string` |  |
| `type` | `string` |  |
| `variation` | `any[]` |  |
| `watermark` | `string` |  |

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
| `format` | `any[]` |  |

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
| `block` | `string` |  |
| `booster` | `any[]` |  |
| `border` | `string` |  |
| `code` | `string` |  |
| `gatherer_code` | `string` |  |
| `magic_cards_info_code` | `string` |  |
| `mkm_id` | `number` |  |
| `mkm_name` | `string` |  |
| `name` | `string` |  |
| `online_only` | `boolean` |  |
| `release_date` | `string` |  |
| `set` | `Record<string, any>` |  |
| `type` | `string` |  |

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
| `artist` | `string` |  |
| `border` | `string` |  |
| `cmc` | `number` |  |
| `color` | `any[]` |  |
| `color_identity` | `any[]` |  |
| `flavor` | `string` |  |
| `foreign_name` | `any[]` |  |
| `hand` | `number` |  |
| `id` | `string` |  |
| `image_url` | `string` |  |
| `layout` | `string` |  |
| `legality` | `any[]` |  |
| `life` | `number` |  |
| `loyalty` | `string` |  |
| `mana_cost` | `string` |  |
| `multiverseid` | `number` |  |
| `name` | `string` |  |
| `number` | `string` |  |
| `original_text` | `string` |  |
| `original_type` | `string` |  |
| `power` | `string` |  |
| `printing` | `any[]` |  |
| `rarity` | `string` |  |
| `release_date` | `string` |  |
| `reserved` | `boolean` |  |
| `ruling` | `any[]` |  |
| `set` | `string` |  |
| `set_name` | `string` |  |
| `source` | `string` |  |
| `starter` | `boolean` |  |
| `subtype` | `any[]` |  |
| `supertype` | `any[]` |  |
| `text` | `string` |  |
| `timeshifted` | `boolean` |  |
| `toughness` | `string` |  |
| `type` | `string` |  |
| `variation` | `any[]` |  |
| `watermark` | `string` |  |

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
| `subtype` | `any[]` |  |

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
| `supertype` | `any[]` |  |

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
| `type` | `any[]` |  |

#### Example: List

```ts
const types = await client.Type().list()
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
import { MagicTheGatheringTwoSDK } from '@voxgig-sdk/magic-the-gathering-two'
```

### Entity state

Entity instances are stateful. After a successful `list`, the entity
stores the returned data and match criteria internally. Subsequent
calls on the same instance can rely on this state.

```ts
const card = client.Card()
await card.list()

// card.data() now returns the card data from the last `list`
// card.match() returns the last match criteria
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
