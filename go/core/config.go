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
			"ratelimit": map[string]any{
				"options": map[string]any{
					"active": false,
					"burst": 5,
					"rate": 5,
				},
				"optspec": map[string]any{
					"now": "`$FUNCTION`",
					"sleep": "`$FUNCTION`",
				},
				"strict": false,
				"transport": "wrap",
			},
			"retry": map[string]any{
				"options": map[string]any{
					"active": false,
					"factor": 2,
					"maxDelay": 2000,
					"minDelay": 50,
					"retries": 2,
					"statuses": []any{
						408,
						425,
						429,
						500,
						502,
						503,
						504,
					},
				},
				"optspec": map[string]any{
					"jitter": "`$BOOLEAN`",
					"sleep": "`$FUNCTION`",
				},
				"strict": false,
				"transport": "wrap",
			},
			"test": map[string]any{
				"options": map[string]any{
					"active": false,
				},
				"optspec": map[string]any{
					"entity": "`$MAP`",
					"net": "`$MAP`",
				},
				"strict": false,
				"transport": "base",
			},
			"timeout": map[string]any{
				"options": map[string]any{
					"active": false,
					"ms": 30000,
				},
				"optspec": map[string]any{
					"clearTimer": "`$FUNCTION`",
					"setTimer": "`$FUNCTION`",
				},
				"strict": false,
				"transport": "wrap",
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
						"title": "Artist",
						"type": "`$STRING`",
						"short": "The artist of the card",
					},
					map[string]any{
						"name": "border",
						"title": "Border",
						"type": "`$STRING`",
						"short": "The border color if different from the set default",
					},
					map[string]any{
						"name": "cmc",
						"title": "Cmc",
						"type": "`$NUMBER`",
						"short": "Converted mana cost",
					},
					map[string]any{
						"name": "colorIdentity",
						"title": "Color Identity",
						"type": "`$ARRAY`",
						"short": "The card's color identity by color code",
					},
					map[string]any{
						"name": "colors",
						"title": "Colors",
						"type": "`$ARRAY`",
						"short": "The card colors",
					},
					map[string]any{
						"name": "flavor",
						"title": "Flavor",
						"type": "`$STRING`",
						"short": "The flavor text of the card",
					},
					map[string]any{
						"name": "foreignNames",
						"title": "Foreign Names",
						"type": "`$ARRAY`",
						"short": "Foreign language names for the card",
					},
					map[string]any{
						"name": "hand",
						"title": "Hand",
						"type": "`$INTEGER`",
						"short": "Maximum hand size modifier (Vanguard cards only)",
					},
					map[string]any{
						"name": "id",
						"title": "Id",
						"type": "`$STRING`",
						"short": "A unique id for this card (SHA1 hash)",
					},
					map[string]any{
						"name": "imageUrl",
						"title": "Image Url",
						"type": "`$STRING`",
						"short": "The image URL for the card",
					},
					map[string]any{
						"name": "layout",
						"title": "Layout",
						"type": "`$STRING`",
						"short": "The card layout",
					},
					map[string]any{
						"name": "legalities",
						"title": "Legalities",
						"type": "`$ARRAY`",
						"short": "Which formats this card is legal, restricted or banned in",
					},
					map[string]any{
						"name": "life",
						"title": "Life",
						"type": "`$INTEGER`",
						"short": "Starting life total modifier (Vanguard cards only)",
					},
					map[string]any{
						"name": "loyalty",
						"title": "Loyalty",
						"type": "`$STRING`",
						"short": "The loyalty of the card (planeswalkers only)",
					},
					map[string]any{
						"name": "manaCost",
						"title": "Mana Cost",
						"type": "`$STRING`",
						"short": "The mana cost of the card",
					},
					map[string]any{
						"name": "multiverseid",
						"title": "Multiverseid",
						"type": "`$INTEGER`",
						"short": "The multiverseid of the card on Wizard's Gatherer",
					},
					map[string]any{
						"name": "name",
						"title": "Name",
						"type": "`$STRING`",
						"short": "The card name",
					},
					map[string]any{
						"name": "names",
						"title": "Names",
						"type": "`$ARRAY`",
						"short": "Only used for split, flip and dual cards.",
					},
					map[string]any{
						"name": "number",
						"title": "Number",
						"type": "`$STRING`",
						"short": "The card number",
					},
					map[string]any{
						"name": "originalText",
						"title": "Original Text",
						"type": "`$STRING`",
						"short": "The original text on the card at the time it was printed",
					},
					map[string]any{
						"name": "originalType",
						"title": "Original Type",
						"type": "`$STRING`",
						"short": "The original type on the card at the time it was printed",
					},
					map[string]any{
						"name": "power",
						"title": "Power",
						"type": "`$STRING`",
						"short": "The power of the card (creatures only)",
					},
					map[string]any{
						"name": "printings",
						"title": "Printings",
						"type": "`$ARRAY`",
						"short": "The sets that this card was printed in",
					},
					map[string]any{
						"name": "rarity",
						"title": "Rarity",
						"type": "`$STRING`",
						"short": "The rarity of the card",
					},
					map[string]any{
						"name": "releaseDate",
						"title": "Release Date",
						"type": "`$STRING`",
						"short": "The release date for promo cards",
						"format": "date",
					},
					map[string]any{
						"name": "reserved",
						"title": "Reserved",
						"type": "`$BOOLEAN`",
						"short": "True if this card is reserved by Wizards Official Reprint Policy",
					},
					map[string]any{
						"name": "rulings",
						"title": "Rulings",
						"type": "`$ARRAY`",
						"short": "The rulings for the card",
					},
					map[string]any{
						"name": "set",
						"title": "Set",
						"type": "`$STRING`",
						"short": "The set code the card belongs to",
					},
					map[string]any{
						"name": "setName",
						"title": "Set Name",
						"type": "`$STRING`",
						"short": "The set name the card belongs to",
					},
					map[string]any{
						"name": "source",
						"title": "Source",
						"type": "`$STRING`",
						"short": "For promo cards, where the card was originally obtained",
					},
					map[string]any{
						"name": "starter",
						"title": "Starter",
						"type": "`$BOOLEAN`",
						"short": "True if this card was only released as part of a core box set",
					},
					map[string]any{
						"name": "subtypes",
						"title": "Subtypes",
						"type": "`$ARRAY`",
						"short": "The subtypes of the card",
					},
					map[string]any{
						"name": "supertypes",
						"title": "Supertypes",
						"type": "`$ARRAY`",
						"short": "The supertypes of the card",
					},
					map[string]any{
						"name": "text",
						"title": "Text",
						"type": "`$STRING`",
						"short": "The oracle text of the card",
					},
					map[string]any{
						"name": "timeshifted",
						"title": "Timeshifted",
						"type": "`$BOOLEAN`",
						"short": "True if this card was timeshifted in the set",
					},
					map[string]any{
						"name": "toughness",
						"title": "Toughness",
						"type": "`$STRING`",
						"short": "The toughness of the card (creatures only)",
					},
					map[string]any{
						"name": "type",
						"title": "Type",
						"type": "`$STRING`",
						"short": "The card type",
					},
					map[string]any{
						"name": "types",
						"title": "Types",
						"type": "`$ARRAY`",
						"short": "The types of the card",
					},
					map[string]any{
						"name": "variations",
						"title": "Variations",
						"type": "`$ARRAY`",
						"short": "Multiverseids of alternate art variations",
					},
					map[string]any{
						"name": "watermark",
						"title": "Watermark",
						"type": "`$STRING`",
						"short": "The watermark on the card",
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
								"kind": "http",
								"method": "GET",
								"orig": "/cards",
								"segments": []any{
									map[string]any{
										"lit": "cards",
									},
								},
								"parts": []any{
									"cards",
								},
								"rename": map[string]any{},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body.cards`",
								},
								"args": map[string]any{
									"query": []any{
										map[string]any{
											"name": "artist",
											"orig": "artist",
											"type": "`$STRING`",
											"kind": "query",
										},
										map[string]any{
											"name": "cmc",
											"orig": "cmc",
											"type": "`$NUMBER`",
											"kind": "query",
										},
										map[string]any{
											"name": "color",
											"orig": "color",
											"type": "`$STRING`",
											"kind": "query",
										},
										map[string]any{
											"name": "color_identity",
											"orig": "color_identity",
											"type": "`$STRING`",
											"kind": "query",
										},
										map[string]any{
											"name": "contain",
											"orig": "contain",
											"type": "`$STRING`",
											"kind": "query",
										},
										map[string]any{
											"name": "flavor",
											"orig": "flavor",
											"type": "`$STRING`",
											"kind": "query",
										},
										map[string]any{
											"name": "game_format",
											"orig": "game_format",
											"type": "`$STRING`",
											"kind": "query",
										},
										map[string]any{
											"name": "id",
											"orig": "id",
											"type": "`$STRING`",
											"kind": "query",
										},
										map[string]any{
											"name": "language",
											"orig": "language",
											"type": "`$STRING`",
											"kind": "query",
										},
										map[string]any{
											"name": "layout",
											"orig": "layout",
											"type": "`$STRING`",
											"kind": "query",
										},
										map[string]any{
											"name": "legality",
											"orig": "legality",
											"type": "`$STRING`",
											"kind": "query",
										},
										map[string]any{
											"name": "loyalty",
											"orig": "loyalty",
											"type": "`$STRING`",
											"kind": "query",
										},
										map[string]any{
											"name": "multiverseid",
											"orig": "multiverseid",
											"type": "`$INTEGER`",
											"kind": "query",
										},
										map[string]any{
											"name": "name",
											"orig": "name",
											"type": "`$STRING`",
											"kind": "query",
										},
										map[string]any{
											"name": "number",
											"orig": "number",
											"type": "`$STRING`",
											"kind": "query",
										},
										map[string]any{
											"name": "order_by",
											"orig": "order_by",
											"type": "`$STRING`",
											"kind": "query",
										},
										map[string]any{
											"name": "page",
											"orig": "page",
											"type": "`$INTEGER`",
											"kind": "query",
											"example": 1,
										},
										map[string]any{
											"name": "page_size",
											"orig": "page_size",
											"type": "`$INTEGER`",
											"kind": "query",
											"example": 100,
										},
										map[string]any{
											"name": "power",
											"orig": "power",
											"type": "`$STRING`",
											"kind": "query",
										},
										map[string]any{
											"name": "random",
											"orig": "random",
											"type": "`$BOOLEAN`",
											"kind": "query",
										},
										map[string]any{
											"name": "rarity",
											"orig": "rarity",
											"type": "`$STRING`",
											"kind": "query",
										},
										map[string]any{
											"name": "set",
											"orig": "set",
											"type": "`$STRING`",
											"kind": "query",
										},
										map[string]any{
											"name": "set_name",
											"orig": "set_name",
											"type": "`$STRING`",
											"kind": "query",
										},
										map[string]any{
											"name": "subtype",
											"orig": "subtype",
											"type": "`$STRING`",
											"kind": "query",
										},
										map[string]any{
											"name": "supertype",
											"orig": "supertype",
											"type": "`$STRING`",
											"kind": "query",
										},
										map[string]any{
											"name": "text",
											"orig": "text",
											"type": "`$STRING`",
											"kind": "query",
										},
										map[string]any{
											"name": "toughness",
											"orig": "toughness",
											"type": "`$STRING`",
											"kind": "query",
										},
										map[string]any{
											"name": "type",
											"orig": "type",
											"type": "`$STRING`",
											"kind": "query",
										},
										map[string]any{
											"name": "type",
											"orig": "type",
											"type": "`$STRING`",
											"kind": "query",
										},
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
							},
						},
					},
					"load": map[string]any{
						"input": "data",
						"name": "load",
						"points": []any{
							map[string]any{
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
								"parts": []any{
									"cards",
									"{id}",
								},
								"rename": map[string]any{},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body.card`",
								},
								"args": map[string]any{
									"params": []any{
										map[string]any{
											"name": "id",
											"orig": "id",
											"type": "`$STRING`",
											"kind": "param",
											"reqd": true,
										},
									},
								},
								"select": map[string]any{
									"exist": []any{
										"id",
									},
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
						"title": "Formats",
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
								"kind": "http",
								"method": "GET",
								"orig": "/formats",
								"segments": []any{
									map[string]any{
										"lit": "formats",
									},
								},
								"parts": []any{
									"formats",
								},
								"rename": map[string]any{},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body.formats`",
								},
								"args": map[string]any{},
								"select": map[string]any{},
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
						"title": "Block",
						"type": "`$STRING`",
						"short": "The block the set belongs to",
					},
					map[string]any{
						"name": "booster",
						"title": "Booster",
						"type": "`$ARRAY`",
						"short": "Booster pack configuration",
					},
					map[string]any{
						"name": "border",
						"title": "Border",
						"type": "`$STRING`",
						"short": "The border color of the set",
					},
					map[string]any{
						"name": "code",
						"title": "Code",
						"type": "`$STRING`",
						"short": "The set code",
					},
					map[string]any{
						"name": "gathererCode",
						"title": "Gatherer Code",
						"type": "`$STRING`",
						"short": "The Gatherer code for the set",
					},
					map[string]any{
						"name": "id",
						"title": "Id",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "magicCardsInfoCode",
						"title": "Magic Cards Info Code",
						"type": "`$STRING`",
						"short": "The Magic Cards Info code for the set",
					},
					map[string]any{
						"name": "mkm_id",
						"title": "Mkm Id",
						"type": "`$INTEGER`",
						"short": "The Magic Card Market set ID",
					},
					map[string]any{
						"name": "mkm_name",
						"title": "Mkm Name",
						"type": "`$STRING`",
						"short": "The Magic Card Market set name",
					},
					map[string]any{
						"name": "name",
						"title": "Name",
						"type": "`$STRING`",
						"short": "The name of the set",
					},
					map[string]any{
						"name": "onlineOnly",
						"title": "Online Only",
						"type": "`$BOOLEAN`",
						"short": "True if the set is online only",
					},
					map[string]any{
						"name": "releaseDate",
						"title": "Release Date",
						"type": "`$STRING`",
						"short": "The release date of the set",
						"format": "date",
					},
					map[string]any{
						"name": "type",
						"title": "Type",
						"type": "`$STRING`",
						"short": "The type of the set",
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
								"kind": "http",
								"method": "GET",
								"orig": "/sets",
								"segments": []any{
									map[string]any{
										"lit": "sets",
									},
								},
								"parts": []any{
									"sets",
								},
								"rename": map[string]any{},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body.sets`",
								},
								"args": map[string]any{
									"query": []any{
										map[string]any{
											"name": "block",
											"orig": "block",
											"type": "`$STRING`",
											"kind": "query",
										},
										map[string]any{
											"name": "name",
											"orig": "name",
											"type": "`$STRING`",
											"kind": "query",
										},
									},
								},
								"select": map[string]any{
									"exist": []any{
										"block",
										"name",
									},
								},
							},
						},
					},
					"load": map[string]any{
						"input": "data",
						"name": "load",
						"points": []any{
							map[string]any{
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
								"parts": []any{
									"sets",
									"{id}",
								},
								"rename": map[string]any{},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body.set`",
								},
								"args": map[string]any{
									"params": []any{
										map[string]any{
											"name": "id",
											"orig": "id",
											"type": "`$STRING`",
											"kind": "param",
											"reqd": true,
										},
									},
								},
								"select": map[string]any{
									"exist": []any{
										"id",
									},
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
						"title": "Artist",
						"type": "`$STRING`",
						"short": "The artist of the card",
					},
					map[string]any{
						"name": "border",
						"title": "Border",
						"type": "`$STRING`",
						"short": "The border color if different from the set default",
					},
					map[string]any{
						"name": "cmc",
						"title": "Cmc",
						"type": "`$NUMBER`",
						"short": "Converted mana cost",
					},
					map[string]any{
						"name": "colorIdentity",
						"title": "Color Identity",
						"type": "`$ARRAY`",
						"short": "The card's color identity by color code",
					},
					map[string]any{
						"name": "colors",
						"title": "Colors",
						"type": "`$ARRAY`",
						"short": "The card colors",
					},
					map[string]any{
						"name": "flavor",
						"title": "Flavor",
						"type": "`$STRING`",
						"short": "The flavor text of the card",
					},
					map[string]any{
						"name": "foreignNames",
						"title": "Foreign Names",
						"type": "`$ARRAY`",
						"short": "Foreign language names for the card",
					},
					map[string]any{
						"name": "hand",
						"title": "Hand",
						"type": "`$INTEGER`",
						"short": "Maximum hand size modifier (Vanguard cards only)",
					},
					map[string]any{
						"name": "id",
						"title": "Id",
						"type": "`$STRING`",
						"short": "A unique id for this card (SHA1 hash)",
					},
					map[string]any{
						"name": "imageUrl",
						"title": "Image Url",
						"type": "`$STRING`",
						"short": "The image URL for the card",
					},
					map[string]any{
						"name": "layout",
						"title": "Layout",
						"type": "`$STRING`",
						"short": "The card layout",
					},
					map[string]any{
						"name": "legalities",
						"title": "Legalities",
						"type": "`$ARRAY`",
						"short": "Which formats this card is legal, restricted or banned in",
					},
					map[string]any{
						"name": "life",
						"title": "Life",
						"type": "`$INTEGER`",
						"short": "Starting life total modifier (Vanguard cards only)",
					},
					map[string]any{
						"name": "loyalty",
						"title": "Loyalty",
						"type": "`$STRING`",
						"short": "The loyalty of the card (planeswalkers only)",
					},
					map[string]any{
						"name": "manaCost",
						"title": "Mana Cost",
						"type": "`$STRING`",
						"short": "The mana cost of the card",
					},
					map[string]any{
						"name": "multiverseid",
						"title": "Multiverseid",
						"type": "`$INTEGER`",
						"short": "The multiverseid of the card on Wizard's Gatherer",
					},
					map[string]any{
						"name": "name",
						"title": "Name",
						"type": "`$STRING`",
						"short": "The card name",
					},
					map[string]any{
						"name": "names",
						"title": "Names",
						"type": "`$ARRAY`",
						"short": "Only used for split, flip and dual cards.",
					},
					map[string]any{
						"name": "number",
						"title": "Number",
						"type": "`$STRING`",
						"short": "The card number",
					},
					map[string]any{
						"name": "originalText",
						"title": "Original Text",
						"type": "`$STRING`",
						"short": "The original text on the card at the time it was printed",
					},
					map[string]any{
						"name": "originalType",
						"title": "Original Type",
						"type": "`$STRING`",
						"short": "The original type on the card at the time it was printed",
					},
					map[string]any{
						"name": "power",
						"title": "Power",
						"type": "`$STRING`",
						"short": "The power of the card (creatures only)",
					},
					map[string]any{
						"name": "printings",
						"title": "Printings",
						"type": "`$ARRAY`",
						"short": "The sets that this card was printed in",
					},
					map[string]any{
						"name": "rarity",
						"title": "Rarity",
						"type": "`$STRING`",
						"short": "The rarity of the card",
					},
					map[string]any{
						"name": "releaseDate",
						"title": "Release Date",
						"type": "`$STRING`",
						"short": "The release date for promo cards",
						"format": "date",
					},
					map[string]any{
						"name": "reserved",
						"title": "Reserved",
						"type": "`$BOOLEAN`",
						"short": "True if this card is reserved by Wizards Official Reprint Policy",
					},
					map[string]any{
						"name": "rulings",
						"title": "Rulings",
						"type": "`$ARRAY`",
						"short": "The rulings for the card",
					},
					map[string]any{
						"name": "set",
						"title": "Set",
						"type": "`$STRING`",
						"short": "The set code the card belongs to",
					},
					map[string]any{
						"name": "setName",
						"title": "Set Name",
						"type": "`$STRING`",
						"short": "The set name the card belongs to",
					},
					map[string]any{
						"name": "source",
						"title": "Source",
						"type": "`$STRING`",
						"short": "For promo cards, where the card was originally obtained",
					},
					map[string]any{
						"name": "starter",
						"title": "Starter",
						"type": "`$BOOLEAN`",
						"short": "True if this card was only released as part of a core box set",
					},
					map[string]any{
						"name": "subtypes",
						"title": "Subtypes",
						"type": "`$ARRAY`",
						"short": "The subtypes of the card",
					},
					map[string]any{
						"name": "supertypes",
						"title": "Supertypes",
						"type": "`$ARRAY`",
						"short": "The supertypes of the card",
					},
					map[string]any{
						"name": "text",
						"title": "Text",
						"type": "`$STRING`",
						"short": "The oracle text of the card",
					},
					map[string]any{
						"name": "timeshifted",
						"title": "Timeshifted",
						"type": "`$BOOLEAN`",
						"short": "True if this card was timeshifted in the set",
					},
					map[string]any{
						"name": "toughness",
						"title": "Toughness",
						"type": "`$STRING`",
						"short": "The toughness of the card (creatures only)",
					},
					map[string]any{
						"name": "type",
						"title": "Type",
						"type": "`$STRING`",
						"short": "The card type",
					},
					map[string]any{
						"name": "types",
						"title": "Types",
						"type": "`$ARRAY`",
						"short": "The types of the card",
					},
					map[string]any{
						"name": "variations",
						"title": "Variations",
						"type": "`$ARRAY`",
						"short": "Multiverseids of alternate art variations",
					},
					map[string]any{
						"name": "watermark",
						"title": "Watermark",
						"type": "`$STRING`",
						"short": "The watermark on the card",
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
								"parts": []any{
									"sets",
									"{id}",
									"booster",
								},
								"rename": map[string]any{},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body.cards`",
								},
								"args": map[string]any{
									"params": []any{
										map[string]any{
											"name": "id",
											"orig": "id",
											"type": "`$STRING`",
											"kind": "param",
											"reqd": true,
										},
									},
								},
								"select": map[string]any{
									"exist": []any{
										"id",
									},
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
						"title": "Subtypes",
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
								"kind": "http",
								"method": "GET",
								"orig": "/subtypes",
								"segments": []any{
									map[string]any{
										"lit": "subtypes",
									},
								},
								"parts": []any{
									"subtypes",
								},
								"rename": map[string]any{},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body.subtypes`",
								},
								"args": map[string]any{},
								"select": map[string]any{},
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
						"title": "Supertypes",
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
								"kind": "http",
								"method": "GET",
								"orig": "/supertypes",
								"segments": []any{
									map[string]any{
										"lit": "supertypes",
									},
								},
								"parts": []any{
									"supertypes",
								},
								"rename": map[string]any{},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body.supertypes`",
								},
								"args": map[string]any{},
								"select": map[string]any{},
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
						"title": "Types",
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
								"kind": "http",
								"method": "GET",
								"orig": "/types",
								"segments": []any{
									map[string]any{
										"lit": "types",
									},
								},
								"parts": []any{
									"types",
								},
								"rename": map[string]any{},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body.types`",
								},
								"args": map[string]any{},
								"select": map[string]any{},
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
	case "ratelimit":
		if NewRatelimitFeatureFunc != nil {
			return NewRatelimitFeatureFunc()
		}
	case "retry":
		if NewRetryFeatureFunc != nil {
			return NewRetryFeatureFunc()
		}
	case "test":
		if NewTestFeatureFunc != nil {
			return NewTestFeatureFunc()
		}
	case "timeout":
		if NewTimeoutFeatureFunc != nil {
			return NewTimeoutFeatureFunc()
		}
	default:
		if NewBaseFeatureFunc != nil {
			return NewBaseFeatureFunc()
		}
	}
	return nil
}
