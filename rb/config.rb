# MagicTheGatheringTwo SDK configuration

module MagicTheGatheringTwoConfig
  # Return the process-wide config, built once on first use. The SDK reads
  # the config on every request and never writes to it, so one instance is
  # shared by every client rather than rebuilt per client.
  #
  # The returned hash is shared: treat it as read-only. Callers that need to
  # mutate should use make_config, which always returns a fresh copy.
  def self.shared_config
    @shared_config ||= make_config
  end


  # Build a fresh, fully materialised config hash. Every call rebuilds the
  # whole structure, so prefer shared_config unless you need a private copy
  # you intend to mutate.
  def self.make_config
    {
      "main" => {
        "name" => "MagicTheGatheringTwo",
        "slug" => "magic-the-gathering-two",
        "version" => "0.0.1",
        "target" => "rb",
      },
      "feature" => {
        "test" => {
          "options" => {
            "active" => false,
          },
        },
      },
      "options" => {
        "base" => "https://api.magicthegathering.io/v1",
        "headers" => {
          "content-type" => "application/json",
        },
        "entity" => {
          "card" => {},
          "format" => {},
          "set" => {},
          "set_booster" => {},
          "subtype" => {},
          "supertype" => {},
          "type" => {},
        },
      },
      "entity" => {
        "card" => {
          "fields" => [
            {
              "name" => "artist",
              "short" => "The artist of the card",
              "type" => "`$STRING`",
            },
            {
              "name" => "border",
              "short" => "The border color if different from the set default",
              "type" => "`$STRING`",
            },
            {
              "name" => "cmc",
              "short" => "Converted mana cost",
              "type" => "`$NUMBER`",
            },
            {
              "name" => "colorIdentity",
              "short" => "The card's color identity by color code",
              "type" => "`$ARRAY`",
            },
            {
              "name" => "colors",
              "short" => "The card colors",
              "type" => "`$ARRAY`",
            },
            {
              "name" => "flavor",
              "short" => "The flavor text of the card",
              "type" => "`$STRING`",
            },
            {
              "name" => "foreignNames",
              "short" => "Foreign language names for the card",
              "type" => "`$ARRAY`",
            },
            {
              "name" => "hand",
              "short" => "Maximum hand size modifier (Vanguard cards only)",
              "type" => "`$INTEGER`",
            },
            {
              "name" => "id",
              "short" => "A unique id for this card (SHA1 hash)",
              "type" => "`$STRING`",
            },
            {
              "name" => "imageUrl",
              "short" => "The image URL for the card",
              "type" => "`$STRING`",
            },
            {
              "name" => "layout",
              "short" => "The card layout",
              "type" => "`$STRING`",
            },
            {
              "name" => "legalities",
              "short" => "Which formats this card is legal, restricted or banned in",
              "type" => "`$ARRAY`",
            },
            {
              "name" => "life",
              "short" => "Starting life total modifier (Vanguard cards only)",
              "type" => "`$INTEGER`",
            },
            {
              "name" => "loyalty",
              "short" => "The loyalty of the card (planeswalkers only)",
              "type" => "`$STRING`",
            },
            {
              "name" => "manaCost",
              "short" => "The mana cost of the card",
              "type" => "`$STRING`",
            },
            {
              "name" => "multiverseid",
              "short" => "The multiverseid of the card on Wizard's Gatherer",
              "type" => "`$INTEGER`",
            },
            {
              "name" => "name",
              "short" => "The card name",
              "type" => "`$STRING`",
            },
            {
              "name" => "names",
              "short" => "Only used for split, flip and dual cards.",
              "type" => "`$ARRAY`",
            },
            {
              "name" => "number",
              "short" => "The card number",
              "type" => "`$STRING`",
            },
            {
              "name" => "originalText",
              "short" => "The original text on the card at the time it was printed",
              "type" => "`$STRING`",
            },
            {
              "name" => "originalType",
              "short" => "The original type on the card at the time it was printed",
              "type" => "`$STRING`",
            },
            {
              "name" => "power",
              "short" => "The power of the card (creatures only)",
              "type" => "`$STRING`",
            },
            {
              "name" => "printings",
              "short" => "The sets that this card was printed in",
              "type" => "`$ARRAY`",
            },
            {
              "name" => "rarity",
              "short" => "The rarity of the card",
              "type" => "`$STRING`",
            },
            {
              "name" => "releaseDate",
              "short" => "The release date for promo cards",
              "type" => "`$STRING`",
            },
            {
              "name" => "reserved",
              "short" => "True if this card is reserved by Wizards Official Reprint Policy",
              "type" => "`$BOOLEAN`",
            },
            {
              "name" => "rulings",
              "short" => "The rulings for the card",
              "type" => "`$ARRAY`",
            },
            {
              "name" => "set",
              "short" => "The set code the card belongs to",
              "type" => "`$STRING`",
            },
            {
              "name" => "setName",
              "short" => "The set name the card belongs to",
              "type" => "`$STRING`",
            },
            {
              "name" => "source",
              "short" => "For promo cards, where the card was originally obtained",
              "type" => "`$STRING`",
            },
            {
              "name" => "starter",
              "short" => "True if this card was only released as part of a core box set",
              "type" => "`$BOOLEAN`",
            },
            {
              "name" => "subtypes",
              "short" => "The subtypes of the card",
              "type" => "`$ARRAY`",
            },
            {
              "name" => "supertypes",
              "short" => "The supertypes of the card",
              "type" => "`$ARRAY`",
            },
            {
              "name" => "text",
              "short" => "The oracle text of the card",
              "type" => "`$STRING`",
            },
            {
              "name" => "timeshifted",
              "short" => "True if this card was timeshifted in the set",
              "type" => "`$BOOLEAN`",
            },
            {
              "name" => "toughness",
              "short" => "The toughness of the card (creatures only)",
              "type" => "`$STRING`",
            },
            {
              "name" => "type",
              "short" => "The card type",
              "type" => "`$STRING`",
            },
            {
              "name" => "types",
              "short" => "The types of the card",
              "type" => "`$ARRAY`",
            },
            {
              "name" => "variations",
              "short" => "Multiverseids of alternate art variations",
              "type" => "`$ARRAY`",
            },
            {
              "name" => "watermark",
              "short" => "The watermark on the card",
              "type" => "`$STRING`",
            },
          ],
          "name" => "card",
          "op" => {
            "list" => {
              "input" => "data",
              "name" => "list",
              "points" => [
                {
                  "args" => {
                    "query" => [
                      {
                        "kind" => "query",
                        "name" => "artist",
                        "orig" => "artist",
                        "type" => "`$STRING`",
                      },
                      {
                        "kind" => "query",
                        "name" => "cmc",
                        "orig" => "cmc",
                        "type" => "`$NUMBER`",
                      },
                      {
                        "kind" => "query",
                        "name" => "color",
                        "orig" => "color",
                        "type" => "`$STRING`",
                      },
                      {
                        "kind" => "query",
                        "name" => "color_identity",
                        "orig" => "color_identity",
                        "type" => "`$STRING`",
                      },
                      {
                        "kind" => "query",
                        "name" => "contain",
                        "orig" => "contain",
                        "type" => "`$STRING`",
                      },
                      {
                        "kind" => "query",
                        "name" => "flavor",
                        "orig" => "flavor",
                        "type" => "`$STRING`",
                      },
                      {
                        "kind" => "query",
                        "name" => "game_format",
                        "orig" => "game_format",
                        "type" => "`$STRING`",
                      },
                      {
                        "kind" => "query",
                        "name" => "id",
                        "orig" => "id",
                        "type" => "`$STRING`",
                      },
                      {
                        "kind" => "query",
                        "name" => "language",
                        "orig" => "language",
                        "type" => "`$STRING`",
                      },
                      {
                        "kind" => "query",
                        "name" => "layout",
                        "orig" => "layout",
                        "type" => "`$STRING`",
                      },
                      {
                        "kind" => "query",
                        "name" => "legality",
                        "orig" => "legality",
                        "type" => "`$STRING`",
                      },
                      {
                        "kind" => "query",
                        "name" => "loyalty",
                        "orig" => "loyalty",
                        "type" => "`$STRING`",
                      },
                      {
                        "kind" => "query",
                        "name" => "multiverseid",
                        "orig" => "multiverseid",
                        "type" => "`$INTEGER`",
                      },
                      {
                        "kind" => "query",
                        "name" => "name",
                        "orig" => "name",
                        "type" => "`$STRING`",
                      },
                      {
                        "kind" => "query",
                        "name" => "number",
                        "orig" => "number",
                        "type" => "`$STRING`",
                      },
                      {
                        "kind" => "query",
                        "name" => "order_by",
                        "orig" => "order_by",
                        "type" => "`$STRING`",
                      },
                      {
                        "example" => 1,
                        "kind" => "query",
                        "name" => "page",
                        "orig" => "page",
                        "type" => "`$INTEGER`",
                      },
                      {
                        "example" => 100,
                        "kind" => "query",
                        "name" => "page_size",
                        "orig" => "page_size",
                        "type" => "`$INTEGER`",
                      },
                      {
                        "kind" => "query",
                        "name" => "power",
                        "orig" => "power",
                        "type" => "`$STRING`",
                      },
                      {
                        "kind" => "query",
                        "name" => "random",
                        "orig" => "random",
                        "type" => "`$BOOLEAN`",
                      },
                      {
                        "kind" => "query",
                        "name" => "rarity",
                        "orig" => "rarity",
                        "type" => "`$STRING`",
                      },
                      {
                        "kind" => "query",
                        "name" => "set",
                        "orig" => "set",
                        "type" => "`$STRING`",
                      },
                      {
                        "kind" => "query",
                        "name" => "set_name",
                        "orig" => "set_name",
                        "type" => "`$STRING`",
                      },
                      {
                        "kind" => "query",
                        "name" => "subtype",
                        "orig" => "subtype",
                        "type" => "`$STRING`",
                      },
                      {
                        "kind" => "query",
                        "name" => "supertype",
                        "orig" => "supertype",
                        "type" => "`$STRING`",
                      },
                      {
                        "kind" => "query",
                        "name" => "text",
                        "orig" => "text",
                        "type" => "`$STRING`",
                      },
                      {
                        "kind" => "query",
                        "name" => "toughness",
                        "orig" => "toughness",
                        "type" => "`$STRING`",
                      },
                      {
                        "kind" => "query",
                        "name" => "type",
                        "orig" => "type",
                        "type" => "`$STRING`",
                      },
                      {
                        "kind" => "query",
                        "name" => "type",
                        "orig" => "type",
                        "type" => "`$STRING`",
                      },
                    ],
                  },
                  "kind" => "http",
                  "method" => "GET",
                  "orig" => "/cards",
                  "parts" => [
                    "cards",
                  ],
                  "select" => {
                    "exist" => [
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
                    ],
                  },
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body.cards`",
                  },
                },
              ],
            },
            "load" => {
              "input" => "data",
              "name" => "load",
              "points" => [
                {
                  "args" => {
                    "params" => [
                      {
                        "kind" => "param",
                        "name" => "id",
                        "orig" => "id",
                        "reqd" => true,
                        "type" => "`$STRING`",
                      },
                    ],
                  },
                  "kind" => "http",
                  "method" => "GET",
                  "orig" => "/cards/{id}",
                  "parts" => [
                    "cards",
                    "{id}",
                  ],
                  "select" => {
                    "exist" => [
                      "id",
                    ],
                  },
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body.card`",
                  },
                },
              ],
            },
          },
          "relations" => {
            "ancestors" => [],
          },
        },
        "format" => {
          "fields" => [
            {
              "name" => "formats",
              "type" => "`$ARRAY`",
            },
          ],
          "name" => "format",
          "op" => {
            "list" => {
              "input" => "data",
              "name" => "list",
              "points" => [
                {
                  "args" => {},
                  "kind" => "http",
                  "method" => "GET",
                  "orig" => "/formats",
                  "parts" => [
                    "formats",
                  ],
                  "select" => {},
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body.formats`",
                  },
                },
              ],
            },
          },
          "relations" => {
            "ancestors" => [],
          },
        },
        "set" => {
          "fields" => [
            {
              "name" => "block",
              "short" => "The block the set belongs to",
              "type" => "`$STRING`",
            },
            {
              "name" => "booster",
              "short" => "Booster pack configuration",
              "type" => "`$ARRAY`",
            },
            {
              "name" => "border",
              "short" => "The border color of the set",
              "type" => "`$STRING`",
            },
            {
              "name" => "code",
              "short" => "The set code",
              "type" => "`$STRING`",
            },
            {
              "name" => "gathererCode",
              "short" => "The Gatherer code for the set",
              "type" => "`$STRING`",
            },
            {
              "name" => "magicCardsInfoCode",
              "short" => "The Magic Cards Info code for the set",
              "type" => "`$STRING`",
            },
            {
              "name" => "mkm_id",
              "short" => "The Magic Card Market set ID",
              "type" => "`$INTEGER`",
            },
            {
              "name" => "mkm_name",
              "short" => "The Magic Card Market set name",
              "type" => "`$STRING`",
            },
            {
              "name" => "name",
              "short" => "The name of the set",
              "type" => "`$STRING`",
            },
            {
              "name" => "onlineOnly",
              "short" => "True if the set is online only",
              "type" => "`$BOOLEAN`",
            },
            {
              "name" => "releaseDate",
              "short" => "The release date of the set",
              "type" => "`$STRING`",
            },
            {
              "name" => "type",
              "short" => "The type of the set",
              "type" => "`$STRING`",
            },
          ],
          "name" => "set",
          "op" => {
            "list" => {
              "input" => "data",
              "name" => "list",
              "points" => [
                {
                  "args" => {
                    "query" => [
                      {
                        "kind" => "query",
                        "name" => "block",
                        "orig" => "block",
                        "type" => "`$STRING`",
                      },
                      {
                        "kind" => "query",
                        "name" => "name",
                        "orig" => "name",
                        "type" => "`$STRING`",
                      },
                    ],
                  },
                  "kind" => "http",
                  "method" => "GET",
                  "orig" => "/sets",
                  "parts" => [
                    "sets",
                  ],
                  "select" => {
                    "exist" => [
                      "block",
                      "name",
                    ],
                  },
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body.sets`",
                  },
                },
              ],
            },
            "load" => {
              "input" => "data",
              "name" => "load",
              "points" => [
                {
                  "args" => {
                    "params" => [
                      {
                        "kind" => "param",
                        "name" => "id",
                        "orig" => "id",
                        "reqd" => true,
                        "type" => "`$STRING`",
                      },
                    ],
                  },
                  "kind" => "http",
                  "method" => "GET",
                  "orig" => "/sets/{id}",
                  "parts" => [
                    "sets",
                    "{id}",
                  ],
                  "select" => {
                    "exist" => [
                      "id",
                    ],
                  },
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body.set`",
                  },
                },
              ],
            },
          },
          "relations" => {
            "ancestors" => [],
          },
        },
        "set_booster" => {
          "fields" => [
            {
              "name" => "artist",
              "short" => "The artist of the card",
              "type" => "`$STRING`",
            },
            {
              "name" => "border",
              "short" => "The border color if different from the set default",
              "type" => "`$STRING`",
            },
            {
              "name" => "cmc",
              "short" => "Converted mana cost",
              "type" => "`$NUMBER`",
            },
            {
              "name" => "colorIdentity",
              "short" => "The card's color identity by color code",
              "type" => "`$ARRAY`",
            },
            {
              "name" => "colors",
              "short" => "The card colors",
              "type" => "`$ARRAY`",
            },
            {
              "name" => "flavor",
              "short" => "The flavor text of the card",
              "type" => "`$STRING`",
            },
            {
              "name" => "foreignNames",
              "short" => "Foreign language names for the card",
              "type" => "`$ARRAY`",
            },
            {
              "name" => "hand",
              "short" => "Maximum hand size modifier (Vanguard cards only)",
              "type" => "`$INTEGER`",
            },
            {
              "name" => "id",
              "short" => "A unique id for this card (SHA1 hash)",
              "type" => "`$STRING`",
            },
            {
              "name" => "imageUrl",
              "short" => "The image URL for the card",
              "type" => "`$STRING`",
            },
            {
              "name" => "layout",
              "short" => "The card layout",
              "type" => "`$STRING`",
            },
            {
              "name" => "legalities",
              "short" => "Which formats this card is legal, restricted or banned in",
              "type" => "`$ARRAY`",
            },
            {
              "name" => "life",
              "short" => "Starting life total modifier (Vanguard cards only)",
              "type" => "`$INTEGER`",
            },
            {
              "name" => "loyalty",
              "short" => "The loyalty of the card (planeswalkers only)",
              "type" => "`$STRING`",
            },
            {
              "name" => "manaCost",
              "short" => "The mana cost of the card",
              "type" => "`$STRING`",
            },
            {
              "name" => "multiverseid",
              "short" => "The multiverseid of the card on Wizard's Gatherer",
              "type" => "`$INTEGER`",
            },
            {
              "name" => "name",
              "short" => "The card name",
              "type" => "`$STRING`",
            },
            {
              "name" => "names",
              "short" => "Only used for split, flip and dual cards.",
              "type" => "`$ARRAY`",
            },
            {
              "name" => "number",
              "short" => "The card number",
              "type" => "`$STRING`",
            },
            {
              "name" => "originalText",
              "short" => "The original text on the card at the time it was printed",
              "type" => "`$STRING`",
            },
            {
              "name" => "originalType",
              "short" => "The original type on the card at the time it was printed",
              "type" => "`$STRING`",
            },
            {
              "name" => "power",
              "short" => "The power of the card (creatures only)",
              "type" => "`$STRING`",
            },
            {
              "name" => "printings",
              "short" => "The sets that this card was printed in",
              "type" => "`$ARRAY`",
            },
            {
              "name" => "rarity",
              "short" => "The rarity of the card",
              "type" => "`$STRING`",
            },
            {
              "name" => "releaseDate",
              "short" => "The release date for promo cards",
              "type" => "`$STRING`",
            },
            {
              "name" => "reserved",
              "short" => "True if this card is reserved by Wizards Official Reprint Policy",
              "type" => "`$BOOLEAN`",
            },
            {
              "name" => "rulings",
              "short" => "The rulings for the card",
              "type" => "`$ARRAY`",
            },
            {
              "name" => "set",
              "short" => "The set code the card belongs to",
              "type" => "`$STRING`",
            },
            {
              "name" => "setName",
              "short" => "The set name the card belongs to",
              "type" => "`$STRING`",
            },
            {
              "name" => "source",
              "short" => "For promo cards, where the card was originally obtained",
              "type" => "`$STRING`",
            },
            {
              "name" => "starter",
              "short" => "True if this card was only released as part of a core box set",
              "type" => "`$BOOLEAN`",
            },
            {
              "name" => "subtypes",
              "short" => "The subtypes of the card",
              "type" => "`$ARRAY`",
            },
            {
              "name" => "supertypes",
              "short" => "The supertypes of the card",
              "type" => "`$ARRAY`",
            },
            {
              "name" => "text",
              "short" => "The oracle text of the card",
              "type" => "`$STRING`",
            },
            {
              "name" => "timeshifted",
              "short" => "True if this card was timeshifted in the set",
              "type" => "`$BOOLEAN`",
            },
            {
              "name" => "toughness",
              "short" => "The toughness of the card (creatures only)",
              "type" => "`$STRING`",
            },
            {
              "name" => "type",
              "short" => "The card type",
              "type" => "`$STRING`",
            },
            {
              "name" => "types",
              "short" => "The types of the card",
              "type" => "`$ARRAY`",
            },
            {
              "name" => "variations",
              "short" => "Multiverseids of alternate art variations",
              "type" => "`$ARRAY`",
            },
            {
              "name" => "watermark",
              "short" => "The watermark on the card",
              "type" => "`$STRING`",
            },
          ],
          "name" => "set_booster",
          "op" => {
            "list" => {
              "input" => "data",
              "name" => "list",
              "points" => [
                {
                  "args" => {
                    "params" => [
                      {
                        "kind" => "param",
                        "name" => "id",
                        "orig" => "id",
                        "reqd" => true,
                        "type" => "`$STRING`",
                      },
                    ],
                  },
                  "kind" => "http",
                  "method" => "GET",
                  "orig" => "/sets/{id}/booster",
                  "parts" => [
                    "sets",
                    "{id}",
                    "booster",
                  ],
                  "select" => {
                    "exist" => [
                      "id",
                    ],
                  },
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body.cards`",
                  },
                },
              ],
            },
          },
          "relations" => {
            "ancestors" => [],
          },
        },
        "subtype" => {
          "fields" => [
            {
              "name" => "subtypes",
              "type" => "`$ARRAY`",
            },
          ],
          "name" => "subtype",
          "op" => {
            "list" => {
              "input" => "data",
              "name" => "list",
              "points" => [
                {
                  "args" => {},
                  "kind" => "http",
                  "method" => "GET",
                  "orig" => "/subtypes",
                  "parts" => [
                    "subtypes",
                  ],
                  "select" => {},
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body.subtypes`",
                  },
                },
              ],
            },
          },
          "relations" => {
            "ancestors" => [],
          },
        },
        "supertype" => {
          "fields" => [
            {
              "name" => "supertypes",
              "type" => "`$ARRAY`",
            },
          ],
          "name" => "supertype",
          "op" => {
            "list" => {
              "input" => "data",
              "name" => "list",
              "points" => [
                {
                  "args" => {},
                  "kind" => "http",
                  "method" => "GET",
                  "orig" => "/supertypes",
                  "parts" => [
                    "supertypes",
                  ],
                  "select" => {},
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body.supertypes`",
                  },
                },
              ],
            },
          },
          "relations" => {
            "ancestors" => [],
          },
        },
        "type" => {
          "fields" => [
            {
              "name" => "types",
              "type" => "`$ARRAY`",
            },
          ],
          "name" => "type",
          "op" => {
            "list" => {
              "input" => "data",
              "name" => "list",
              "points" => [
                {
                  "args" => {},
                  "kind" => "http",
                  "method" => "GET",
                  "orig" => "/types",
                  "parts" => [
                    "types",
                  ],
                  "select" => {},
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body.types`",
                  },
                },
              ],
            },
          },
          "relations" => {
            "ancestors" => [],
          },
        },
      },
    }
  end


  def self.make_feature(name)
    require_relative 'features'
    MagicTheGatheringTwoFeatures.make_feature(name)
  end
end
