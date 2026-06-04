# MagicTheGatheringTwo SDK

Query Magic: The Gathering cards, sets, types, and formats from a free community-run JSON API

> TypeScript, Python, PHP, Golang, Ruby, Lua SDKs, a CLI, an interactive REPL, and an MCP server for AI agents — all generated from one OpenAPI spec by [@voxgig/sdkgen](https://github.com/voxgig/sdkgen).

## About Magic The Gathering API

The [Magic: The Gathering API](https://magicthegathering.io/) is a free, community-run JSON API that exposes card, set, and format data for the Magic: The Gathering trading card game. It is served from `https://api.magicthegathering.io/v1` and is documented at [docs.magicthegathering.io](https://docs.magicthegathering.io/).

What you get from the API:
- Card lookups by id or multiverseid, plus filtering and pagination across the full card pool (`/v1/cards`, `/v1/cards/:id`)
- Set listings and individual set detail, including randomized booster generation (`/v1/sets`, `/v1/sets/:id`, `/v1/sets/:id/booster`)
- Reference lists of card `types`, `subtypes`, `supertypes`, and game `formats`
- Rich card fields such as `name`, `manaCost`, `cmc`, `colors`, `colorIdentity`, `type`, `rarity`, `power`, `toughness`, `loyalty`, `text`, `flavor`, `artist`, `imageUrl`, `rulings`, `foreignNames`, `printings`, `legalities`, and `variations`

Operational notes: no authentication is required. Third-party applications are throttled to 5000 requests per hour; exceeding the limit returns HTTP 403 with `Rate Limit Exceeded`, and `Ratelimit-Limit` / `Ratelimit-Remaining` response headers let clients track usage. CORS is disabled on the listed endpoints.

## Try it

**TypeScript**
```bash
npm install magic-the-gathering-two
```

**Python**
```bash
pip install magic-the-gathering-two-sdk
```

**PHP**
```bash
composer require voxgig/magic-the-gathering-two-sdk
```

**Golang**
```bash
go get github.com/voxgig-sdk/magic-the-gathering-two-sdk/go
```

**Ruby**
```bash
gem install magic-the-gathering-two-sdk
```

**Lua**
```bash
luarocks install magic-the-gathering-two-sdk
```

## 30-second quickstart

### TypeScript

```ts
import { MagicTheGatheringTwoSDK } from 'magic-the-gathering-two'

const client = new MagicTheGatheringTwoSDK({})

// List all cards
const cards = await client.Card().list()
```

See the [TypeScript README](ts/README.md) for the
full guide, or scroll down for the same example in other languages.

## What's in the box

| Surface | Use it for | Path |
| --- | --- | --- |
| **SDK** (TypeScript, Python, PHP, Golang, Ruby, Lua) | App integration | `ts/` `py/` `php/` `go/` `rb/` `lua/` |
| **CLI** | Scripts, CI, ops, one-off API calls | `go-cli/` |
| **MCP server** | AI agents (Claude, Cursor, Cline) | `go-mcp/` |

## Use it from an AI agent (MCP)

The generated MCP server exposes every operation in this SDK as an
[MCP](https://modelcontextprotocol.io) tool that Claude, Cursor or Cline
can call directly. Build and register it:

```bash
cd go-mcp && go build -o magic-the-gathering-two-mcp .
```

Then add it to your agent's MCP config (Claude Desktop, Cursor, etc.):

```json
{
  "mcpServers": {
    "magic-the-gathering-two": {
      "command": "/abs/path/to/magic-the-gathering-two-mcp"
    }
  }
}
```

## Entities

The API exposes 7 entities:

| Entity | Description | API path |
| --- | --- | --- |
| **Card** | An individual Magic: The Gathering card with fields like name, manaCost, colors, type, rarity, power/toughness, rulings, and printings — served from `/v1/cards` and `/v1/cards/:id`. | `/cards` |
| **Format** | A sanctioned play format (e.g. Standard, Modern, Commander) used for card legality — listed at `/v1/formats`. | `/formats` |
| **Set** | A published card set with metadata such as code, name, block, release date, and booster configuration — served from `/v1/sets` and `/v1/sets/:id`. | `/sets` |
| **SetBooster** | A randomized booster pack generated for a given set — served from `/v1/sets/:id/booster`. | `/sets/{id}/booster` |
| **Subtype** | A card subtype value (e.g. creature subtypes like Goblin, Wizard) — listed at `/v1/subtypes`. | `/subtypes` |
| **Supertype** | A card supertype value (e.g. Legendary, Basic, Snow) — listed at `/v1/supertypes`. | `/supertypes` |
| **Type** | A primary card type value (e.g. Creature, Instant, Sorcery, Land) — listed at `/v1/types`. | `/types` |

Each entity supports the following operations where available: **load**,
**list**, **create**, **update**, and **remove**.

## Quickstart in other languages

### Python

```python
from magicthegatheringtwo_sdk import MagicTheGatheringTwoSDK

client = MagicTheGatheringTwoSDK({})

# List all cards
cards, err = client.Card(None).list(None, None)

# Load a specific card
card, err = client.Card(None).load(
    {"id": "example_id"}, None
)
```

### PHP

```php
<?php
require_once 'magicthegatheringtwo_sdk.php';

$client = new MagicTheGatheringTwoSDK([]);

// List all cards
[$cards, $err] = $client->Card(null)->list(null, null);

// Load a specific card
[$card, $err] = $client->Card(null)->load(
    ["id" => "example_id"], null
);
```

### Golang

```go
import sdk "github.com/voxgig-sdk/magic-the-gathering-two-sdk/go"

client := sdk.NewMagicTheGatheringTwoSDK(map[string]any{})

// List all cards
cards, err := client.Card(nil).List(nil, nil)
```

### Ruby

```ruby
require_relative "MagicTheGatheringTwo_sdk"

client = MagicTheGatheringTwoSDK.new({})

# List all cards
cards, err = client.Card(nil).list(nil, nil)

# Load a specific card
card, err = client.Card(nil).load(
  { "id" => "example_id" }, nil
)
```

### Lua

```lua
local sdk = require("magic-the-gathering-two_sdk")

local client = sdk.new({})

-- List all cards
local cards, err = client:Card(nil):list(nil, nil)

-- Load a specific card
local card, err = client:Card(nil):load(
  { id = "example_id" }, nil
)
```

## Unit testing in offline mode

Every SDK ships a test mode that swaps the HTTP transport for an
in-memory mock, so unit tests run offline.

### TypeScript

```ts
const client = MagicTheGatheringTwoSDK.test()
const result = await client.Card().load({ id: 'test01' })
// result.ok === true, result.data contains mock data
```

### Python

```python
client = MagicTheGatheringTwoSDK.test(None, None)
result, err = client.Card(None).load(
    {"id": "test01"}, None
)
```

### PHP

```php
$client = MagicTheGatheringTwoSDK::test(null, null);
[$result, $err] = $client->Card(null)->load(
    ["id" => "test01"], null
);
```

### Golang

```go
client := sdk.TestSDK(nil, nil)
result, err := client.Card(nil).Load(
    map[string]any{"id": "test01"}, nil,
)
```

### Ruby

```ruby
client = MagicTheGatheringTwoSDK.test(nil, nil)
result, err = client.Card(nil).load(
  { "id" => "test01" }, nil
)
```

### Lua

```lua
local client = sdk.test(nil, nil)
local result, err = client:Card(nil):load(
  { id = "test01" }, nil
)
```

## How it works

Every SDK call runs the same five-stage pipeline:

1. **Point** — resolve the API endpoint from the operation definition.
2. **Spec** — build the HTTP specification (URL, method, headers, body).
3. **Request** — send the HTTP request.
4. **Response** — receive and parse the response.
5. **Result** — extract the result data for the caller.

A feature hook fires at each stage (e.g. `PrePoint`, `PreSpec`,
`PreRequest`), so features can inspect or modify the pipeline without
forking the SDK.

### Features

| Feature | Purpose |
| --- | --- |
| **TestFeature** | In-memory mock transport for testing without a live server |

Pass custom features via the `extend` option at construction time.

### Direct and Prepare

For endpoints the entity model doesn't cover, use the low-level methods:

- **`direct(fetchargs)`** — build and send an HTTP request in one step.
- **`prepare(fetchargs)`** — build the request without sending it.

Both accept a map with `path`, `method`, `params`, `query`,
`headers`, and `body`. See the [How-to guides](#how-to-guides) below.

## How-to guides

### Make a direct API call

When the entity interface does not cover an endpoint, use `direct`:

**TypeScript:**
```ts
const result = await client.direct({
  path: '/api/resource/{id}',
  method: 'GET',
  params: { id: 'example' },
})
console.log(result.data)
```

**Python:**
```python
result, err = client.direct({
    "path": "/api/resource/{id}",
    "method": "GET",
    "params": {"id": "example"},
})
```

**PHP:**
```php
[$result, $err] = $client->direct([
    "path" => "/api/resource/{id}",
    "method" => "GET",
    "params" => ["id" => "example"],
]);
```

**Go:**
```go
result, err := client.Direct(map[string]any{
    "path":   "/api/resource/{id}",
    "method": "GET",
    "params": map[string]any{"id": "example"},
})
```

**Ruby:**
```ruby
result, err = client.direct({
  "path" => "/api/resource/{id}",
  "method" => "GET",
  "params" => { "id" => "example" },
})
```

**Lua:**
```lua
local result, err = client:direct({
  path = "/api/resource/{id}",
  method = "GET",
  params = { id = "example" },
})
```

## Per-language documentation

- [TypeScript](ts/README.md)
- [Python](py/README.md)
- [PHP](php/README.md)
- [Golang](go/README.md)
- [Ruby](rb/README.md)
- [Lua](lua/README.md)

## Using the Magic The Gathering API

- Upstream: [https://magicthegathering.io/](https://magicthegathering.io/)
- API docs: [https://docs.magicthegathering.io/](https://docs.magicthegathering.io/)

- Free to use without authentication; no API key required
- Card names, text, artwork, and related game content are trademarks and copyrights of Wizards of the Coast — this API is not produced, endorsed, supported, or affiliated with Wizards of the Coast
- Third-party applications are throttled to 5000 requests per hour
- Check the official docs at https://docs.magicthegathering.io/ for current terms

---

Generated from the Magic The Gathering API OpenAPI spec by [@voxgig/sdkgen](https://github.com/voxgig/sdkgen).
