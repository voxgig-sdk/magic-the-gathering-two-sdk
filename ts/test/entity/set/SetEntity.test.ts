

import Path from 'node:path'
import * as Fs from 'node:fs'

import { test, describe, afterEach } from 'node:test'
import assert from 'node:assert'
import { createLiveTransport } from '../../live-runner'
import { runLiveEntity } from '../../live-entity'


import { MagicTheGatheringTwoSDK, BaseFeature, stdutil } from '../../..'

import {
  envOverride,
  liveClientOptions,
  liveDelay,
  loadEnvLocal,
  makeCtrl,
  makeMatch,
  makeReqdata,
  makeStepData,
  makeValid,
  maybeSkipControl,
} from '../../utility'


// AFTER the imports on purpose: TypeScript hoists `import` above any
// statement in the emitted CommonJS, so a loader placed above them would
// run only after every imported module had already been evaluated - and
// anything reading process.env at module scope would miss these values.
loadEnvLocal(__dirname + '/../../../.env.local')


describe('SetEntity', async () => {

  // Per-test live pacing. Delay is read from sdk-test-control.json's
  // `test.live.delayMs`; only sleeps when MAGIC_THE_GATHERING_TWO_TEST_LIVE=TRUE.
  afterEach(liveDelay('MAGIC_THE_GATHERING_TWO_TEST_LIVE'))

  test('instance', async () => {
    const testsdk = MagicTheGatheringTwoSDK.test()
    const ent = testsdk.Set()
    assert(null != ent)
  })


  test('basic', async (t) => {

    const live = 'TRUE' === process.env.MAGIC_THE_GATHERING_TWO_TEST_LIVE
    for (const op of ['list', 'load']) {
      if (!live && maybeSkipControl(t, 'entityOp', 'set.' + op, live)) return
    }

    
    const setup = basicSetup()
    if (setup.live) {
      return runLiveEntity(setup, {"active":true,"alias":{"field":{}},"fields":[{"active":true,"name":"block","req":false,"short":"The block the set belongs to","type":"`$STRING`","index$":0},{"active":true,"name":"booster","req":false,"short":"Booster pack configuration","type":"`$ARRAY`","index$":1},{"active":true,"name":"border","req":false,"short":"The border color of the set","type":"`$STRING`","index$":2},{"active":true,"name":"code","req":false,"short":"The set code","type":"`$STRING`","index$":3},{"active":true,"name":"gathererCode","req":false,"short":"The Gatherer code for the set","type":"`$STRING`","index$":4},{"active":true,"name":"id","req":false,"type":"`$STRING`","index$":5},{"active":true,"name":"magicCardsInfoCode","req":false,"short":"The Magic Cards Info code for the set","type":"`$STRING`","index$":6},{"active":true,"name":"mkm_id","req":false,"short":"The Magic Card Market set ID","type":"`$INTEGER`","index$":7},{"active":true,"name":"mkm_name","req":false,"short":"The Magic Card Market set name","type":"`$STRING`","index$":8},{"active":true,"name":"name","req":false,"short":"The name of the set","type":"`$STRING`","index$":9},{"active":true,"name":"onlineOnly","req":false,"short":"True if the set is online only","type":"`$BOOLEAN`","index$":10},{"active":true,"format":"date","name":"releaseDate","req":false,"short":"The release date of the set","type":"`$STRING`","index$":11},{"active":true,"name":"type","req":false,"short":"The type of the set","type":"`$STRING`","index$":12}],"id":{"field":"id","name":"id"},"name":"set","op":{"list":{"input":"data","name":"list","points":[{"active":true,"args":{"query":[{"active":true,"kind":"query","name":"block","orig":"block","reqd":false,"type":"`$STRING`","index$":0},{"active":true,"kind":"query","name":"name","orig":"name","reqd":false,"type":"`$STRING`","index$":1}]},"contract":{"id":"GET /sets","json":"{\"operationId\":\"getAllSets\",\"parameters\":[{\"description\":\"Filter sets by name\",\"in\":\"query\",\"name\":\"name\",\"required\":false,\"schema\":{\"type\":\"string\"}},{\"description\":\"Filter sets by block\",\"in\":\"query\",\"name\":\"block\",\"required\":false,\"schema\":{\"type\":\"string\"}}],\"protocol\":\"http\",\"responses\":{\"200\":{\"content\":{\"application/json\":{\"schema\":{\"properties\":{\"sets\":{\"items\":{\"properties\":{\"block\":{\"description\":\"The block the set belongs to\",\"type\":\"string\"},\"booster\":{\"description\":\"Booster pack configuration\",\"items\":{\"type\":\"string\"},\"type\":\"array\"},\"border\":{\"description\":\"The border color of the set\",\"type\":\"string\"},\"code\":{\"description\":\"The set code\",\"type\":\"string\"},\"gathererCode\":{\"description\":\"The Gatherer code for the set\",\"type\":\"string\"},\"magicCardsInfoCode\":{\"description\":\"The Magic Cards Info code for the set\",\"type\":\"string\"},\"mkm_id\":{\"description\":\"The Magic Card Market set ID\",\"type\":\"integer\"},\"mkm_name\":{\"description\":\"The Magic Card Market set name\",\"type\":\"string\"},\"name\":{\"description\":\"The name of the set\",\"type\":\"string\"},\"onlineOnly\":{\"description\":\"True if the set is online only\",\"type\":\"boolean\"},\"releaseDate\":{\"description\":\"The release date of the set\",\"format\":\"date\",\"type\":\"string\"},\"type\":{\"description\":\"The type of the set\",\"type\":\"string\"}},\"type\":\"object\"},\"type\":\"array\"}},\"type\":\"object\"}}},\"description\":\"Successful response\"},\"400\":{\"content\":{\"application/json\":{\"schema\":{\"properties\":{\"error\":{\"description\":\"Error message\",\"type\":\"string\"},\"status\":{\"description\":\"HTTP status code\",\"type\":\"integer\"}},\"type\":\"object\"}}},\"description\":\"Bad Request\"},\"403\":{\"content\":{\"application/json\":{\"schema\":{\"properties\":{\"message\":{\"example\":\"Rate Limit Exceeded\",\"type\":\"string\"}},\"type\":\"object\"}}},\"description\":\"Forbidden - Rate limit exceeded\"},\"404\":{\"content\":{\"application/json\":{\"schema\":{\"properties\":{\"error\":{\"description\":\"Error message\",\"type\":\"string\"},\"status\":{\"description\":\"HTTP status code\",\"type\":\"integer\"}},\"type\":\"object\"}}},\"description\":\"Not Found\"},\"500\":{\"content\":{\"application/json\":{\"schema\":{\"properties\":{\"error\":{\"description\":\"Error message\",\"type\":\"string\"},\"status\":{\"description\":\"HTTP status code\",\"type\":\"integer\"}},\"type\":\"object\"}}},\"description\":\"Internal Server Error\"},\"503\":{\"content\":{\"application/json\":{\"schema\":{\"properties\":{\"error\":{\"description\":\"Error message\",\"type\":\"string\"},\"status\":{\"description\":\"HTTP status code\",\"type\":\"integer\"}},\"type\":\"object\"}}},\"description\":\"Service Unavailable\"}},\"securitySource\":\"unspecified\"}","source":"openapi3","version":1},"kind":"http","method":"GET","orig":"/sets","segments":[{"lit":"sets"}],"select":{"exist":["block","name"]},"transform":{"req":"`reqdata`","res":"`body.sets`"},"index$":0}],"key$":"list"},"load":{"input":"data","name":"load","points":[{"active":true,"args":{"params":[{"active":true,"kind":"param","name":"id","orig":"id","reqd":true,"type":"`$STRING`","index$":0}]},"contract":{"id":"GET /sets/{id}","json":"{\"operationId\":\"getSetById\",\"parameters\":[{\"description\":\"The set code or ID\",\"in\":\"path\",\"name\":\"id\",\"required\":true,\"schema\":{\"type\":\"string\"}}],\"protocol\":\"http\",\"responses\":{\"200\":{\"content\":{\"application/json\":{\"schema\":{\"properties\":{\"set\":{\"properties\":{\"block\":{\"description\":\"The block the set belongs to\",\"type\":\"string\"},\"booster\":{\"description\":\"Booster pack configuration\",\"items\":{\"type\":\"string\"},\"type\":\"array\"},\"border\":{\"description\":\"The border color of the set\",\"type\":\"string\"},\"code\":{\"description\":\"The set code\",\"type\":\"string\"},\"gathererCode\":{\"description\":\"The Gatherer code for the set\",\"type\":\"string\"},\"magicCardsInfoCode\":{\"description\":\"The Magic Cards Info code for the set\",\"type\":\"string\"},\"mkm_id\":{\"description\":\"The Magic Card Market set ID\",\"type\":\"integer\"},\"mkm_name\":{\"description\":\"The Magic Card Market set name\",\"type\":\"string\"},\"name\":{\"description\":\"The name of the set\",\"type\":\"string\"},\"onlineOnly\":{\"description\":\"True if the set is online only\",\"type\":\"boolean\"},\"releaseDate\":{\"description\":\"The release date of the set\",\"format\":\"date\",\"type\":\"string\"},\"type\":{\"description\":\"The type of the set\",\"type\":\"string\"}},\"type\":\"object\"}},\"type\":\"object\"}}},\"description\":\"Successful response\"},\"400\":{\"content\":{\"application/json\":{\"schema\":{\"properties\":{\"error\":{\"description\":\"Error message\",\"type\":\"string\"},\"status\":{\"description\":\"HTTP status code\",\"type\":\"integer\"}},\"type\":\"object\"}}},\"description\":\"Bad Request\"},\"403\":{\"content\":{\"application/json\":{\"schema\":{\"properties\":{\"message\":{\"example\":\"Rate Limit Exceeded\",\"type\":\"string\"}},\"type\":\"object\"}}},\"description\":\"Forbidden - Rate limit exceeded\"},\"404\":{\"content\":{\"application/json\":{\"schema\":{\"properties\":{\"error\":{\"description\":\"Error message\",\"type\":\"string\"},\"status\":{\"description\":\"HTTP status code\",\"type\":\"integer\"}},\"type\":\"object\"}}},\"description\":\"Not Found\"},\"500\":{\"content\":{\"application/json\":{\"schema\":{\"properties\":{\"error\":{\"description\":\"Error message\",\"type\":\"string\"},\"status\":{\"description\":\"HTTP status code\",\"type\":\"integer\"}},\"type\":\"object\"}}},\"description\":\"Internal Server Error\"},\"503\":{\"content\":{\"application/json\":{\"schema\":{\"properties\":{\"error\":{\"description\":\"Error message\",\"type\":\"string\"},\"status\":{\"description\":\"HTTP status code\",\"type\":\"integer\"}},\"type\":\"object\"}}},\"description\":\"Service Unavailable\"}},\"securitySource\":\"unspecified\"}","source":"openapi3","version":1},"kind":"http","method":"GET","orig":"/sets/{id}","segments":[{"lit":"sets"},{"var":"id"}],"select":{"exist":["id"]},"transform":{"req":"`reqdata`","res":"`body.set`"},"index$":0}],"key$":"load"}},"relations":{"ancestors":[]},"key$":"set","name__orig":"set","Name":"Set","name_":"set","name-":"set","NAME":"SET","index$":2}, {"active":true,"entity":"set","key$":"BasicSetFlow","kind":"basic","name":"BasicSetFlow","param":{},"step":[{"active":true,"data":{},"input":{},"match":{},"op":"list","spec":[],"valid":[{"apply":"ItemExists","def":{"ref":"set_ref01"}}],"index$":0},{"active":true,"data":{},"input":{"ref":"set_ref01","srcdatavar":"set_ref01_data","suffix":"_dt0"},"match":{"id":"set01"},"op":"load","spec":[],"valid":[{"apply":"TextFieldMark","def":{"mark":"Mark01-set_ref01"}}],"index$":1}]}, 'Set')
    }
    const client = setup.client
    const struct = setup.struct

    const isempty = struct.isempty
    const select = struct.select

    let set_ref01_data = Object.values(setup.data.existing.set)[0] as any

    // LIST
    const set_ref01_ent = client.Set()
    const set_ref01_match: any = {}

    const set_ref01_list = (await set_ref01_ent.list(set_ref01_match)).map((e: any) => e.data())


    // LOAD
    const set_ref01_match_dt0: any = {}
    set_ref01_match_dt0.id = set_ref01_data.id
    const set_ref01_data_dt0 = (await set_ref01_ent.load(set_ref01_match_dt0)).data()
    assert(set_ref01_data_dt0.id === set_ref01_data.id)


  })
})



