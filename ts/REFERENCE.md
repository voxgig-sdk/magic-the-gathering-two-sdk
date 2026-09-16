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
| `artist` | `string` | No | The artist of the card |
| `border` | `string` | No | The border color if different from the set default |
| `cmc` | `number` | No | Converted mana cost |
| `colorIdentity` | `any[]` | No | The card's color identity by color code |
| `colors` | `any[]` | No | The card colors |
| `flavor` | `string` | No | The flavor text of the card |
| `foreignNames` | `any[]` | No | Foreign language names for the card |
| `hand` | `number` | No | Maximum hand size modifier (Vanguard cards only) |
| `id` | `string` | No | A unique id for this card (SHA1 hash) |
| `imageUrl` | `string` | No | The image URL for the card |
| `layout` | `string` | No | The card layout |
| `legalities` | `any[]` | No | Which formats this card is legal, restricted or banned in |
| `life` | `number` | No | Starting life total modifier (Vanguard cards only) |
| `loyalty` | `string` | No | The loyalty of the card (planeswalkers only) |
| `manaCost` | `string` | No | The mana cost of the card |
| `multiverseid` | `number` | No | The multiverseid of the card on Wizard's Gatherer |
| `name` | `string` | No | The card name |
| `names` | `any[]` | No | Only used for split, flip and dual cards. |
| `number` | `string` | No | The card number |
| `originalText` | `string` | No | The original text on the card at the time it was printed |
| `originalType` | `string` | No | The original type on the card at the time it was printed |
| `power` | `string` | No | The power of the card (creatures only) |
| `printings` | `any[]` | No | The sets that this card was printed in |
| `rarity` | `string` | No | The rarity of the card |
| `releaseDate` | `string` | No | The release date for promo cards |
| `reserved` | `boolean` | No | True if this card is reserved by Wizards Official Reprint Policy |
| `rulings` | `any[]` | No | The rulings for the card |
| `set` | `string` | No | The set code the card belongs to |
| `setName` | `string` | No | The set name the card belongs to |
| `source` | `string` | No | For promo cards, where the card was originally obtained |
| `starter` | `boolean` | No | True if this card was only released as part of a core box set |
| `subtypes` | `any[]` | No | The subtypes of the card |
| `supertypes` | `any[]` | No | The supertypes of the card |
| `text` | `string` | No | The oracle text of the card |
| `timeshifted` | `boolean` | No | True if this card was timeshifted in the set |
| `toughness` | `string` | No | The toughness of the card (creatures only) |
| `type` | `string` | No | The card type |
| `types` | `any[]` | No | The types of the card |
| `variations` | `any[]` | No | Multiverseids of alternate art variations |
| `watermark` | `string` | No | The watermark on the card |

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
| `formats` | `any[]` | No |  |

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
| `block` | `string` | No | The block the set belongs to |
| `booster` | `any[]` | No | Booster pack configuration |
| `border` | `string` | No | The border color of the set |
| `code` | `string` | No | The set code |
| `gathererCode` | `string` | No | The Gatherer code for the set |
| `id` | `string` | No |  |
| `magicCardsInfoCode` | `string` | No | The Magic Cards Info code for the set |
| `mkm_id` | `number` | No | The Magic Card Market set ID |
| `mkm_name` | `string` | No | The Magic Card Market set name |
| `name` | `string` | No | The name of the set |
| `onlineOnly` | `boolean` | No | True if the set is online only |
| `releaseDate` | `string` | No | The release date of the set |
| `type` | `string` | No | The type of the set |

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
| `artist` | `string` | No | The artist of the card |
| `border` | `string` | No | The border color if different from the set default |
| `cmc` | `number` | No | Converted mana cost |
| `colorIdentity` | `any[]` | No | The card's color identity by color code |
| `colors` | `any[]` | No | The card colors |
| `flavor` | `string` | No | The flavor text of the card |
| `foreignNames` | `any[]` | No | Foreign language names for the card |
| `hand` | `number` | No | Maximum hand size modifier (Vanguard cards only) |
| `id` | `string` | No | A unique id for this card (SHA1 hash) |
| `imageUrl` | `string` | No | The image URL for the card |
| `layout` | `string` | No | The card layout |
| `legalities` | `any[]` | No | Which formats this card is legal, restricted or banned in |
| `life` | `number` | No | Starting life total modifier (Vanguard cards only) |
| `loyalty` | `string` | No | The loyalty of the card (planeswalkers only) |
| `manaCost` | `string` | No | The mana cost of the card |
| `multiverseid` | `number` | No | The multiverseid of the card on Wizard's Gatherer |
| `name` | `string` | No | The card name |
| `names` | `any[]` | No | Only used for split, flip and dual cards. |
| `number` | `string` | No | The card number |
| `originalText` | `string` | No | The original text on the card at the time it was printed |
| `originalType` | `string` | No | The original type on the card at the time it was printed |
| `power` | `string` | No | The power of the card (creatures only) |
| `printings` | `any[]` | No | The sets that this card was printed in |
| `rarity` | `string` | No | The rarity of the card |
| `releaseDate` | `string` | No | The release date for promo cards |
| `reserved` | `boolean` | No | True if this card is reserved by Wizards Official Reprint Policy |
| `rulings` | `any[]` | No | The rulings for the card |
| `set` | `string` | No | The set code the card belongs to |
| `setName` | `string` | No | The set name the card belongs to |
| `source` | `string` | No | For promo cards, where the card was originally obtained |
| `starter` | `boolean` | No | True if this card was only released as part of a core box set |
| `subtypes` | `any[]` | No | The subtypes of the card |
| `supertypes` | `any[]` | No | The supertypes of the card |
| `text` | `string` | No | The oracle text of the card |
| `timeshifted` | `boolean` | No | True if this card was timeshifted in the set |
| `toughness` | `string` | No | The toughness of the card (creatures only) |
| `type` | `string` | No | The card type |
| `types` | `any[]` | No | The types of the card |
| `variations` | `any[]` | No | Multiverseids of alternate art variations |
| `watermark` | `string` | No | The watermark on the card |

