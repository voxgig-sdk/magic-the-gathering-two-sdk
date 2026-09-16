"use strict";
var __createBinding = (this && this.__createBinding) || (Object.create ? (function(o, m, k, k2) {
    if (k2 === undefined) k2 = k;
    var desc = Object.getOwnPropertyDescriptor(m, k);
    if (!desc || ("get" in desc ? !m.__esModule : desc.writable || desc.configurable)) {
      desc = { enumerable: true, get: function() { return m[k]; } };
    }
    Object.defineProperty(o, k2, desc);
}) : (function(o, m, k, k2) {
    if (k2 === undefined) k2 = k;
    o[k2] = m[k];
}));
var __setModuleDefault = (this && this.__setModuleDefault) || (Object.create ? (function(o, v) {
    Object.defineProperty(o, "default", { enumerable: true, value: v });
}) : function(o, v) {
    o["default"] = v;
});
var __importStar = (this && this.__importStar) || (function () {
    var ownKeys = function(o) {
        ownKeys = Object.getOwnPropertyNames || function (o) {
            var ar = [];
            for (var k in o) if (Object.prototype.hasOwnProperty.call(o, k)) ar[ar.length] = k;
            return ar;
        };
        return ownKeys(o);
    };
    return function (mod) {
        if (mod && mod.__esModule) return mod;
        var result = {};
        if (mod != null) for (var k = ownKeys(mod), i = 0; i < k.length; i++) if (k[i] !== "default") __createBinding(result, mod, k[i]);
        __setModuleDefault(result, mod);
        return result;
    };
})();
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
const node_path_1 = __importDefault(require("node:path"));
const Fs = __importStar(require("node:fs"));
const node_test_1 = require("node:test");
const node_assert_1 = __importDefault(require("node:assert"));
const live_runner_1 = require("../../live-runner");
const live_entity_1 = require("../../live-entity");
const __1 = require("../../..");
const utility_1 = require("../../utility");
// AFTER the imports on purpose: TypeScript hoists `import` above any
// statement in the emitted CommonJS, so a loader placed above them would
// run only after every imported module had already been evaluated - and
// anything reading process.env at module scope would miss these values.
(0, utility_1.loadEnvLocal)(__dirname + '/../../../.env.local');
(0, node_test_1.describe)('SetBoosterEntity', async () => {
    // Per-test live pacing. Delay is read from sdk-test-control.json's
    // `test.live.delayMs`; only sleeps when MAGIC_THE_GATHERING_TWO_TEST_LIVE=TRUE.
    (0, node_test_1.afterEach)((0, utility_1.liveDelay)('MAGIC_THE_GATHERING_TWO_TEST_LIVE'));
    (0, node_test_1.test)('instance', async () => {
        const testsdk = __1.MagicTheGatheringTwoSDK.test();
        const ent = testsdk.SetBooster();
        (0, node_assert_1.default)(null != ent);
    });
    (0, node_test_1.test)('basic', async (t) => {
        const live = 'TRUE' === process.env.MAGIC_THE_GATHERING_TWO_TEST_LIVE;
        for (const op of ['list']) {
            if (!live && (0, utility_1.maybeSkipControl)(t, 'entityOp', 'set_booster.' + op, live))
                return;
        }
        const setup = basicSetup();
        if (setup.live) {
            return (0, live_entity_1.runLiveEntity)(setup, { "active": true, "alias": { "field": {} }, "fields": [{ "active": true, "name": "artist", "req": false, "short": "The artist of the card", "type": "`$STRING`", "index$": 0 }, { "active": true, "name": "border", "req": false, "short": "The border color if different from the set default", "type": "`$STRING`", "index$": 1 }, { "active": true, "name": "cmc", "req": false, "short": "Converted mana cost", "type": "`$NUMBER`", "index$": 2 }, { "active": true, "name": "colorIdentity", "req": false, "short": "The card's color identity by color code", "type": "`$ARRAY`", "index$": 3 }, { "active": true, "name": "colors", "req": false, "short": "The card colors", "type": "`$ARRAY`", "index$": 4 }, { "active": true, "name": "flavor", "req": false, "short": "The flavor text of the card", "type": "`$STRING`", "index$": 5 }, { "active": true, "name": "foreignNames", "req": false, "short": "Foreign language names for the card", "type": "`$ARRAY`", "index$": 6 }, { "active": true, "name": "hand", "req": false, "short": "Maximum hand size modifier (Vanguard cards only)", "type": "`$INTEGER`", "index$": 7 }, { "active": true, "name": "id", "req": false, "short": "A unique id for this card (SHA1 hash)", "type": "`$STRING`", "index$": 8 }, { "active": true, "name": "imageUrl", "req": false, "short": "The image URL for the card", "type": "`$STRING`", "index$": 9 }, { "active": true, "name": "layout", "req": false, "short": "The card layout", "type": "`$STRING`", "index$": 10 }, { "active": true, "name": "legalities", "req": false, "short": "Which formats this card is legal, restricted or banned in", "type": "`$ARRAY`", "index$": 11 }, { "active": true, "name": "life", "req": false, "short": "Starting life total modifier (Vanguard cards only)", "type": "`$INTEGER`", "index$": 12 }, { "active": true, "name": "loyalty", "req": false, "short": "The loyalty of the card (planeswalkers only)", "type": "`$STRING`", "index$": 13 }, { "active": true, "name": "manaCost", "req": false, "short": "The mana cost of the card", "type": "`$STRING`", "index$": 14 }, { "active": true, "name": "multiverseid", "req": false, "short": "The multiverseid of the card on Wizard's Gatherer", "type": "`$INTEGER`", "index$": 15 }, { "active": true, "name": "name", "req": false, "short": "The card name", "type": "`$STRING`", "index$": 16 }, { "active": true, "name": "names", "req": false, "short": "Only used for split, flip and dual cards.", "type": "`$ARRAY`", "index$": 17 }, { "active": true, "name": "number", "req": false, "short": "The card number", "type": "`$STRING`", "index$": 18 }, { "active": true, "name": "originalText", "req": false, "short": "The original text on the card at the time it was printed", "type": "`$STRING`", "index$": 19 }, { "active": true, "name": "originalType", "req": false, "short": "The original type on the card at the time it was printed", "type": "`$STRING`", "index$": 20 }, { "active": true, "name": "power", "req": false, "short": "The power of the card (creatures only)", "type": "`$STRING`", "index$": 21 }, { "active": true, "name": "printings", "req": false, "short": "The sets that this card was printed in", "type": "`$ARRAY`", "index$": 22 }, { "active": true, "name": "rarity", "req": false, "short": "The rarity of the card", "type": "`$STRING`", "index$": 23 }, { "active": true, "format": "date", "name": "releaseDate", "req": false, "short": "The release date for promo cards", "type": "`$STRING`", "index$": 24 }, { "active": true, "name": "reserved", "req": false, "short": "True if this card is reserved by Wizards Official Reprint Policy", "type": "`$BOOLEAN`", "index$": 25 }, { "active": true, "name": "rulings", "req": false, "short": "The rulings for the card", "type": "`$ARRAY`", "index$": 26 }, { "active": true, "name": "set", "req": false, "short": "The set code the card belongs to", "type": "`$STRING`", "index$": 27 }, { "active": true, "name": "setName", "req": false, "short": "The set name the card belongs to", "type": "`$STRING`", "index$": 28 }, { "active": true, "name": "source", "req": false, "short": "For promo cards, where the card was originally obtained", "type": "`$STRING`", "index$": 29 }, { "active": true, "name": "starter", "req": false, "short": "True if this card was only released as part of a core box set", "type": "`$BOOLEAN`", "index$": 30 }, { "active": true, "name": "subtypes", "req": false, "short": "The subtypes of the card", "type": "`$ARRAY`", "index$": 31 }, { "active": true, "name": "supertypes", "req": false, "short": "The supertypes of the card", "type": "`$ARRAY`", "index$": 32 }, { "active": true, "name": "text", "req": false, "short": "The oracle text of the card", "type": "`$STRING`", "index$": 33 }, { "active": true, "name": "timeshifted", "req": false, "short": "True if this card was timeshifted in the set", "type": "`$BOOLEAN`", "index$": 34 }, { "active": true, "name": "toughness", "req": false, "short": "The toughness of the card (creatures only)", "type": "`$STRING`", "index$": 35 }, { "active": true, "name": "type", "req": false, "short": "The card type", "type": "`$STRING`", "index$": 36 }, { "active": true, "name": "types", "req": false, "short": "The types of the card", "type": "`$ARRAY`", "index$": 37 }, { "active": true, "name": "variations", "req": false, "short": "Multiverseids of alternate art variations", "type": "`$ARRAY`", "index$": 38 }, { "active": true, "name": "watermark", "req": false, "short": "The watermark on the card", "type": "`$STRING`", "index$": 39 }], "id": { "field": "id", "name": "id" }, "name": "set_booster", "op": { "list": { "input": "data", "name": "list", "points": [{ "active": true, "args": { "params": [{ "active": true, "kind": "param", "name": "id", "orig": "id", "reqd": true, "type": "`$STRING`", "index$": 0 }] }, "contract": { "id": "GET /sets/{id}/booster", "json": "{\"operationId\":\"getSetBooster\",\"parameters\":[{\"description\":\"The set code\",\"in\":\"path\",\"name\":\"id\",\"required\":true,\"schema\":{\"type\":\"string\"}}],\"protocol\":\"http\",\"responses\":{\"200\":{\"content\":{\"application/json\":{\"schema\":{\"properties\":{\"cards\":{\"items\":{\"properties\":{\"artist\":{\"description\":\"The artist of the card\",\"type\":\"string\"},\"border\":{\"description\":\"The border color if different from the set default\",\"type\":\"string\"},\"cmc\":{\"description\":\"Converted mana cost\",\"type\":\"number\"},\"colorIdentity\":{\"description\":\"The card's color identity by color code\",\"items\":{\"type\":\"string\"},\"type\":\"array\"},\"colors\":{\"description\":\"The card colors\",\"items\":{\"type\":\"string\"},\"type\":\"array\"},\"flavor\":{\"description\":\"The flavor text of the card\",\"type\":\"string\"},\"foreignNames\":{\"description\":\"Foreign language names for the card\",\"items\":{\"properties\":{\"language\":{\"type\":\"string\"},\"multiverseid\":{\"type\":\"integer\"},\"name\":{\"type\":\"string\"}},\"type\":\"object\"},\"type\":\"array\"},\"hand\":{\"description\":\"Maximum hand size modifier (Vanguard cards only)\",\"type\":\"integer\"},\"id\":{\"description\":\"A unique id for this card (SHA1 hash)\",\"type\":\"string\"},\"imageUrl\":{\"description\":\"The image URL for the card\",\"type\":\"string\"},\"layout\":{\"description\":\"The card layout\",\"type\":\"string\"},\"legalities\":{\"description\":\"Which formats this card is legal, restricted or banned in\",\"items\":{\"properties\":{\"format\":{\"type\":\"string\"},\"legality\":{\"type\":\"string\"}},\"type\":\"object\"},\"type\":\"array\"},\"life\":{\"description\":\"Starting life total modifier (Vanguard cards only)\",\"type\":\"integer\"},\"loyalty\":{\"description\":\"The loyalty of the card (planeswalkers only)\",\"type\":\"string\"},\"manaCost\":{\"description\":\"The mana cost of the card\",\"type\":\"string\"},\"multiverseid\":{\"description\":\"The multiverseid of the card on Wizard's Gatherer\",\"type\":\"integer\"},\"name\":{\"description\":\"The card name\",\"type\":\"string\"},\"names\":{\"description\":\"Only used for split, flip and dual cards. Contains all names on the card.\",\"items\":{\"type\":\"string\"},\"type\":\"array\"},\"number\":{\"description\":\"The card number\",\"type\":\"string\"},\"originalText\":{\"description\":\"The original text on the card at the time it was printed\",\"type\":\"string\"},\"originalType\":{\"description\":\"The original type on the card at the time it was printed\",\"type\":\"string\"},\"power\":{\"description\":\"The power of the card (creatures only)\",\"type\":\"string\"},\"printings\":{\"description\":\"The sets that this card was printed in\",\"items\":{\"type\":\"string\"},\"type\":\"array\"},\"rarity\":{\"description\":\"The rarity of the card\",\"type\":\"string\"},\"releaseDate\":{\"description\":\"The release date for promo cards\",\"format\":\"date\",\"type\":\"string\"},\"reserved\":{\"description\":\"True if this card is reserved by Wizards Official Reprint Policy\",\"type\":\"boolean\"},\"rulings\":{\"description\":\"The rulings for the card\",\"items\":{\"properties\":{\"date\":{\"format\":\"date\",\"type\":\"string\"},\"text\":{\"type\":\"string\"}},\"type\":\"object\"},\"type\":\"array\"},\"set\":{\"description\":\"The set code the card belongs to\",\"type\":\"string\"},\"setName\":{\"description\":\"The set name the card belongs to\",\"type\":\"string\"},\"source\":{\"description\":\"For promo cards, where the card was originally obtained\",\"type\":\"string\"},\"starter\":{\"description\":\"True if this card was only released as part of a core box set\",\"type\":\"boolean\"},\"subtypes\":{\"description\":\"The subtypes of the card\",\"items\":{\"type\":\"string\"},\"type\":\"array\"},\"supertypes\":{\"description\":\"The supertypes of the card\",\"items\":{\"type\":\"string\"},\"type\":\"array\"},\"text\":{\"description\":\"The oracle text of the card\",\"type\":\"string\"},\"timeshifted\":{\"description\":\"True if this card was timeshifted in the set\",\"type\":\"boolean\"},\"toughness\":{\"description\":\"The toughness of the card (creatures only)\",\"type\":\"string\"},\"type\":{\"description\":\"The card type\",\"type\":\"string\"},\"types\":{\"description\":\"The types of the card\",\"items\":{\"type\":\"string\"},\"type\":\"array\"},\"variations\":{\"description\":\"Multiverseids of alternate art variations\",\"items\":{\"type\":\"integer\"},\"type\":\"array\"},\"watermark\":{\"description\":\"The watermark on the card\",\"type\":\"string\"}},\"type\":\"object\"},\"type\":\"array\"}},\"type\":\"object\"}}},\"description\":\"Successful response\"},\"400\":{\"content\":{\"application/json\":{\"schema\":{\"properties\":{\"error\":{\"description\":\"Error message\",\"type\":\"string\"},\"status\":{\"description\":\"HTTP status code\",\"type\":\"integer\"}},\"type\":\"object\"}}},\"description\":\"Bad Request\"},\"403\":{\"content\":{\"application/json\":{\"schema\":{\"properties\":{\"message\":{\"example\":\"Rate Limit Exceeded\",\"type\":\"string\"}},\"type\":\"object\"}}},\"description\":\"Forbidden - Rate limit exceeded\"},\"404\":{\"content\":{\"application/json\":{\"schema\":{\"properties\":{\"error\":{\"description\":\"Error message\",\"type\":\"string\"},\"status\":{\"description\":\"HTTP status code\",\"type\":\"integer\"}},\"type\":\"object\"}}},\"description\":\"Not Found\"},\"500\":{\"content\":{\"application/json\":{\"schema\":{\"properties\":{\"error\":{\"description\":\"Error message\",\"type\":\"string\"},\"status\":{\"description\":\"HTTP status code\",\"type\":\"integer\"}},\"type\":\"object\"}}},\"description\":\"Internal Server Error\"},\"503\":{\"content\":{\"application/json\":{\"schema\":{\"properties\":{\"error\":{\"description\":\"Error message\",\"type\":\"string\"},\"status\":{\"description\":\"HTTP status code\",\"type\":\"integer\"}},\"type\":\"object\"}}},\"description\":\"Service Unavailable\"}},\"securitySource\":\"unspecified\"}", "source": "openapi3", "version": 1 }, "kind": "http", "method": "GET", "orig": "/sets/{id}/booster", "segments": [{ "lit": "sets" }, { "var": "id" }, { "lit": "booster" }], "select": { "exist": ["id"] }, "transform": { "req": "`reqdata`", "res": "`body.cards`" }, "index$": 0 }], "key$": "list" } }, "relations": { "ancestors": [] }, "key$": "set_booster", "name__orig": "set_booster", "Name": "SetBooster", "name_": "set_booster", "name-": "set-booster", "NAME": "SET_BOOSTER", "index$": 3 }, { "active": true, "entity": "set_booster", "key$": "BasicSetBoosterFlow", "kind": "basic", "name": "BasicSetBoosterFlow", "param": {}, "step": [{ "active": true, "data": {}, "input": {}, "match": {}, "op": "list", "spec": [], "valid": [{ "apply": "ItemExists", "def": { "ref": "set_booster_ref01" } }], "index$": 0 }] }, 'SetBooster');
        }
        const client = setup.client;
        const struct = setup.struct;
        const isempty = struct.isempty;
        const select = struct.select;
        let set_booster_ref01_data = Object.values(setup.data.existing.set_booster)[0];
        // LIST
        const set_booster_ref01_ent = client.SetBooster();
        const set_booster_ref01_match = {};
        const set_booster_ref01_list = (await set_booster_ref01_ent.list(set_booster_ref01_match)).map((e) => e.data());
    });
});
function basicSetup(extra) {
    // TODO: fix test def options
    const options = {}; // null
    // TODO: needs test utility to resolve path
    const entityDataFile = node_path_1.default.resolve(__dirname, '../../../../.sdk/test/entity/set_booster/SetBoosterTestData.json');
    // TODO: file ready util needed?
    const entityDataSource = Fs.readFileSync(entityDataFile).toString('utf8');
    // TODO: need a xlang JSON parse utility in voxgig/struct with better error msgs
    const entityData = JSON.parse(entityDataSource);
    options.entity = entityData.existing;
    let client = __1.MagicTheGatheringTwoSDK.test(options, extra);
    const struct = client.utility().struct;
    const merge = struct.merge;
    const transform = struct.transform;
    let idmap = transform(['set_booster01', 'set_booster02', 'set_booster03'], {
        '`$PACK`': ['', {
                '`$KEY`': '`$COPY`',
                '`$VAL`': ['`$FORMAT`', 'upper', '`$COPY`']
            }]
    });
    const env = (0, utility_1.envOverride)({
        'MAGIC_THE_GATHERING_TWO_TEST_SET_BOOSTER_ENTID': idmap,
        'MAGIC_THE_GATHERING_TWO_TEST_LIVE': 'FALSE',
        'MAGIC_THE_GATHERING_TWO_TEST_EXPLAIN': 'FALSE',
    });
    idmap = env['MAGIC_THE_GATHERING_TWO_TEST_SET_BOOSTER_ENTID'];
    const live = 'TRUE' === env.MAGIC_THE_GATHERING_TWO_TEST_LIVE;
    const transport = (0, live_runner_1.createLiveTransport)();
    if (live) {
        const rawIds = process.env['MAGIC_THE_GATHERING_TWO_TEST_SET_BOOSTER_ENTID'];
        idmap = rawIds && rawIds.trim() ? JSON.parse(rawIds) : {};
        if (!idmap || Array.isArray(idmap) || typeof idmap !== 'object') {
            throw new Error('Live ENTID must be a JSON object');
        }
        client = new __1.MagicTheGatheringTwoSDK(merge([
            // FIRST, so the generated fields below win: sdk-test-control.json's
            // test.client.options adds to the live client, it does not redirect it.
            (0, utility_1.liveClientOptions)(),
            {},
            // 'extra || {}', not a bare 'extra': struct.merge returns UNDEFINED when the
            // last entry is undefined, and basicSetup is normally called with no
            // argument at all - so a bare 'extra' silently discarded the apikey
            // and server values above and handed the SDK undefined. Harmless
            // while there was nothing in that object; not harmless now.
            extra || {},
            { system: { fetch: transport.fetch } }
        ]));
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
    };
    return setup;
}
//# sourceMappingURL=SetBoosterEntity.test.js.map