function basicSetup(extra?: any) {
  // TODO: fix test def options
  const options: any = {} // null

  // TODO: needs test utility to resolve path
  const entityDataFile =
    Path.resolve(__dirname, 
      '../../../../.sdk/test/entity/set/SetTestData.json')

  // TODO: file ready util needed?
  const entityDataSource = Fs.readFileSync(entityDataFile).toString('utf8')

  // TODO: need a xlang JSON parse utility in voxgig/struct with better error msgs
  const entityData = JSON.parse(entityDataSource)

  options.entity = entityData.existing

  let client = MagicTheGatheringTwoSDK.test(options, extra)
  const struct = client.utility().struct
  const merge = struct.merge
  const transform = struct.transform

  let idmap = transform(
    ['set01','set02','set03'],
    {
      '`$PACK`': ['', {
        '`$KEY`': '`$COPY`',
        '`$VAL`': ['`$FORMAT`', 'upper', '`$COPY`']
      }]
    })

  const env = envOverride({
    'MAGIC_THE_GATHERING_TWO_TEST_SET_ENTID': idmap,
    'MAGIC_THE_GATHERING_TWO_TEST_LIVE': 'FALSE',
    'MAGIC_THE_GATHERING_TWO_TEST_EXPLAIN': 'FALSE',
  })

  idmap = env['MAGIC_THE_GATHERING_TWO_TEST_SET_ENTID']

  const live = 'TRUE' === env.MAGIC_THE_GATHERING_TWO_TEST_LIVE

  const transport = createLiveTransport()
  if (live) {
    const rawIds = process.env['MAGIC_THE_GATHERING_TWO_TEST_SET_ENTID']
    idmap = rawIds && rawIds.trim() ? JSON.parse(rawIds) : {}
    if (!idmap || Array.isArray(idmap) || typeof idmap !== 'object') {
      throw new Error('Live ENTID must be a JSON object')
    }
    client = new MagicTheGatheringTwoSDK(merge([
      // FIRST, so the generated fields below win: sdk-test-control.json's
      // test.client.options adds to the live client, it does not redirect it.
      liveClientOptions(),
      {
      },
      // 'extra || {}', not a bare 'extra': struct.merge returns UNDEFINED when the
      // last entry is undefined, and basicSetup is normally called with no
      // argument at all - so a bare 'extra' silently discarded the apikey
      // and server values above and handed the SDK undefined. Harmless
      // while there was nothing in that object; not harmless now.
      extra || {},
      { system: { fetch: transport.fetch } }
    ]))
  }

  const setup = {
    idmap,
    env,
    options,
    client,
    struct,
    data: entityData,
    explain: 'TRUE' === env.MAGIC_THE_GATHERING_TWO_TEST_EXPLAIN,
    live,
    transport,
    now: Date.now(),
  }

  return setup
}
  