### Operations

#### `list(match: object, ctrl?: object)`

List entities matching the given criteria. Returns an array.

```ts
const results = await client.SetBooster().list({ id: "example" })
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
| `subtypes` | `any[]` | No |  |

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
| `supertypes` | `any[]` | No |  |

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
| `types` | `any[]` | No |  |

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
| `ratelimit` | 0.0.1 | Client-side rate limiting via a token bucket |
| `retry` | 0.0.1 | Automatic retry of transient failures with exponential backoff |
| `test` | 0.0.1 | In-memory mock transport for testing without a live server |
| `timeout` | 0.0.1 | Per-request timeout with transport abort |


Features are activated via the `feature` option:

```ts
const client = new MagicTheGatheringTwoSDK({
  feature: {
    ratelimit: { active: true },
    retry: { active: true },
    test: { active: true },
    timeout: { active: true },
  }
})
```


### Configuring features

Each feature is inactive until switched on, and an SDK with no feature
configured does no feature work at all. Every option below keeps its default
unless you name it.

The array form of \`feature\` is significant: several features wrap the
transport, and the order you list them in is the order they nest.

#### Ordering

`ratelimit`, `retry`, `timeout` wrap the transport. Each
wraps whatever is already installed, so **activation order is nesting order**:
a feature activated later sits OUTSIDE one activated earlier, and sees the call
first.

That decides behaviour, not just sequence: a feature that short-circuits the
call, such as a cache serving a hit, stops every feature nested inside it from
ever seeing that call.

`test` attach to pipeline hooks
rather than the transport, so their order does not affect what they observe.

#### `ratelimit`

Client-side rate limiting via a token bucket.

**Configuration**

| Option | Default |
|---|---|
| `active` | `false` |
| `burst` | `5` |
| `rate` | `5` |

| Option | Type |
|---|---|
| `now` | function |
| `sleep` | function |

These take no default: the feature behaves one way when you supply them and
another when you do not.

**Usage**

Set `feature.ratelimit.active` to true in the client options, and override any option above in the same entry. Every option keeps
its default unless you name it.

**Considerations**

- Wraps the transport: its place in the activation order decides what it
  sees. See [Ordering](#ordering) above.
- Inactive by default: leaving it out costs nothing at runtime.

#### `retry`

Automatic retry of transient failures with exponential backoff.

**Configuration**

| Option | Default |
|---|---|
| `active` | `false` |
| `factor` | `2` |
| `maxDelay` | `2000` |
| `minDelay` | `50` |
| `retries` | `2` |
| `statuses` | `[408, 425, 429, 500, 502, 503, 504]` |

| Option | Type |
|---|---|
| `jitter` | boolean |
| `sleep` | function |

These take no default: the feature behaves one way when you supply them and
another when you do not.

**Usage**

Set `feature.retry.active` to true in the client options, and override any option above in the same entry. Every option keeps
its default unless you name it.

**Considerations**

- Wraps the transport: its place in the activation order decides what it
  sees. See [Ordering](#ordering) above.
- Inactive by default: leaving it out costs nothing at runtime.

#### `test`

In-memory mock transport for testing without a live server.

**Configuration**

| Option | Default |
|---|---|
| `active` | `false` |

| Option | Type |
|---|---|
| `entity` | map |
| `net` | map |

These take no default: the feature behaves one way when you supply them and
another when you do not.

**Usage**

Set `feature.test.active` to true in the client options, and override any option above in the same entry. Every option keeps
its default unless you name it.

**Considerations**

- Attaches to pipeline hooks, not the transport, so activation order does
  not change what it observes.
- Installs the BASE transport that the wrapping features wrap, so it must be
  activated before them.
- Inactive by default: leaving it out costs nothing at runtime.

#### `timeout`

Per-request timeout with transport abort.

**Configuration**

| Option | Default |
|---|---|
| `active` | `false` |
| `ms` | `30000` |

| Option | Type |
|---|---|
| `clearTimer` | function |
| `setTimer` | function |

These take no default: the feature behaves one way when you supply them and
another when you do not.

**Usage**

Set `feature.timeout.active` to true in the client options, and override any option above in the same entry. Every option keeps
its default unless you name it.

**Considerations**

- Wraps the transport: its place in the activation order decides what it
  sees. See [Ordering](#ordering) above.
- Inactive by default: leaving it out costs nothing at runtime.

