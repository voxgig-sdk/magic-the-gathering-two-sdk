-- MagicTheGatheringTwo SDK configuration

-- Build a fresh, fully materialised config table. Every call rebuilds the
-- whole structure, so prefer require("config_shared") unless you need a
-- private copy you intend to mutate.
local function make_config()
  return {
    main = {
      name = "MagicTheGatheringTwo",
      slug = "magic-the-gathering-two",
      version = "0.0.1",
      target = "lua",
    },
    feature = {
      ["ratelimit"] = {
        ["options"] = {
          ["active"] = false,
          ["burst"] = 5,
          ["rate"] = 5,
        },
        ["optspec"] = {
          ["now"] = "`$FUNCTION`",
          ["sleep"] = "`$FUNCTION`",
        },
        ["strict"] = false,
        ["transport"] = "wrap",
      },
      ["retry"] = {
        ["options"] = {
          ["active"] = false,
          ["factor"] = 2,
          ["maxDelay"] = 2000,
          ["minDelay"] = 50,
          ["retries"] = 2,
          ["statuses"] = {
            408,
            425,
            429,
            500,
            502,
            503,
            504,
          },
        },
        ["optspec"] = {
          ["jitter"] = "`$BOOLEAN`",
          ["sleep"] = "`$FUNCTION`",
        },
        ["strict"] = false,
        ["transport"] = "wrap",
      },
      ["test"] = {
        ["options"] = {
          ["active"] = false,
        },
        ["optspec"] = {
          ["entity"] = "`$MAP`",
          ["net"] = "`$MAP`",
        },
        ["strict"] = false,
        ["transport"] = "base",
      },
      ["timeout"] = {
        ["options"] = {
          ["active"] = false,
          ["ms"] = 30000,
        },
        ["optspec"] = {
          ["clearTimer"] = "`$FUNCTION`",
          ["setTimer"] = "`$FUNCTION`",
        },
        ["strict"] = false,
        ["transport"] = "wrap",
      },
    },
    options = {
      base = "https://api.magicthegathering.io/v1",
      headers = {
        ["content-type"] = "application/json",
      },
      entity = {
        ["card"] = {},
        ["format"] = {},
        ["set"] = {},
        ["set_booster"] = {},
        ["subtype"] = {},
        ["supertype"] = {},
        ["type"] = {},
      },
    },
    entity = {
      ["card"] = {
        ["fields"] = {
          {
            ["name"] = "artist",
            ["title"] = "Artist",
            ["type"] = "`$STRING`",
            ["short"] = "The artist of the card",
          },
          {
            ["name"] = "border",
            ["title"] = "Border",
            ["type"] = "`$STRING`",
            ["short"] = "The border color if different from the set default",
          },
          {
            ["name"] = "cmc",
            ["title"] = "Cmc",
            ["type"] = "`$NUMBER`",
            ["short"] = "Converted mana cost",
          },
          {
            ["name"] = "colorIdentity",
            ["title"] = "Color Identity",
            ["type"] = "`$ARRAY`",
            ["short"] = "The card's color identity by color code",
          },
          {
            ["name"] = "colors",
            ["title"] = "Colors",
            ["type"] = "`$ARRAY`",
            ["short"] = "The card colors",
          },
          {
            ["name"] = "flavor",
            ["title"] = "Flavor",
            ["type"] = "`$STRING`",
            ["short"] = "The flavor text of the card",
          },
          {
            ["name"] = "foreignNames",
            ["title"] = "Foreign Names",
            ["type"] = "`$ARRAY`",
            ["short"] = "Foreign language names for the card",
          },
          {
            ["name"] = "hand",
            ["title"] = "Hand",
            ["type"] = "`$INTEGER`",
            ["short"] = "Maximum hand size modifier (Vanguard cards only)",
          },
          {
            ["name"] = "id",
            ["title"] = "Id",
            ["type"] = "`$STRING`",
            ["short"] = "A unique id for this card (SHA1 hash)",
          },
          {
            ["name"] = "imageUrl",
            ["title"] = "Image Url",
            ["type"] = "`$STRING`",
            ["short"] = "The image URL for the card",
          },
          {
            ["name"] = "layout",
            ["title"] = "Layout",
            ["type"] = "`$STRING`",
            ["short"] = "The card layout",
          },
          {
            ["name"] = "legalities",
            ["title"] = "Legalities",
            ["type"] = "`$ARRAY`",
            ["short"] = "Which formats this card is legal, restricted or banned in",
          },
          {
            ["name"] = "life",
            ["title"] = "Life",
            ["type"] = "`$INTEGER`",
            ["short"] = "Starting life total modifier (Vanguard cards only)",
          },
          {
            ["name"] = "loyalty",
            ["title"] = "Loyalty",
            ["type"] = "`$STRING`",
            ["short"] = "The loyalty of the card (planeswalkers only)",
          },
          {
            ["name"] = "manaCost",
            ["title"] = "Mana Cost",
            ["type"] = "`$STRING`",
            ["short"] = "The mana cost of the card",
          },
          {
            ["name"] = "multiverseid",
            ["title"] = "Multiverseid",
            ["type"] = "`$INTEGER`",
            ["short"] = "The multiverseid of the card on Wizard's Gatherer",
          },
          {
            ["name"] = "name",
            ["title"] = "Name",
            ["type"] = "`$STRING`",
            ["short"] = "The card name",
          },
          {
            ["name"] = "names",
            ["title"] = "Names",
            ["type"] = "`$ARRAY`",
            ["short"] = "Only used for split, flip and dual cards.",
          },
          {
            ["name"] = "number",
            ["title"] = "Number",
            ["type"] = "`$STRING`",
            ["short"] = "The card number",
          },
          {
            ["name"] = "originalText",
            ["title"] = "Original Text",
            ["type"] = "`$STRING`",
            ["short"] = "The original text on the card at the time it was printed",
          },
          {
            ["name"] = "originalType",
            ["title"] = "Original Type",
            ["type"] = "`$STRING`",
            ["short"] = "The original type on the card at the time it was printed",
          },
          {
            ["name"] = "power",
            ["title"] = "Power",
            ["type"] = "`$STRING`",
            ["short"] = "The power of the card (creatures only)",
          },
          {
            ["name"] = "printings",
            ["title"] = "Printings",
            ["type"] = "`$ARRAY`",
            ["short"] = "The sets that this card was printed in",
          },
          {
            ["name"] = "rarity",
            ["title"] = "Rarity",
            ["type"] = "`$STRING`",
            ["short"] = "The rarity of the card",
          },
          {
            ["name"] = "releaseDate",
            ["title"] = "Release Date",
            ["type"] = "`$STRING`",
            ["short"] = "The release date for promo cards",
            ["format"] = "date",
          },
          {
            ["name"] = "reserved",
            ["title"] = "Reserved",
            ["type"] = "`$BOOLEAN`",
            ["short"] = "True if this card is reserved by Wizards Official Reprint Policy",
          },
          {
            ["name"] = "rulings",
            ["title"] = "Rulings",
            ["type"] = "`$ARRAY`",
            ["short"] = "The rulings for the card",
          },
          {
            ["name"] = "set",
            ["title"] = "Set",
            ["type"] = "`$STRING`",
            ["short"] = "The set code the card belongs to",
          },
          {
            ["name"] = "setName",
            ["title"] = "Set Name",
            ["type"] = "`$STRING`",
            ["short"] = "The set name the card belongs to",
          },
          {
            ["name"] = "source",
            ["title"] = "Source",
            ["type"] = "`$STRING`",
            ["short"] = "For promo cards, where the card was originally obtained",
          },
          {
            ["name"] = "starter",
            ["title"] = "Starter",
            ["type"] = "`$BOOLEAN`",
            ["short"] = "True if this card was only released as part of a core box set",
          },
          {
            ["name"] = "subtypes",
            ["title"] = "Subtypes",
            ["type"] = "`$ARRAY`",
            ["short"] = "The subtypes of the card",
          },
          {
            ["name"] = "supertypes",
            ["title"] = "Supertypes",
            ["type"] = "`$ARRAY`",
            ["short"] = "The supertypes of the card",
          },
          {
            ["name"] = "text",
            ["title"] = "Text",
            ["type"] = "`$STRING`",
            ["short"] = "The oracle text of the card",
          },
          {
            ["name"] = "timeshifted",
            ["title"] = "Timeshifted",
            ["type"] = "`$BOOLEAN`",
            ["short"] = "True if this card was timeshifted in the set",
          },
          {
            ["name"] = "toughness",
            ["title"] = "Toughness",
            ["type"] = "`$STRING`",
            ["short"] = "The toughness of the card (creatures only)",
          },
          {
            ["name"] = "type",
            ["title"] = "Type",
            ["type"] = "`$STRING`",
            ["short"] = "The card type",
          },
          {
            ["name"] = "types",
            ["title"] = "Types",
            ["type"] = "`$ARRAY`",
            ["short"] = "The types of the card",
          },
          {
            ["name"] = "variations",
            ["title"] = "Variations",
            ["type"] = "`$ARRAY`",
            ["short"] = "Multiverseids of alternate art variations",
          },
          {
            ["name"] = "watermark",
            ["title"] = "Watermark",
            ["type"] = "`$STRING`",
            ["short"] = "The watermark on the card",
          },
        },
        ["id"] = {
          ["field"] = "id",
          ["name"] = "id",
        },
        ["name"] = "card",
        ["op"] = {
          ["list"] = {
            ["input"] = "data",
            ["name"] = "list",
            ["points"] = {
              {
                ["kind"] = "http",
                ["method"] = "GET",
                ["orig"] = "/cards",
                ["segments"] = {
                  {
                    ["lit"] = "cards",
                  },
                },
                ["parts"] = {
                  "cards",
                },
                ["rename"] = {},
                ["transform"] = {
                  ["req"] = "`reqdata`",
                  ["res"] = "`body.cards`",
                },
                ["args"] = {
                  ["query"] = {
                    {
                      ["name"] = "artist",
                      ["orig"] = "artist",
                      ["type"] = "`$STRING`",
                      ["kind"] = "query",
                    },
                    {
                      ["name"] = "cmc",
                      ["orig"] = "cmc",
                      ["type"] = "`$NUMBER`",
                      ["kind"] = "query",
                    },
                    {
                      ["name"] = "color",
                      ["orig"] = "color",
                      ["type"] = "`$STRING`",
                      ["kind"] = "query",
                    },
                    {
                      ["name"] = "color_identity",
                      ["orig"] = "color_identity",
                      ["type"] = "`$STRING`",
                      ["kind"] = "query",
                    },
                    {
                      ["name"] = "contain",
                      ["orig"] = "contain",
                      ["type"] = "`$STRING`",
                      ["kind"] = "query",
                    },
                    {
                      ["name"] = "flavor",
                      ["orig"] = "flavor",
                      ["type"] = "`$STRING`",
                      ["kind"] = "query",
                    },
                    {
                      ["name"] = "game_format",
                      ["orig"] = "game_format",
                      ["type"] = "`$STRING`",
                      ["kind"] = "query",
                    },
                    {
                      ["name"] = "id",
                      ["orig"] = "id",
                      ["type"] = "`$STRING`",
                      ["kind"] = "query",
                    },
                    {
                      ["name"] = "language",
                      ["orig"] = "language",
                      ["type"] = "`$STRING`",
                      ["kind"] = "query",
                    },
                    {
                      ["name"] = "layout",
                      ["orig"] = "layout",
                      ["type"] = "`$STRING`",
                      ["kind"] = "query",
                    },
                    {
                      ["name"] = "legality",
                      ["orig"] = "legality",
                      ["type"] = "`$STRING`",
                      ["kind"] = "query",
                    },
                    {
                      ["name"] = "loyalty",
                      ["orig"] = "loyalty",
                      ["type"] = "`$STRING`",
                      ["kind"] = "query",
                    },
                    {
                      ["name"] = "multiverseid",
                      ["orig"] = "multiverseid",
                      ["type"] = "`$INTEGER`",
                      ["kind"] = "query",
                    },
                    {
                      ["name"] = "name",
                      ["orig"] = "name",
                      ["type"] = "`$STRING`",
                      ["kind"] = "query",
                    },
                    {
                      ["name"] = "number",
                      ["orig"] = "number",
                      ["type"] = "`$STRING`",
                      ["kind"] = "query",
                    },
                    {
                      ["name"] = "order_by",
                      ["orig"] = "order_by",
                      ["type"] = "`$STRING`",
                      ["kind"] = "query",
                    },
                    {
                      ["name"] = "page",
                      ["orig"] = "page",
                      ["type"] = "`$INTEGER`",
                      ["kind"] = "query",
                      ["example"] = 1,
                    },
                    {
                      ["name"] = "page_size",
                      ["orig"] = "page_size",
                      ["type"] = "`$INTEGER`",
                      ["kind"] = "query",
                      ["example"] = 100,
                    },
                    {
                      ["name"] = "power",
                      ["orig"] = "power",
                      ["type"] = "`$STRING`",
                      ["kind"] = "query",
                    },
                    {
                      ["name"] = "random",
                      ["orig"] = "random",
                      ["type"] = "`$BOOLEAN`",
                      ["kind"] = "query",
                    },
                    {
                      ["name"] = "rarity",
                      ["orig"] = "rarity",
                      ["type"] = "`$STRING`",
                      ["kind"] = "query",
                    },
                    {
                      ["name"] = "set",
                      ["orig"] = "set",
                      ["type"] = "`$STRING`",
                      ["kind"] = "query",
                    },
                    {
                      ["name"] = "set_name",
                      ["orig"] = "set_name",
                      ["type"] = "`$STRING`",
                      ["kind"] = "query",
                    },
                    {
                      ["name"] = "subtype",
                      ["orig"] = "subtype",
                      ["type"] = "`$STRING`",
                      ["kind"] = "query",
                    },
                    {
                      ["name"] = "supertype",
                      ["orig"] = "supertype",
                      ["type"] = "`$STRING`",
                      ["kind"] = "query",
                    },
                    {
                      ["name"] = "text",
                      ["orig"] = "text",
                      ["type"] = "`$STRING`",
                      ["kind"] = "query",
                    },
                    {
                      ["name"] = "toughness",
                      ["orig"] = "toughness",
                      ["type"] = "`$STRING`",
                      ["kind"] = "query",
                    },
                    {
                      ["name"] = "type",
                      ["orig"] = "type",
                      ["type"] = "`$STRING`",
                      ["kind"] = "query",
                    },
                    {
                      ["name"] = "type",
                      ["orig"] = "type",
                      ["type"] = "`$STRING`",
                      ["kind"] = "query",
                    },
                  },
                },
                ["select"] = {
                  ["exist"] = {
                    "artist",
                    "cmc",
                    "color",
                    "color_identity",
                    "contain",
                    "flavor",
                    "game_format",
                    "id",
                    "language",
                    "layout",
                    "legality",
                    "loyalty",
                    "multiverseid",
                    "name",
                    "number",
                    "order_by",
                    "page",
                    "page_size",
                    "power",
                    "random",
                    "rarity",
                    "set",
                    "set_name",
                    "subtype",
                    "supertype",
                    "text",
                    "toughness",
                    "type",
                  },
                },
              },
            },
          },
          ["load"] = {
            ["input"] = "data",
            ["name"] = "load",
            ["points"] = {
              {
                ["kind"] = "http",
                ["method"] = "GET",
                ["orig"] = "/cards/{id}",
                ["segments"] = {
                  {
                    ["lit"] = "cards",
                  },
                  {
                    ["var"] = "id",
                  },
                },
                ["parts"] = {
                  "cards",
                  "{id}",
                },
                ["rename"] = {},
                ["transform"] = {
                  ["req"] = "`reqdata`",
                  ["res"] = "`body.card`",
                },
                ["args"] = {
                  ["params"] = {
                    {
                      ["name"] = "id",
                      ["orig"] = "id",
                      ["type"] = "`$STRING`",
                      ["kind"] = "param",
                      ["reqd"] = true,
                    },
                  },
                },
                ["select"] = {
                  ["exist"] = {
                    "id",
                  },
                },
              },
            },
          },
        },
        ["relations"] = {
          ["ancestors"] = {},
        },
      },
      ["format"] = {
        ["fields"] = {
          {
            ["name"] = "formats",
            ["title"] = "Formats",
            ["type"] = "`$ARRAY`",
          },
        },
        ["name"] = "format",
        ["op"] = {
          ["list"] = {
            ["input"] = "data",
            ["name"] = "list",
            ["points"] = {
              {
                ["kind"] = "http",
                ["method"] = "GET",
                ["orig"] = "/formats",
                ["segments"] = {
                  {
                    ["lit"] = "formats",
                  },
                },
                ["parts"] = {
                  "formats",
                },
                ["rename"] = {},
                ["transform"] = {
                  ["req"] = "`reqdata`",
                  ["res"] = "`body.formats`",
                },
                ["args"] = {},
                ["select"] = {},
              },
            },
          },
        },
        ["relations"] = {
          ["ancestors"] = {},
        },
      },
      ["set"] = {
        ["fields"] = {
          {
            ["name"] = "block",
            ["title"] = "Block",
            ["type"] = "`$STRING`",
            ["short"] = "The block the set belongs to",
          },
          {
            ["name"] = "booster",
            ["title"] = "Booster",
            ["type"] = "`$ARRAY`",
            ["short"] = "Booster pack configuration",
          },
          {
            ["name"] = "border",
            ["title"] = "Border",
            ["type"] = "`$STRING`",
            ["short"] = "The border color of the set",
          },
          {
            ["name"] = "code",
            ["title"] = "Code",
            ["type"] = "`$STRING`",
            ["short"] = "The set code",
          },
          {
            ["name"] = "gathererCode",
            ["title"] = "Gatherer Code",
            ["type"] = "`$STRING`",
            ["short"] = "The Gatherer code for the set",
          },
          {
            ["name"] = "id",
            ["title"] = "Id",
            ["type"] = "`$STRING`",
          },
          {
            ["name"] = "magicCardsInfoCode",
            ["title"] = "Magic Cards Info Code",
            ["type"] = "`$STRING`",
            ["short"] = "The Magic Cards Info code for the set",
          },
          {
            ["name"] = "mkm_id",
            ["title"] = "Mkm Id",
            ["type"] = "`$INTEGER`",
            ["short"] = "The Magic Card Market set ID",
          },
          {
            ["name"] = "mkm_name",
            ["title"] = "Mkm Name",
            ["type"] = "`$STRING`",
            ["short"] = "The Magic Card Market set name",
          },
          {
            ["name"] = "name",
            ["title"] = "Name",
            ["type"] = "`$STRING`",
            ["short"] = "The name of the set",
          },
          {
            ["name"] = "onlineOnly",
            ["title"] = "Online Only",
            ["type"] = "`$BOOLEAN`",
            ["short"] = "True if the set is online only",
          },
          {
            ["name"] = "releaseDate",
            ["title"] = "Release Date",
            ["type"] = "`$STRING`",
            ["short"] = "The release date of the set",
            ["format"] = "date",
          },
          {
            ["name"] = "type",
            ["title"] = "Type",
            ["type"] = "`$STRING`",
            ["short"] = "The type of the set",
          },
        },
        ["id"] = {
          ["field"] = "id",
          ["name"] = "id",
        },
        ["name"] = "set",
        ["op"] = {
          ["list"] = {
            ["input"] = "data",
            ["name"] = "list",
            ["points"] = {
              {
                ["kind"] = "http",
                ["method"] = "GET",
                ["orig"] = "/sets",
                ["segments"] = {
                  {
                    ["lit"] = "sets",
                  },
                },
                ["parts"] = {
                  "sets",
                },
                ["rename"] = {},
                ["transform"] = {
                  ["req"] = "`reqdata`",
                  ["res"] = "`body.sets`",
                },
                ["args"] = {
                  ["query"] = {
                    {
                      ["name"] = "block",
                      ["orig"] = "block",
                      ["type"] = "`$STRING`",
                      ["kind"] = "query",
                    },
                    {
                      ["name"] = "name",
                      ["orig"] = "name",
                      ["type"] = "`$STRING`",
                      ["kind"] = "query",
                    },
                  },
                },
                ["select"] = {
                  ["exist"] = {
                    "block",
                    "name",
                  },
                },
              },
            },
          },
          ["load"] = {
            ["input"] = "data",
            ["name"] = "load",
            ["points"] = {
              {
                ["kind"] = "http",
                ["method"] = "GET",
                ["orig"] = "/sets/{id}",
                ["segments"] = {
                  {
                    ["lit"] = "sets",
                  },
                  {
                    ["var"] = "id",
                  },
                },
                ["parts"] = {
                  "sets",
                  "{id}",
                },
                ["rename"] = {},
                ["transform"] = {
                  ["req"] = "`reqdata`",
                  ["res"] = "`body.set`",
                },
                ["args"] = {
                  ["params"] = {
                    {
                      ["name"] = "id",
                      ["orig"] = "id",
                      ["type"] = "`$STRING`",
                      ["kind"] = "param",
                      ["reqd"] = true,
                    },
                  },
                },
                ["select"] = {
                  ["exist"] = {
                    "id",
                  },
                },
              },
            },
          },
        },
        ["relations"] = {
          ["ancestors"] = {},
        },
      },
      ["set_booster"] = {
        ["fields"] = {
          {
            ["name"] = "artist",
            ["title"] = "Artist",
            ["type"] = "`$STRING`",
            ["short"] = "The artist of the card",
          },
          {
            ["name"] = "border",
            ["title"] = "Border",
            ["type"] = "`$STRING`",
            ["short"] = "The border color if different from the set default",
          },
          {
            ["name"] = "cmc",
            ["title"] = "Cmc",
            ["type"] = "`$NUMBER`",
            ["short"] = "Converted mana cost",
          },
          {
            ["name"] = "colorIdentity",
            ["title"] = "Color Identity",
            ["type"] = "`$ARRAY`",
            ["short"] = "The card's color identity by color code",
          },
          {
            ["name"] = "colors",
            ["title"] = "Colors",
            ["type"] = "`$ARRAY`",
            ["short"] = "The card colors",
          },
          {
            ["name"] = "flavor",
            ["title"] = "Flavor",
            ["type"] = "`$STRING`",
            ["short"] = "The flavor text of the card",
          },
          {
            ["name"] = "foreignNames",
            ["title"] = "Foreign Names",
            ["type"] = "`$ARRAY`",
            ["short"] = "Foreign language names for the card",
          },
          {
            ["name"] = "hand",
            ["title"] = "Hand",
            ["type"] = "`$INTEGER`",
            ["short"] = "Maximum hand size modifier (Vanguard cards only)",
          },
          {
            ["name"] = "id",
            ["title"] = "Id",
            ["type"] = "`$STRING`",
            ["short"] = "A unique id for this card (SHA1 hash)",
          },
          {
            ["name"] = "imageUrl",
            ["title"] = "Image Url",
            ["type"] = "`$STRING`",
            ["short"] = "The image URL for the card",
          },
          {
            ["name"] = "layout",
            ["title"] = "Layout",
            ["type"] = "`$STRING`",
            ["short"] = "The card layout",
          },
          {
            ["name"] = "legalities",
            ["title"] = "Legalities",
            ["type"] = "`$ARRAY`",
            ["short"] = "Which formats this card is legal, restricted or banned in",
          },
          {
            ["name"] = "life",
            ["title"] = "Life",
            ["type"] = "`$INTEGER`",
            ["short"] = "Starting life total modifier (Vanguard cards only)",
          },
          {
            ["name"] = "loyalty",
            ["title"] = "Loyalty",
            ["type"] = "`$STRING`",
            ["short"] = "The loyalty of the card (planeswalkers only)",
          },
          {
            ["name"] = "manaCost",
            ["title"] = "Mana Cost",
            ["type"] = "`$STRING`",
            ["short"] = "The mana cost of the card",
          },
          {
            ["name"] = "multiverseid",
            ["title"] = "Multiverseid",
            ["type"] = "`$INTEGER`",
            ["short"] = "The multiverseid of the card on Wizard's Gatherer",
          },
          {
            ["name"] = "name",
            ["title"] = "Name",
            ["type"] = "`$STRING`",
            ["short"] = "The card name",
          },
          {
            ["name"] = "names",
            ["title"] = "Names",
            ["type"] = "`$ARRAY`",
            ["short"] = "Only used for split, flip and dual cards.",
          },
          {
            ["name"] = "number",
            ["title"] = "Number",
            ["type"] = "`$STRING`",
            ["short"] = "The card number",
          },
          {
            ["name"] = "originalText",
            ["title"] = "Original Text",
            ["type"] = "`$STRING`",
            ["short"] = "The original text on the card at the time it was printed",
          },
          {
            ["name"] = "originalType",
            ["title"] = "Original Type",
            ["type"] = "`$STRING`",
            ["short"] = "The original type on the card at the time it was printed",
          },
          {
            ["name"] = "power",
            ["title"] = "Power",
            ["type"] = "`$STRING`",
            ["short"] = "The power of the card (creatures only)",
          },
          {
            ["name"] = "printings",
            ["title"] = "Printings",
            ["type"] = "`$ARRAY`",
            ["short"] = "The sets that this card was printed in",
          },
          {
            ["name"] = "rarity",
            ["title"] = "Rarity",
            ["type"] = "`$STRING`",
            ["short"] = "The rarity of the card",
          },
          {
            ["name"] = "releaseDate",
            ["title"] = "Release Date",
            ["type"] = "`$STRING`",
            ["short"] = "The release date for promo cards",
            ["format"] = "date",
          },
          {
            ["name"] = "reserved",
            ["title"] = "Reserved",
            ["type"] = "`$BOOLEAN`",
            ["short"] = "True if this card is reserved by Wizards Official Reprint Policy",
          },
          {
            ["name"] = "rulings",
            ["title"] = "Rulings",
            ["type"] = "`$ARRAY`",
            ["short"] = "The rulings for the card",
          },
          {
            ["name"] = "set",
            ["title"] = "Set",
            ["type"] = "`$STRING`",
            ["short"] = "The set code the card belongs to",
          },
          {
            ["name"] = "setName",
            ["title"] = "Set Name",
            ["type"] = "`$STRING`",
            ["short"] = "The set name the card belongs to",
          },
          {
            ["name"] = "source",
            ["title"] = "Source",
            ["type"] = "`$STRING`",
            ["short"] = "For promo cards, where the card was originally obtained",
          },
          {
            ["name"] = "starter",
            ["title"] = "Starter",
            ["type"] = "`$BOOLEAN`",
            ["short"] = "True if this card was only released as part of a core box set",
          },
          {
            ["name"] = "subtypes",
            ["title"] = "Subtypes",
            ["type"] = "`$ARRAY`",
            ["short"] = "The subtypes of the card",
          },
          {
            ["name"] = "supertypes",
            ["title"] = "Supertypes",
            ["type"] = "`$ARRAY`",
            ["short"] = "The supertypes of the card",
          },
          {
            ["name"] = "text",
            ["title"] = "Text",
            ["type"] = "`$STRING`",
            ["short"] = "The oracle text of the card",
          },
          {
            ["name"] = "timeshifted",
            ["title"] = "Timeshifted",
            ["type"] = "`$BOOLEAN`",
            ["short"] = "True if this card was timeshifted in the set",
          },
          {
            ["name"] = "toughness",
            ["title"] = "Toughness",
            ["type"] = "`$STRING`",
            ["short"] = "The toughness of the card (creatures only)",
          },
          {
            ["name"] = "type",
            ["title"] = "Type",
            ["type"] = "`$STRING`",
            ["short"] = "The card type",
          },
          {
            ["name"] = "types",
            ["title"] = "Types",
            ["type"] = "`$ARRAY`",
            ["short"] = "The types of the card",
          },
          {
            ["name"] = "variations",
            ["title"] = "Variations",
            ["type"] = "`$ARRAY`",
            ["short"] = "Multiverseids of alternate art variations",
          },
          {
            ["name"] = "watermark",
            ["title"] = "Watermark",
            ["type"] = "`$STRING`",
            ["short"] = "The watermark on the card",
          },
        },
        ["id"] = {
          ["field"] = "id",
          ["name"] = "id",
        },
        ["name"] = "set_booster",
        ["op"] = {
          ["list"] = {
            ["input"] = "data",
            ["name"] = "list",
            ["points"] = {
              {
                ["kind"] = "http",
                ["method"] = "GET",
                ["orig"] = "/sets/{id}/booster",
                ["segments"] = {
                  {
                    ["lit"] = "sets",
                  },
                  {
                    ["var"] = "id",
                  },
                  {
                    ["lit"] = "booster",
                  },
                },
                ["parts"] = {
                  "sets",
                  "{id}",
                  "booster",
                },
                ["rename"] = {},
                ["transform"] = {
                  ["req"] = "`reqdata`",
                  ["res"] = "`body.cards`",
                },
                ["args"] = {
                  ["params"] = {
                    {
                      ["name"] = "id",
                      ["orig"] = "id",
                      ["type"] = "`$STRING`",
                      ["kind"] = "param",
                      ["reqd"] = true,
                    },
                  },
                },
                ["select"] = {
                  ["exist"] = {
                    "id",
                  },
                },
              },
            },
          },
        },
        ["relations"] = {
          ["ancestors"] = {},
        },
      },
      ["subtype"] = {
        ["fields"] = {
          {
            ["name"] = "subtypes",
            ["title"] = "Subtypes",
            ["type"] = "`$ARRAY`",
          },
        },
        ["name"] = "subtype",
        ["op"] = {
          ["list"] = {
            ["input"] = "data",
            ["name"] = "list",
            ["points"] = {
              {
                ["kind"] = "http",
                ["method"] = "GET",
                ["orig"] = "/subtypes",
                ["segments"] = {
                  {
                    ["lit"] = "subtypes",
                  },
                },
                ["parts"] = {
                  "subtypes",
                },
                ["rename"] = {},
                ["transform"] = {
                  ["req"] = "`reqdata`",
                  ["res"] = "`body.subtypes`",
                },
                ["args"] = {},
                ["select"] = {},
              },
            },
          },
        },
        ["relations"] = {
          ["ancestors"] = {},
        },
      },
      ["supertype"] = {
        ["fields"] = {
          {
            ["name"] = "supertypes",
            ["title"] = "Supertypes",
            ["type"] = "`$ARRAY`",
          },
        },
        ["name"] = "supertype",
        ["op"] = {
          ["list"] = {
            ["input"] = "data",
            ["name"] = "list",
            ["points"] = {
              {
                ["kind"] = "http",
                ["method"] = "GET",
                ["orig"] = "/supertypes",
                ["segments"] = {
                  {
                    ["lit"] = "supertypes",
                  },
                },
                ["parts"] = {
                  "supertypes",
                },
                ["rename"] = {},
                ["transform"] = {
                  ["req"] = "`reqdata`",
                  ["res"] = "`body.supertypes`",
                },
                ["args"] = {},
                ["select"] = {},
              },
            },
          },
        },
        ["relations"] = {
          ["ancestors"] = {},
        },
      },
      ["type"] = {
        ["fields"] = {
          {
            ["name"] = "types",
            ["title"] = "Types",
            ["type"] = "`$ARRAY`",
          },
        },
        ["name"] = "type",
        ["op"] = {
          ["list"] = {
            ["input"] = "data",
            ["name"] = "list",
            ["points"] = {
              {
                ["kind"] = "http",
                ["method"] = "GET",
                ["orig"] = "/types",
                ["segments"] = {
                  {
                    ["lit"] = "types",
                  },
                },
                ["parts"] = {
                  "types",
                },
                ["rename"] = {},
                ["transform"] = {
                  ["req"] = "`reqdata`",
                  ["res"] = "`body.types`",
                },
                ["args"] = {},
                ["select"] = {},
              },
            },
          },
        },
        ["relations"] = {
          ["ancestors"] = {},
        },
      },
    },
  }
end


local function make_feature(name)
  local features = require("features")
  local factory = features[name]
  if factory ~= nil then
    return factory()
  end
  return features.base()
end


-- Attach make_feature to the SDK class
local function setup_sdk(SDK)
  SDK._make_feature = make_feature
end


return make_config
