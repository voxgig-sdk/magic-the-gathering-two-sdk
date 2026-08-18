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
		},
		"feature": map[string]any{
			"test": map[string]any{
				"options": map[string]any{
					"active": false,
				},
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
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "border",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "cmc",
						"type": "`$NUMBER`",
					},
					map[string]any{
						"name": "colorIdentity",
						"type": "`$ARRAY`",
					},
					map[string]any{
						"name": "colors",
						"type": "`$ARRAY`",
					},
					map[string]any{
						"name": "flavor",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "foreignNames",
						"type": "`$ARRAY`",
					},
					map[string]any{
						"name": "hand",
						"type": "`$INTEGER`",
					},
					map[string]any{
						"name": "id",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "imageUrl",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "layout",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "legalities",
						"type": "`$ARRAY`",
					},
					map[string]any{
						"name": "life",
						"type": "`$INTEGER`",
					},
					map[string]any{
						"name": "loyalty",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "manaCost",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "multiverseid",
						"type": "`$INTEGER`",
					},
					map[string]any{
						"name": "name",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "names",
						"type": "`$ARRAY`",
					},
					map[string]any{
						"name": "number",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "originalText",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "originalType",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "power",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "printings",
						"type": "`$ARRAY`",
					},
					map[string]any{
						"name": "rarity",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "releaseDate",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "reserved",
						"type": "`$BOOLEAN`",
					},
					map[string]any{
						"name": "rulings",
						"type": "`$ARRAY`",
					},
					map[string]any{
						"name": "set",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "setName",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "source",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "starter",
						"type": "`$BOOLEAN`",
					},
					map[string]any{
						"name": "subtypes",
						"type": "`$ARRAY`",
					},
					map[string]any{
						"name": "supertypes",
						"type": "`$ARRAY`",
					},
					map[string]any{
						"name": "text",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "timeshifted",
						"type": "`$BOOLEAN`",
					},
					map[string]any{
						"name": "toughness",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "type",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "types",
						"type": "`$ARRAY`",
					},
					map[string]any{
						"name": "variations",
						"type": "`$ARRAY`",
					},
					map[string]any{
						"name": "watermark",
						"type": "`$STRING`",
					},
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
								"parts": []any{
									"cards",
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
								"parts": []any{
									"cards",
									"{id}",
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
								"parts": []any{
									"formats",
								},
								"select": map[string]any{},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body.formats`",
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
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "booster",
						"type": "`$ARRAY`",
					},
					map[string]any{
						"name": "border",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "code",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "gathererCode",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "magicCardsInfoCode",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "mkm_id",
						"type": "`$INTEGER`",
					},
					map[string]any{
						"name": "mkm_name",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "name",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "onlineOnly",
						"type": "`$BOOLEAN`",
					},
					map[string]any{
						"name": "releaseDate",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "type",
						"type": "`$STRING`",
					},
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
								"parts": []any{
									"sets",
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
								"parts": []any{
									"sets",
									"{id}",
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
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "border",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "cmc",
						"type": "`$NUMBER`",
					},
					map[string]any{
						"name": "colorIdentity",
						"type": "`$ARRAY`",
					},
					map[string]any{
						"name": "colors",
						"type": "`$ARRAY`",
					},
					map[string]any{
						"name": "flavor",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "foreignNames",
						"type": "`$ARRAY`",
					},
					map[string]any{
						"name": "hand",
						"type": "`$INTEGER`",
					},
					map[string]any{
						"name": "id",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "imageUrl",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "layout",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "legalities",
						"type": "`$ARRAY`",
					},
					map[string]any{
						"name": "life",
						"type": "`$INTEGER`",
					},
					map[string]any{
						"name": "loyalty",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "manaCost",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "multiverseid",
						"type": "`$INTEGER`",
					},
					map[string]any{
						"name": "name",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "names",
						"type": "`$ARRAY`",
					},
					map[string]any{
						"name": "number",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "originalText",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "originalType",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "power",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "printings",
						"type": "`$ARRAY`",
					},
					map[string]any{
						"name": "rarity",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "releaseDate",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "reserved",
						"type": "`$BOOLEAN`",
					},
					map[string]any{
						"name": "rulings",
						"type": "`$ARRAY`",
					},
					map[string]any{
						"name": "set",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "setName",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "source",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "starter",
						"type": "`$BOOLEAN`",
					},
					map[string]any{
						"name": "subtypes",
						"type": "`$ARRAY`",
					},
					map[string]any{
						"name": "supertypes",
						"type": "`$ARRAY`",
					},
					map[string]any{
						"name": "text",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "timeshifted",
						"type": "`$BOOLEAN`",
					},
					map[string]any{
						"name": "toughness",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "type",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "types",
						"type": "`$ARRAY`",
					},
					map[string]any{
						"name": "variations",
						"type": "`$ARRAY`",
					},
					map[string]any{
						"name": "watermark",
						"type": "`$STRING`",
					},
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
								"parts": []any{
									"sets",
									"{id}",
									"booster",
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
								"parts": []any{
									"subtypes",
								},
								"select": map[string]any{},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body.subtypes`",
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
								"parts": []any{
									"supertypes",
								},
								"select": map[string]any{},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body.supertypes`",
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
								"parts": []any{
									"types",
								},
								"select": map[string]any{},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body.types`",
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
