

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


loadEnvLocal(__dirname + '/../../../.env.local')


describe('SetBoosterEntity', async () => {

  // Per-test live pacing. Delay is read from sdk-test-control.json's
  // `test.live.delayMs`; only sleeps when MAGIC_THE_GATHERING_TWO_TEST_LIVE=TRUE.
  afterEach(liveDelay('MAGIC_THE_GATHERING_TWO_TEST_LIVE'))

  test('instance', async () => {
    const testsdk = MagicTheGatheringTwoSDK.test()
    const ent = testsdk.SetBooster()
    assert(null != ent)
  })


  test('basic', async (t) => {

    const live = 'TRUE' === process.env.MAGIC_THE_GATHERING_TWO_TEST_LIVE
    for (const op of ['list']) {
      if (!live && maybeSkipControl(t, 'entityOp', 'set_booster.' + op, live)) return
    }

    
    const setup = basicSetup()
    if (setup.live) {
      return runLiveEntity(setup, {"active":true,"alias":{"field":{}},"fields":{"artist":{"a":true,"h":"Artist","n":"artist","r":false,"sh":"The artist of the card","t":"`$STRING`","key$":"artist","index$":0},"border":{"a":true,"h":"Border","n":"border","r":false,"sh":"The border color if different from the set default","t":"`$STRING`","key$":"border","index$":1},"cmc":{"a":true,"h":"Cmc","n":"cmc","r":false,"sh":"Converted mana cost","t":"`$NUMBER`","key$":"cmc","index$":2},"colorIdentity":{"a":true,"h":"Color Identity","n":"colorIdentity","r":false,"sh":"The card's color identity by color code","t":"`$ARRAY`","key$":"colorIdentity","index$":3},"colors":{"a":true,"h":"Colors","n":"colors","r":false,"sh":"The card colors","t":"`$ARRAY`","key$":"colors","index$":4},"flavor":{"a":true,"h":"Flavor","n":"flavor","r":false,"sh":"The flavor text of the card","t":"`$STRING`","key$":"flavor","index$":5},"foreignNames":{"a":true,"h":"Foreign Names","n":"foreignNames","r":false,"sh":"Foreign language names for the card","t":"`$ARRAY`","key$":"foreignNames","index$":6},"hand":{"a":true,"h":"Hand","n":"hand","r":false,"sh":"Maximum hand size modifier (Vanguard cards only)","t":"`$INTEGER`","key$":"hand","index$":7},"id":{"a":true,"h":"Id","n":"id","r":false,"sh":"A unique id for this card (SHA1 hash)","t":"`$STRING`","key$":"id","index$":8},"imageUrl":{"a":true,"h":"Image Url","n":"imageUrl","r":false,"sh":"The image URL for the card","t":"`$STRING`","key$":"imageUrl","index$":9},"layout":{"a":true,"h":"Layout","n":"layout","r":false,"sh":"The card layout","t":"`$STRING`","key$":"layout","index$":10},"legalities":{"a":true,"h":"Legalities","n":"legalities","r":false,"sh":"Which formats this card is legal, restricted or banned in","t":"`$ARRAY`","key$":"legalities","index$":11},"life":{"a":true,"h":"Life","n":"life","r":false,"sh":"Starting life total modifier (Vanguard cards only)","t":"`$INTEGER`","key$":"life","index$":12},"loyalty":{"a":true,"h":"Loyalty","n":"loyalty","r":false,"sh":"The loyalty of the card (planeswalkers only)","t":"`$STRING`","key$":"loyalty","index$":13},"manaCost":{"a":true,"h":"Mana Cost","n":"manaCost","r":false,"sh":"The mana cost of the card","t":"`$STRING`","key$":"manaCost","index$":14},"multiverseid":{"a":true,"h":"Multiverseid","n":"multiverseid","r":false,"sh":"The multiverseid of the card on Wizard's Gatherer","t":"`$INTEGER`","key$":"multiverseid","index$":15},"name":{"a":true,"h":"Name","n":"name","r":false,"sh":"The card name","t":"`$STRING`","key$":"name","index$":16},"names":{"a":true,"h":"Names","n":"names","r":false,"sh":"Only used for split, flip and dual cards.","t":"`$ARRAY`","key$":"names","index$":17},"number":{"a":true,"h":"Number","n":"number","r":false,"sh":"The card number","t":"`$STRING`","key$":"number","index$":18},"originalText":{"a":true,"h":"Original Text","n":"originalText","r":false,"sh":"The original text on the card at the time it was printed","t":"`$STRING`","key$":"originalText","index$":19},"originalType":{"a":true,"h":"Original Type","n":"originalType","r":false,"sh":"The original type on the card at the time it was printed","t":"`$STRING`","key$":"originalType","index$":20},"power":{"a":true,"h":"Power","n":"power","r":false,"sh":"The power of the card (creatures only)","t":"`$STRING`","key$":"power","index$":21},"printings":{"a":true,"h":"Printings","n":"printings","r":false,"sh":"The sets that this card was printed in","t":"`$ARRAY`","key$":"printings","index$":22},"rarity":{"a":true,"h":"Rarity","n":"rarity","r":false,"sh":"The rarity of the card","t":"`$STRING`","key$":"rarity","index$":23},"releaseDate":{"a":true,"fo":"date","h":"Release Date","n":"releaseDate","r":false,"sh":"The release date for promo cards","t":"`$STRING`","key$":"releaseDate","index$":24},"reserved":{"a":true,"h":"Reserved","n":"reserved","r":false,"sh":"True if this card is reserved by Wizards Official Reprint Policy","t":"`$BOOLEAN`","key$":"reserved","index$":25},"rulings":{"a":true,"h":"Rulings","n":"rulings","r":false,"sh":"The rulings for the card","t":"`$ARRAY`","key$":"rulings","index$":26},"set":{"a":true,"h":"Set","n":"set","r":false,"sh":"The set code the card belongs to","t":"`$STRING`","key$":"set","index$":27},"setName":{"a":true,"h":"Set Name","n":"setName","r":false,"sh":"The set name the card belongs to","t":"`$STRING`","key$":"setName","index$":28},"source":{"a":true,"h":"Source","n":"source","r":false,"sh":"For promo cards, where the card was originally obtained","t":"`$STRING`","key$":"source","index$":29},"starter":{"a":true,"h":"Starter","n":"starter","r":false,"sh":"True if this card was only released as part of a core box set","t":"`$BOOLEAN`","key$":"starter","index$":30},"subtypes":{"a":true,"h":"Subtypes","n":"subtypes","r":false,"sh":"The subtypes of the card","t":"`$ARRAY`","key$":"subtypes","index$":31},"supertypes":{"a":true,"h":"Supertypes","n":"supertypes","r":false,"sh":"The supertypes of the card","t":"`$ARRAY`","key$":"supertypes","index$":32},"text":{"a":true,"h":"Text","n":"text","r":false,"sh":"The oracle text of the card","t":"`$STRING`","key$":"text","index$":33},"timeshifted":{"a":true,"h":"Timeshifted","n":"timeshifted","r":false,"sh":"True if this card was timeshifted in the set","t":"`$BOOLEAN`","key$":"timeshifted","index$":34},"toughness":{"a":true,"h":"Toughness","n":"toughness","r":false,"sh":"The toughness of the card (creatures only)","t":"`$STRING`","key$":"toughness","index$":35},"type":{"a":true,"h":"Type","n":"type","r":false,"sh":"The card type","t":"`$STRING`","key$":"type","index$":36},"types":{"a":true,"h":"Types","n":"types","r":false,"sh":"The types of the card","t":"`$ARRAY`","key$":"types","index$":37},"variations":{"a":true,"h":"Variations","n":"variations","r":false,"sh":"Multiverseids of alternate art variations","t":"`$ARRAY`","key$":"variations","index$":38},"watermark":{"a":true,"h":"Watermark","n":"watermark","r":false,"sh":"The watermark on the card","t":"`$STRING`","key$":"watermark","index$":39}},"id":{"field":"id","name":"id"},"name":"set_booster","op":{"list":{"input":"data","name":"list","points":[{"a":true,"co":{"id":"GET /sets/{id}/booster","source":"openapi3","version":2},"g":{"params":[{"a":true,"k":"param","n":"id","or":"id","r":true,"t":"`$STRING`","index$":0}]},"k":"http","m":"GET","o":"/sets/{id}/booster","q":{"exist":["id"]},"r":{},"s":[{"lit":"sets"},{"var":"id"},{"lit":"booster"}],"t":{"req":"`reqdata`","res":"`body.cards`"},"index$":0}],"key$":"list"}},"relations":{"ancestors":[]},"key$":"set_booster","name__orig":"set_booster","Name":"SetBooster","name_":"set_booster","name-":"set-booster","NAME":"SET_BOOSTER","index$":3}, {"active":true,"entity":"set_booster","key$":"BasicSetBoosterFlow","kind":"basic","name":"BasicSetBoosterFlow","param":{},"step":[{"a":true,"d":{},"i":{},"m":{},"o":"list","s":[],"v":[{"apply":"ItemExists","def":{"ref":"set_booster_ref01"}}],"index$":0}]}, 'SetBooster', {"GET /sets/{id}/booster":{"protocol":"http","operationId":"getSetBooster","responses":{"200":{"description":"Successful response","content":{"application/json":{"schema":{"type":"object","properties":{"cards":{"items":{"properties":{"artist":{"description":"The artist of the card","type":"string","key$":"artist"},"border":{"description":"The border color if different from the set default","type":"string","key$":"border"},"cmc":{"description":"Converted mana cost","type":"number","key$":"cmc"},"colorIdentity":{"description":"The card's color identity by color code","items":{"type":"string"},"type":"array","key$":"colorIdentity"},"colors":{"description":"The card colors","items":{"type":"string"},"type":"array","key$":"colors"},"flavor":{"description":"The flavor text of the card","type":"string","key$":"flavor"},"foreignNames":{"description":"Foreign language names for the card","items":{"properties":{"language":{"type":"string"},"multiverseid":{"type":"integer"},"name":{"type":"string"}},"type":"object"},"type":"array","key$":"foreignNames"},"hand":{"description":"Maximum hand size modifier (Vanguard cards only)","type":"integer","key$":"hand"},"id":{"description":"A unique id for this card (SHA1 hash)","type":"string","key$":"id"},"imageUrl":{"description":"The image URL for the card","type":"string","key$":"imageUrl"},"layout":{"description":"The card layout","type":"string","key$":"layout"},"legalities":{"description":"Which formats this card is legal, restricted or banned in","items":{"properties":{"format":{"type":"string"},"legality":{"type":"string"}},"type":"object"},"type":"array","key$":"legalities"},"life":{"description":"Starting life total modifier (Vanguard cards only)","type":"integer","key$":"life"},"loyalty":{"description":"The loyalty of the card (planeswalkers only)","type":"string","key$":"loyalty"},"manaCost":{"description":"The mana cost of the card","type":"string","key$":"manaCost"},"multiverseid":{"description":"The multiverseid of the card on Wizard's Gatherer","type":"integer","key$":"multiverseid"},"name":{"description":"The card name","type":"string","key$":"name"},"names":{"description":"Only used for split, flip and dual cards. Contains all names on the card.","items":{"type":"string"},"type":"array","key$":"names"},"number":{"description":"The card number","type":"string","key$":"number"},"originalText":{"description":"The original text on the card at the time it was printed","type":"string","key$":"originalText"},"originalType":{"description":"The original type on the card at the time it was printed","type":"string","key$":"originalType"},"power":{"description":"The power of the card (creatures only)","type":"string","key$":"power"},"printings":{"description":"The sets that this card was printed in","items":{"type":"string"},"type":"array","key$":"printings"},"rarity":{"description":"The rarity of the card","type":"string","key$":"rarity"},"releaseDate":{"description":"The release date for promo cards","format":"date","type":"string","key$":"releaseDate"},"reserved":{"description":"True if this card is reserved by Wizards Official Reprint Policy","type":"boolean","key$":"reserved"},"rulings":{"description":"The rulings for the card","items":{"properties":{"date":{"format":"date","type":"string"},"text":{"type":"string"}},"type":"object"},"type":"array","key$":"rulings"},"set":{"description":"The set code the card belongs to","type":"string","key$":"set"},"setName":{"description":"The set name the card belongs to","type":"string","key$":"setName"},"source":{"description":"For promo cards, where the card was originally obtained","type":"string","key$":"source"},"starter":{"description":"True if this card was only released as part of a core box set","type":"boolean","key$":"starter"},"subtypes":{"description":"The subtypes of the card","items":{"type":"string"},"type":"array","key$":"subtypes"},"supertypes":{"description":"The supertypes of the card","items":{"type":"string"},"type":"array","key$":"supertypes"},"text":{"description":"The oracle text of the card","type":"string","key$":"text"},"timeshifted":{"description":"True if this card was timeshifted in the set","type":"boolean","key$":"timeshifted"},"toughness":{"description":"The toughness of the card (creatures only)","type":"string","key$":"toughness"},"type":{"description":"The card type","type":"string","key$":"type"},"types":{"description":"The types of the card","items":{"type":"string"},"type":"array","key$":"types"},"variations":{"description":"Multiverseids of alternate art variations","items":{"type":"integer"},"type":"array","key$":"variations"},"watermark":{"description":"The watermark on the card","type":"string","key$":"watermark"}},"type":"object","x-ref":"#/components/schemas/Card","index$":0},"key$":"cards","type":"array"}}}}}},"400":{"description":"Bad Request","content":{"application/json":{"schema":{"type":"object","properties":{"status":{"type":"integer","description":"HTTP status code"},"error":{"type":"string","description":"Error message"}},"x-ref":"#/components/schemas/Error"}}}},"403":{"description":"Forbidden - Rate limit exceeded","content":{"application/json":{"schema":{"type":"object","properties":{"message":{"type":"string","example":"Rate Limit Exceeded"}}}}}},"404":{"description":"Not Found","content":{"application/json":{"schema":{"type":"object","properties":{"status":{"type":"integer","description":"HTTP status code"},"error":{"type":"string","description":"Error message"}},"x-ref":"#/components/schemas/Error"}}}},"500":{"description":"Internal Server Error","content":{"application/json":{"schema":{"type":"object","properties":{"status":{"type":"integer","description":"HTTP status code"},"error":{"type":"string","description":"Error message"}},"x-ref":"#/components/schemas/Error"}}}},"503":{"description":"Service Unavailable","content":{"application/json":{"schema":{"type":"object","properties":{"status":{"type":"integer","description":"HTTP status code"},"error":{"type":"string","description":"Error message"}},"x-ref":"#/components/schemas/Error"}}}}},"parameters":[{"name":"id","in":"path","description":"The set code","required":true,"schema":{"type":"string"},"index$":0}],"securitySource":"unspecified"}})
    }
    const client = setup.client
    const struct = setup.struct

    const isempty = struct.isempty
    const select = struct.select

    let set_booster_ref01_data = Object.values(setup.data.existing.set_booster)[0] as any

    // LIST
    const set_booster_ref01_ent = client.SetBooster()
    const set_booster_ref01_match: any = {}

    const set_booster_ref01_list = (await set_booster_ref01_ent.list(set_booster_ref01_match)).map((e: any) => e.data())


  })
})



