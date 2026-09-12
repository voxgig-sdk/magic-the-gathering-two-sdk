package core

import (
	"sync"
)

// MakeConfig builds a fresh, fully materialised config map. Every call
// rebuilds the whole structure, so prefer SharedConfig unless you need a
// private copy you intend to mutate.
func MakeConfig() map[string]any {
	return map[string]any{
		"main": map[string]any{
			"name": "MagicTheGatheringTwo",
			"slug": "magic-the-gathering-two",
			"version": "0.0.1",
			"target": "go",
		},
		"feature": map[string]any{
			"test": map[string]any{
				"options": map[string]any{
					"active": false,
				},
				"transport": "base",
			},
		},
		"options": map[string]any{
			"base": "https://api.magicthegathering.io/v1",
			"headers": map[string]any{
				"content-type": "application/json",
			},
			"entity": map[string]any{
				"card": map[string]any{},
				"format": map[string]any{},
				"set": map[string]any{},
				"set_booster": map[string]any{},
				"subtype": map[string]any{},
				"supertype": map[string]any{},
				"type": map[string]any{},
			},
		},
		"entity": map[string]any{
			"card": map[string]any{
				"fields": []any{
					map[string]any{
						"name": "artist",
						"short": "The artist of the card",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "border",
						"short": "The border color if different from the set default",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "cmc",
						"short": "Converted mana cost",
						"type": "`$NUMBER`",
					},
					map[string]any{
						"name": "colorIdentity",
						"short": "The card's color identity by color code",
						"type": "`$ARRAY`",
					},
					map[string]any{
						"name": "colors",
						"short": "The card colors",
						"type": "`$ARRAY`",
					},
					map[string]any{
						"name": "flavor",
						"short": "The flavor text of the card",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "foreignNames",
						"short": "Foreign language names for the card",
						"type": "`$ARRAY`",
					},
					map[string]any{
						"name": "hand",
						"short": "Maximum hand size modifier (Vanguard cards only)",
						"type": "`$INTEGER`",
					},
					map[string]any{
						"name": "id",
						"short": "A unique id for this card (SHA1 hash)",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "imageUrl",
						"short": "The image URL for the card",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "layout",
						"short": "The card layout",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "legalities",
						"short": "Which formats this card is legal, restricted or banned in",
						"type": "`$ARRAY`",
					},
					map[string]any{
						"name": "life",
						"short": "Starting life total modifier (Vanguard cards only)",
						"type": "`$INTEGER`",
					},
					map[string]any{
						"name": "loyalty",
						"short": "The loyalty of the card (planeswalkers only)",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "manaCost",
						"short": "The mana cost of the card",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "multiverseid",
						"short": "The multiverseid of the card on Wizard's Gatherer",
						"type": "`$INTEGER`",
					},
					map[string]any{
						"name": "name",
						"short": "The card name",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "names",
						"short": "Only used for split, flip and dual cards.",
						"type": "`$ARRAY`",
					},
					map[string]any{
						"name": "number",
						"short": "The card number",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "originalText",
						"short": "The original text on the card at the time it was printed",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "originalType",
						"short": "The original type on the card at the time it was printed",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "power",
						"short": "The power of the card (creatures only)",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "printings",
						"short": "The sets that this card was printed in",
						"type": "`$ARRAY`",
					},
					map[string]any{
						"name": "rarity",
						"short": "The rarity of the card",
						"type": "`$STRING`",
					},
					map[string]any{
						"format": "date",
						"name": "releaseDate",
						"short": "The release date for promo cards",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "reserved",
						"short": "True if this card is reserved by Wizards Official Reprint Policy",
						"type": "`$BOOLEAN`",
					},
					map[string]any{
						"name": "rulings",
						"short": "The rulings for the card",
						"type": "`$ARRAY`",
					},
					map[string]any{
						"name": "set",
						"short": "The set code the card belongs to",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "setName",
						"short": "The set name the card belongs to",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "source",
						"short": "For promo cards, where the card was originally obtained",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "starter",
						"short": "True if this card was only released as part of a core box set",
						"type": "`$BOOLEAN`",
					},
					map[string]any{
						"name": "subtypes",
						"short": "The subtypes of the card",
						"type": "`$ARRAY`",
					},
					map[string]any{
						"name": "supertypes",
						"short": "The supertypes of the card",
						"type": "`$ARRAY`",
					},
					map[string]any{
						"name": "text",
						"short": "The oracle text of the card",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "timeshifted",
						"short": "True if this card was timeshifted in the set",
						"type": "`$BOOLEAN`",
					},
					map[string]any{
						"name": "toughness",
						"short": "The toughness of the card (creatures only)",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "type",
						"short": "The card type",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "types",
						"short": "The types of the card",
						"type": "`$ARRAY`",
					},
					map[string]any{
						"name": "variations",
						"short": "Multiverseids of alternate art variations",
						"type": "`$ARRAY`",
					},
					map[string]any{
						"name": "watermark",
						"short": "The watermark on the card",
						"type": "`$STRING`",
					},
				},
				"id": map[string]any{
					"field": "id",
					"name": "id",
				},
				"name": "card",
				"op": map[string]any{
					"list": map[string]any{
						"input": "data",
						"name": "list",
						"points": []any{
							map[string]any{
								"args": map[string]any{
									"query": []any{
										map[string]any{
											"kind": "query",
											"name": "artist",
											"orig": "artist",
											"type": "`$STRING`",
										},
										map[string]any{
											"kind": "query",
											"name": "cmc",
											"orig": "cmc",
											"type": "`$NUMBER`",
										},
										map[string]any{
											"kind": "query",
											"name": "color",
											"orig": "color",
											"type": "`$STRING`",
										},
										map[string]any{
											"kind": "query",
											"name": "color_identity",
											"orig": "color_identity",
											"type": "`$STRING`",
										},
										map[string]any{
											"kind": "query",
											"name": "contain",
											"orig": "contain",
											"type": "`$STRING`",
										},
										map[string]any{
											"kind": "query",
											"name": "flavor",
											"orig": "flavor",
											"type": "`$STRING`",
										},
										map[string]any{
											"kind": "query",
											"name": "game_format",
											"orig": "game_format",
											"type": "`$STRING`",
										},
										map[string]any{
											"kind": "query",
											"name": "id",
											"orig": "id",
											"type": "`$STRING`",
										},
										map[string]any{
											"kind": "query",
											"name": "language",
											"orig": "language",
											"type": "`$STRING`",
										},
										map[string]any{
											"kind": "query",
											"name": "layout",
											"orig": "layout",
											"type": "`$STRING`",
										},
										map[string]any{
											"kind": "query",
											"name": "legality",
											"orig": "legality",
											"type": "`$STRING`",
										},
										map[string]any{
											"kind": "query",
											"name": "loyalty",
											"orig": "loyalty",
											"type": "`$STRING`",
										},
										map[string]any{
											"kind": "query",
											"name": "multiverseid",
											"orig": "multiverseid",
											"type": "`$INTEGER`",
										},
										map[string]any{
											"kind": "query",
											"name": "name",
											"orig": "name",
											"type": "`$STRING`",
										},
										map[string]any{
											"kind": "query",
											"name": "number",
											"orig": "number",
											"type": "`$STRING`",
										},
										map[string]any{
											"kind": "query",
											"name": "order_by",
											"orig": "order_by",
											"type": "`$STRING`",
										},
										map[string]any{
											"example": 1,
											"kind": "query",
											"name": "page",
											"orig": "page",
											"type": "`$INTEGER`",
										},
										map[string]any{
											"example": 100,
											"kind": "query",
											"name": "page_size",
											"orig": "page_size",
											"type": "`$INTEGER`",
										},
										map[string]any{
											"kind": "query",
											"name": "power",
											"orig": "power",
											"type": "`$STRING`",
										},
										map[string]any{
											"kind": "query",
											"name": "random",
											"orig": "random",
											"type": "`$BOOLEAN`",
										},
										map[string]any{
											"kind": "query",
											"name": "rarity",
											"orig": "rarity",
											"type": "`$STRING`",
										},
										map[string]any{
											"kind": "query",
											"name": "set",
											"orig": "set",
											"type": "`$STRING`",
										},
										map[string]any{
											"kind": "query",
											"name": "set_name",
											"orig": "set_name",
											"type": "`$STRING`",
										},
										map[string]any{
											"kind": "query",
											"name": "subtype",
											"orig": "subtype",
											"type": "`$STRING`",
										},
										map[string]any{
											"kind": "query",
											"name": "supertype",
											"orig": "supertype",
											"type": "`$STRING`",
										},
										map[string]any{
											"kind": "query",
											"name": "text",
											"orig": "text",
											"type": "`$STRING`",
										},
										map[string]any{
											"kind": "query",
											"name": "toughness",
											"orig": "toughness",
											"type": "`$STRING`",
										},
										map[string]any{
											"kind": "query",
											"name": "type",
											"orig": "type",
											"type": "`$STRING`",
										},
										map[string]any{
											"kind": "query",
											"name": "type",
											"orig": "type",
											"type": "`$STRING`",
										},
									},
								},
								"kind": "http",
								"method": "GET",
								"orig": "/cards",
								"segments": []any{
									map[string]any{
										"lit": "cards",
									},
								},
								"select": map[string]any{
									"exist": []any{
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
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body.cards`",
								},
								"parts": []any{
									"cards",
								},
							},
						},
					},
					"load": map[string]any{
						"input": "data",
						"name": "load",
						"points": []any{
							map[string]any{
								"args": map[string]any{
									"params": []any{
										map[string]any{
											"kind": "param",
											"name": "id",
											"orig": "id",
											"reqd": true,
											"type": "`$STRING`",
										},
									},
								},
								"kind": "http",
								"method": "GET",
								"orig": "/cards/{id}",
								"segments": []any{
									map[string]any{
										"lit": "cards",
									},
									map[string]any{
										"var": "id",
									},
								},
								"select": map[string]any{
									"exist": []any{
										"id",
									},
								},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body.card`",
								},
								"parts": []any{
									"cards",
									"{id}",
								},
							},
						},
					},
				},
				"relations": map[string]any{
					"ancestors": []any{},
				},
			},
			"format": map[string]any{
				"fields": []any{
					map[string]any{
						"name": "formats",
						"type": "`$ARRAY`",
					},
				},
				"name": "format",
				"op": map[string]any{
					"list": map[string]any{
						"input": "data",
						"name": "list",
						"points": []any{
							map[string]any{
								"args": map[string]any{},
								"kind": "http",
								"method": "GET",
								"orig": "/formats",
								"segments": []any{
									map[string]any{
										"lit": "formats",
									},
								},
								"select": map[string]any{},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body.formats`",
								},
								"parts": []any{
									"formats",
								},
							},
						},
					},
				},
				"relations": map[string]any{
					"ancestors": []any{},
				},
			},
			"set": map[string]any{
				"fields": []any{
					map[string]any{
						"name": "block",
						"short": "The block the set belongs to",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "booster",
						"short": "Booster pack configuration",
						"type": "`$ARRAY`",
					},
					map[string]any{
						"name": "border",
						"short": "The border color of the set",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "code",
						"short": "The set code",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "gathererCode",
						"short": "The Gatherer code for the set",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "id",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "magicCardsInfoCode",
						"short": "The Magic Cards Info code for the set",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "mkm_id",
						"short": "The Magic Card Market set ID",
						"type": "`$INTEGER`",
					},
					map[string]any{
						"name": "mkm_name",
						"short": "The Magic Card Market set name",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "name",
						"short": "The name of the set",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "onlineOnly",
						"short": "True if the set is online only",
						"type": "`$BOOLEAN`",
					},
					map[string]any{
						"format": "date",
						"name": "releaseDate",
						"short": "The release date of the set",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "type",
						"short": "The type of the set",
						"type": "`$STRING`",
					},
				},
				"id": map[string]any{
					"field": "id",
					"name": "id",
				},
				"name": "set",
				"op": map[string]any{
					"list": map[string]any{
						"input": "data",
						"name": "list",
						"points": []any{
							map[string]any{
								"args": map[string]any{
									"query": []any{
										map[string]any{
											"kind": "query",
											"name": "block",
											"orig": "block",
											"type": "`$STRING`",
										},
										map[string]any{
											"kind": "query",
											"name": "name",
											"orig": "name",
											"type": "`$STRING`",
										},
									},
								},
								"kind": "http",
								"method": "GET",
								"orig": "/sets",
								"segments": []any{
									map[string]any{
										"lit": "sets",
									},
								},
								"select": map[string]any{
									"exist": []any{
										"block",
										"name",
									},
								},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body.sets`",
								},
								"parts": []any{
									"sets",
								},
							},
						},
					},
					"load": map[string]any{
						"input": "data",
						"name": "load",
						"points": []any{
							map[string]any{
								"args": map[string]any{
									"params": []any{
										map[string]any{
											"kind": "param",
											"name": "id",
											"orig": "id",
											"reqd": true,
											"type": "`$STRING`",
										},
									},
								},
								"kind": "http",
								"method": "GET",
								"orig": "/sets/{id}",
								"segments": []any{
									map[string]any{
										"lit": "sets",
									},
									map[string]any{
										"var": "id",
									},
								},
								"select": map[string]any{
									"exist": []any{
										"id",
									},
								},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body.set`",
								},
								"parts": []any{
									"sets",
									"{id}",
								},
							},
						},
					},
				},
				"relations": map[string]any{
					"ancestors": []any{},
				},
			},
			"set_booster": map[string]any{
				"fields": []any{
					map[string]any{
						"name": "artist",
						"short": "The artist of the card",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "border",
						"short": "The border color if different from the set default",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "cmc",
						"short": "Converted mana cost",
						"type": "`$NUMBER`",
					},
					map[string]any{
						"name": "colorIdentity",
						"short": "The card's color identity by color code",
						"type": "`$ARRAY`",
					},
					map[string]any{
						"name": "colors",
						"short": "The card colors",
						"type": "`$ARRAY`",
					},
					map[string]any{
						"name": "flavor",
						"short": "The flavor text of the card",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "foreignNames",
						"short": "Foreign language names for the card",
						"type": "`$ARRAY`",
					},
					map[string]any{
						"name": "hand",
						"short": "Maximum hand size modifier (Vanguard cards only)",
						"type": "`$INTEGER`",
					},
					map[string]any{
						"name": "id",
						"short": "A unique id for this card (SHA1 hash)",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "imageUrl",
						"short": "The image URL for the card",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "layout",
						"short": "The card layout",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "legalities",
						"short": "Which formats this card is legal, restricted or banned in",
						"type": "`$ARRAY`",
					},
					map[string]any{
						"name": "life",
						"short": "Starting life total modifier (Vanguard cards only)",
						"type": "`$INTEGER`",
					},
					map[string]any{
						"name": "loyalty",
						"short": "The loyalty of the card (planeswalkers only)",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "manaCost",
						"short": "The mana cost of the card",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "multiverseid",
						"short": "The multiverseid of the card on Wizard's Gatherer",
						"type": "`$INTEGER`",
					},
					map[string]any{
						"name": "name",
						"short": "The card name",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "names",
						"short": "Only used for split, flip and dual cards.",
						"type": "`$ARRAY`",
					},
					map[string]any{
						"name": "number",
						"short": "The card number",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "originalText",
						"short": "The original text on the card at the time it was printed",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "originalType",
						"short": "The original type on the card at the time it was printed",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "power",
						"short": "The power of the card (creatures only)",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "printings",
						"short": "The sets that this card was printed in",
						"type": "`$ARRAY`",
					},
					map[string]any{
						"name": "rarity",
						"short": "The rarity of the card",
						"type": "`$STRING`",
					},
					map[string]any{
						"format": "date",
						"name": "releaseDate",
						"short": "The release date for promo cards",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "reserved",
						"short": "True if this card is reserved by Wizards Official Reprint Policy",
						"type": "`$BOOLEAN`",
					},
					map[string]any{
						"name": "rulings",
						"short": "The rulings for the card",
						"type": "`$ARRAY`",
					},
					map[string]any{
						"name": "set",
						"short": "The set code the card belongs to",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "setName",
						"short": "The set name the card belongs to",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "source",
						"short": "For promo cards, where the card was originally obtained",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "starter",
						"short": "True if this card was only released as part of a core box set",
						"type": "`$BOOLEAN`",
					},
					map[string]any{
						"name": "subtypes",
						"short": "The subtypes of the card",
						"type": "`$ARRAY`",
					},
					map[string]any{
						"name": "supertypes",
						"short": "The supertypes of the card",
						"type": "`$ARRAY`",
					},
					map[string]any{
						"name": "text",
						"short": "The oracle text of the card",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "timeshifted",
						"short": "True if this card was timeshifted in the set",
						"type": "`$BOOLEAN`",
					},
					map[string]any{
						"name": "toughness",
						"short": "The toughness of the card (creatures only)",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "type",
						"short": "The card type",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "types",
						"short": "The types of the card",
						"type": "`$ARRAY`",
					},
					map[string]any{
						"name": "variations",
						"short": "Multiverseids of alternate art variations",
						"type": "`$ARRAY`",
					},
					map[string]any{
						"name": "watermark",
						"short": "The watermark on the card",
						"type": "`$STRING`",
					},
				},
				"id": map[string]any{
					"field": "id",
					"name": "id",
				},
				"name": "set_booster",
				"op": map[string]any{
					"list": map[string]any{
						"input": "data",
						"name": "list",
						"points": []any{
							map[string]any{
								"args": map[string]any{
									"params": []any{
										map[string]any{
											"kind": "param",
											"name": "id",
											"orig": "id",
											"reqd": true,
											"type": "`$STRING`",
										},
									},
								},
								"kind": "http",
								"method": "GET",
								"orig": "/sets/{id}/booster",
								"segments": []any{
									map[string]any{
										"lit": "sets",
									},
									map[string]any{
										"var": "id",
									},
									map[string]any{
										"lit": "booster",
									},
								},
								"select": map[string]any{
									"exist": []any{
										"id",
									},
								},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body.cards`",
								},
								"parts": []any{
									"sets",
									"{id}",
									"booster",
								},
							},
						},
					},
				},
				"relations": map[string]any{
					"ancestors": []any{},
				},
			},
			"subtype": map[string]any{
				"fields": []any{
					map[string]any{
						"name": "subtypes",
						"type": "`$ARRAY`",
					},
				},
				"name": "subtype",
				"op": map[string]any{
					"list": map[string]any{
						"input": "data",
						"name": "list",
						"points": []any{
							map[string]any{
								"args": map[string]any{},
								"kind": "http",
								"method": "GET",
								"orig": "/subtypes",
								"segments": []any{
									map[string]any{
										"lit": "subtypes",
									},
								},
								"select": map[string]any{},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body.subtypes`",
								},
								"parts": []any{
									"subtypes",
								},
							},
						},
					},
				},
				"relations": map[string]any{
					"ancestors": []any{},
				},
			},
			"supertype": map[string]any{
				"fields": []any{
					map[string]any{
						"name": "supertypes",
						"type": "`$ARRAY`",
					},
				},
				"name": "supertype",
				"op": map[string]any{
					"list": map[string]any{
						"input": "data",
						"name": "list",
						"points": []any{
							map[string]any{
								"args": map[string]any{},
								"kind": "http",
								"method": "GET",
								"orig": "/supertypes",
								"segments": []any{
									map[string]any{
										"lit": "supertypes",
									},
								},
								"select": map[string]any{},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body.supertypes`",
								},
								"parts": []any{
									"supertypes",
								},
							},
						},
					},
				},
				"relations": map[string]any{
					"ancestors": []any{},
				},
			},
			"type": map[string]any{
				"fields": []any{
					map[string]any{
						"name": "types",
						"type": "`$ARRAY`",
					},
				},
				"name": "type",
				"op": map[string]any{
					"list": map[string]any{
						"input": "data",
						"name": "list",
						"points": []any{
							map[string]any{
								"args": map[string]any{},
								"kind": "http",
								"method": "GET",
								"orig": "/types",
								"segments": []any{
									map[string]any{
										"lit": "types",
									},
								},
								"select": map[string]any{},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body.types`",
								},
								"parts": []any{
									"types",
								},
							},
						},
					},
				},
				"relations": map[string]any{
					"ancestors": []any{},
				},
			},
		},
	}
}

// The plugin definitions the model selected per feature, as []any so a
// feature package can consume them without core naming its types. Empty
// when no active feature declares active plugin groups for this target.
var featurePlugins = map[string][]any{
}

// FeaturePlugins is the definitions list for one feature's chain.
func FeaturePlugins(name string) []any {
	return featurePlugins[name]
}

var (
	sharedConfigOnce sync.Once
	sharedConfigVal  map[string]any
)

// SharedConfig returns the process-wide config, built once on first use.
// The SDK reads the config on every request and never writes to it, so one
// instance is shared by every client rather than rebuilt per client.
//
// The returned map is shared: treat it as read-only. Callers that need to
// mutate should use MakeConfig, which always returns a fresh copy.
func SharedConfig() map[string]any {
	sharedConfigOnce.Do(func() {
		sharedConfigVal = MakeConfig()
	})
	return sharedConfigVal
}

func makeFeature(name string) Feature {
	switch name {
	case "test":
		if NewTestFeatureFunc != nil {
			return NewTestFeatureFunc()
		}
	default:
		if NewBaseFeatureFunc != nil {
			return NewBaseFeatureFunc()
		}
	}
	return nil
}