function basicSetup(extra?: any) {
  // TODO: fix test def options
  const options: any = {} // null

  // TODO: needs test utility to resolve path
  const entityDataFile =
    Path.resolve(__dirname, 
      '../../../../.sdk/test/entity/set_booster/SetBoosterTestData.json')

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
    ['set_booster01','set_booster02','set_booster03'],
    {
      '`$PACK`': ['', {
        '`$KEY`': '`$COPY`',
        '`$VAL`': ['`$FORMAT`', 'upper', '`$COPY`']
      }]
    })

  const env = envOverride({
    'MAGIC_THE_GATHERING_TWO_TEST_SET_BOOSTER_ENTID': idmap,
    'MAGIC_THE_GATHERING_TWO_TEST_LIVE': 'FALSE',
    'MAGIC_THE_GATHERING_TWO_TEST_EXPLAIN': 'FALSE',
  })

  idmap = env['MAGIC_THE_GATHERING_TWO_TEST_SET_BOOSTER_ENTID']

  const live = 'TRUE' === env.MAGIC_THE_GATHERING_TWO_TEST_LIVE

  const transport = createLiveTransport()
  if (live) {
    const rawIds = process.env['MAGIC_THE_GATHERING_TWO_TEST_SET_BOOSTER_ENTID']
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
  
