<?php
declare(strict_types=1);

// MagicTheGatheringTwo SDK configuration

class MagicTheGatheringTwoConfig
{
    /** @var array<string,mixed>|null */
    private static ?array $shared_config = null;

    /**
     * Return the process-wide config, built once on first use. The SDK reads
     * the config on every request and never writes to it, so one instance is
     * shared by every client rather than rebuilt per client.
     *
     * PHP arrays are copy-on-write, so callers that do mutate the result get
     * their own copy and cannot disturb the shared one.
     */
    public static function shared_config(): array
    {
        if (self::$shared_config === null) {
            self::$shared_config = self::make_config();
        }
        return self::$shared_config;
    }

    /**
     * Build a fresh, fully materialised config array. Every call rebuilds the
     * whole structure, so prefer shared_config unless you need a private copy.
     */
    public static function make_config(): array
    {
        return [
            "main" => [
                "name" => "MagicTheGatheringTwo",
            ],
            "feature" => [
                "test" => [
          'options' => [
            'active' => false,
          ],
        ],
            ],
            "options" => [
                "base" => "https://api.magicthegathering.io/v1",
                "headers" => [
          'content-type' => 'application/json',
        ],
                "entity" => [
                    "card" => [],
                    "format" => [],
                    "set" => [],
                    "set_booster" => [],
                    "subtype" => [],
                    "supertype" => [],
                    "type" => [],
                ],
            ],
            "entity" => [
        'card' => [
          'fields' => [
            [
              'name' => 'artist',
              'type' => '`$STRING`',
            ],
            [
              'name' => 'border',
              'type' => '`$STRING`',
            ],
            [
              'name' => 'cmc',
              'type' => '`$NUMBER`',
            ],
            [
              'name' => 'colorIdentity',
              'type' => '`$ARRAY`',
            ],
            [
              'name' => 'colors',
              'type' => '`$ARRAY`',
            ],
            [
              'name' => 'flavor',
              'type' => '`$STRING`',
            ],
            [
              'name' => 'foreignNames',
              'type' => '`$ARRAY`',
            ],
            [
              'name' => 'hand',
              'type' => '`$INTEGER`',
            ],
            [
              'name' => 'id',
              'type' => '`$STRING`',
            ],
            [
              'name' => 'imageUrl',
              'type' => '`$STRING`',
            ],
            [
              'name' => 'layout',
              'type' => '`$STRING`',
            ],
            [
              'name' => 'legalities',
              'type' => '`$ARRAY`',
            ],
            [
              'name' => 'life',
              'type' => '`$INTEGER`',
            ],
            [
              'name' => 'loyalty',
              'type' => '`$STRING`',
            ],
            [
              'name' => 'manaCost',
              'type' => '`$STRING`',
            ],
            [
              'name' => 'multiverseid',
              'type' => '`$INTEGER`',
            ],
            [
              'name' => 'name',
              'type' => '`$STRING`',
            ],
            [
              'name' => 'names',
              'type' => '`$ARRAY`',
            ],
            [
              'name' => 'number',
              'type' => '`$STRING`',
            ],
            [
              'name' => 'originalText',
              'type' => '`$STRING`',
            ],
            [
              'name' => 'originalType',
              'type' => '`$STRING`',
            ],
            [
              'name' => 'power',
              'type' => '`$STRING`',
            ],
            [
              'name' => 'printings',
              'type' => '`$ARRAY`',
            ],
            [
              'name' => 'rarity',
              'type' => '`$STRING`',
            ],
            [
              'name' => 'releaseDate',
              'type' => '`$STRING`',
            ],
            [
              'name' => 'reserved',
              'type' => '`$BOOLEAN`',
            ],
            [
              'name' => 'rulings',
              'type' => '`$ARRAY`',
            ],
            [
              'name' => 'set',
              'type' => '`$STRING`',
            ],
            [
              'name' => 'setName',
              'type' => '`$STRING`',
            ],
            [
              'name' => 'source',
              'type' => '`$STRING`',
            ],
            [
              'name' => 'starter',
              'type' => '`$BOOLEAN`',
            ],
            [
              'name' => 'subtypes',
              'type' => '`$ARRAY`',
            ],
            [
              'name' => 'supertypes',
              'type' => '`$ARRAY`',
            ],
            [
              'name' => 'text',
              'type' => '`$STRING`',
            ],
            [
              'name' => 'timeshifted',
              'type' => '`$BOOLEAN`',
            ],
            [
              'name' => 'toughness',
              'type' => '`$STRING`',
            ],
            [
              'name' => 'type',
              'type' => '`$STRING`',
            ],
            [
              'name' => 'types',
              'type' => '`$ARRAY`',
            ],
            [
              'name' => 'variations',
              'type' => '`$ARRAY`',
            ],
            [
              'name' => 'watermark',
              'type' => '`$STRING`',
            ],
          ],
          'name' => 'card',
          'op' => [
            'list' => [
              'input' => 'data',
              'name' => 'list',
              'points' => [
                [
                  'args' => [
                    'query' => [
                      [
                        'kind' => 'query',
                        'name' => 'artist',
                        'orig' => 'artist',
                        'type' => '`$STRING`',
                      ],
                      [
                        'kind' => 'query',
                        'name' => 'cmc',
                        'orig' => 'cmc',
                        'type' => '`$NUMBER`',
                      ],
                      [
                        'kind' => 'query',
                        'name' => 'color',
                        'orig' => 'color',
                        'type' => '`$STRING`',
                      ],
                      [
                        'kind' => 'query',
                        'name' => 'color_identity',
                        'orig' => 'color_identity',
                        'type' => '`$STRING`',
                      ],
                      [
                        'kind' => 'query',
                        'name' => 'contain',
                        'orig' => 'contain',
                        'type' => '`$STRING`',
                      ],
                      [
                        'kind' => 'query',
                        'name' => 'flavor',
                        'orig' => 'flavor',
                        'type' => '`$STRING`',
                      ],
                      [
                        'kind' => 'query',
                        'name' => 'game_format',
                        'orig' => 'game_format',
                        'type' => '`$STRING`',
                      ],
                      [
                        'kind' => 'query',
                        'name' => 'id',
                        'orig' => 'id',
                        'type' => '`$STRING`',
                      ],
                      [
                        'kind' => 'query',
                        'name' => 'language',
                        'orig' => 'language',
                        'type' => '`$STRING`',
                      ],
                      [
                        'kind' => 'query',
                        'name' => 'layout',
                        'orig' => 'layout',
                        'type' => '`$STRING`',
                      ],
                      [
                        'kind' => 'query',
                        'name' => 'legality',
                        'orig' => 'legality',
                        'type' => '`$STRING`',
                      ],
                      [
                        'kind' => 'query',
                        'name' => 'loyalty',
                        'orig' => 'loyalty',
                        'type' => '`$STRING`',
                      ],
                      [
                        'kind' => 'query',
                        'name' => 'multiverseid',
                        'orig' => 'multiverseid',
                        'type' => '`$INTEGER`',
                      ],
                      [
                        'kind' => 'query',
                        'name' => 'name',
                        'orig' => 'name',
                        'type' => '`$STRING`',
                      ],
                      [
                        'kind' => 'query',
                        'name' => 'number',
                        'orig' => 'number',
                        'type' => '`$STRING`',
                      ],
                      [
                        'kind' => 'query',
                        'name' => 'order_by',
                        'orig' => 'order_by',
                        'type' => '`$STRING`',
                      ],
                      [
                        'example' => 1,
                        'kind' => 'query',
                        'name' => 'page',
                        'orig' => 'page',
                        'type' => '`$INTEGER`',
                      ],
                      [
                        'example' => 100,
                        'kind' => 'query',
                        'name' => 'page_size',
                        'orig' => 'page_size',
                        'type' => '`$INTEGER`',
                      ],
                      [
                        'kind' => 'query',
                        'name' => 'power',
                        'orig' => 'power',
                        'type' => '`$STRING`',
                      ],
                      [
                        'kind' => 'query',
                        'name' => 'random',
                        'orig' => 'random',
                        'type' => '`$BOOLEAN`',
                      ],
                      [
                        'kind' => 'query',
                        'name' => 'rarity',
                        'orig' => 'rarity',
                        'type' => '`$STRING`',
                      ],
                      [
                        'kind' => 'query',
                        'name' => 'set',
                        'orig' => 'set',
                        'type' => '`$STRING`',
                      ],
                      [
                        'kind' => 'query',
                        'name' => 'set_name',
                        'orig' => 'set_name',
                        'type' => '`$STRING`',
                      ],
                      [
                        'kind' => 'query',
                        'name' => 'subtype',
                        'orig' => 'subtype',
                        'type' => '`$STRING`',
                      ],
                      [
                        'kind' => 'query',
                        'name' => 'supertype',
                        'orig' => 'supertype',
                        'type' => '`$STRING`',
                      ],
                      [
                        'kind' => 'query',
                        'name' => 'text',
                        'orig' => 'text',
                        'type' => '`$STRING`',
                      ],
                      [
                        'kind' => 'query',
                        'name' => 'toughness',
                        'orig' => 'toughness',
                        'type' => '`$STRING`',
                      ],
                      [
                        'kind' => 'query',
                        'name' => 'type',
                        'orig' => 'type',
                        'type' => '`$STRING`',
                      ],
                      [
                        'kind' => 'query',
                        'name' => 'type',
                        'orig' => 'type',
                        'type' => '`$STRING`',
                      ],
                    ],
                  ],
                  'kind' => 'http',
                  'method' => 'GET',
                  'orig' => '/cards',
                  'parts' => [
                    'cards',
                  ],
                  'select' => [
                    'exist' => [
                      'artist',
                      'cmc',
                      'color',
                      'color_identity',
                      'contain',
                      'flavor',
                      'game_format',
                      'id',
                      'language',
                      'layout',
                      'legality',
                      'loyalty',
                      'multiverseid',
                      'name',
                      'number',
                      'order_by',
                      'page',
                      'page_size',
                      'power',
                      'random',
                      'rarity',
                      'set',
                      'set_name',
                      'subtype',
                      'supertype',
                      'text',
                      'toughness',
                      'type',
                    ],
                  ],
                  'transform' => [
                    'req' => '`reqdata`',
                    'res' => '`body.cards`',
                  ],
                ],
              ],
            ],
            'load' => [
              'input' => 'data',
              'name' => 'load',
              'points' => [
                [
                  'args' => [
                    'params' => [
                      [
                        'kind' => 'param',
                        'name' => 'id',
                        'orig' => 'id',
                        'reqd' => true,
                        'type' => '`$STRING`',
                      ],
                    ],
                  ],
                  'kind' => 'http',
                  'method' => 'GET',
                  'orig' => '/cards/{id}',
                  'parts' => [
                    'cards',
                    '{id}',
                  ],
                  'select' => [
                    'exist' => [
                      'id',
                    ],
                  ],
                  'transform' => [
                    'req' => '`reqdata`',
                    'res' => '`body.card`',
                  ],
                ],
              ],
            ],
          ],
          'relations' => [
            'ancestors' => [],
          ],
        ],
        'format' => [
          'fields' => [
            [
              'name' => 'formats',
              'type' => '`$ARRAY`',
            ],
          ],
          'name' => 'format',
          'op' => [
            'list' => [
              'input' => 'data',
              'name' => 'list',
              'points' => [
                [
                  'args' => [],
                  'kind' => 'http',
                  'method' => 'GET',
                  'orig' => '/formats',
                  'parts' => [
                    'formats',
                  ],
                  'select' => [],
                  'transform' => [
                    'req' => '`reqdata`',
                    'res' => '`body.formats`',
                  ],
                ],
              ],
            ],
          ],
          'relations' => [
            'ancestors' => [],
          ],
        ],
        'set' => [
          'fields' => [
            [
              'name' => 'block',
              'type' => '`$STRING`',
            ],
            [
              'name' => 'booster',
              'type' => '`$ARRAY`',
            ],
            [
              'name' => 'border',
              'type' => '`$STRING`',
            ],
            [
              'name' => 'code',
              'type' => '`$STRING`',
            ],
            [
              'name' => 'gathererCode',
              'type' => '`$STRING`',
            ],
            [
              'name' => 'magicCardsInfoCode',
              'type' => '`$STRING`',
            ],
            [
              'name' => 'mkm_id',
              'type' => '`$INTEGER`',
            ],
            [
              'name' => 'mkm_name',
              'type' => '`$STRING`',
            ],
            [
              'name' => 'name',
              'type' => '`$STRING`',
            ],
            [
              'name' => 'onlineOnly',
              'type' => '`$BOOLEAN`',
            ],
            [
              'name' => 'releaseDate',
              'type' => '`$STRING`',
            ],
            [
              'name' => 'type',
              'type' => '`$STRING`',
            ],
          ],
          'name' => 'set',
          'op' => [
            'list' => [
              'input' => 'data',
              'name' => 'list',
              'points' => [
                [
                  'args' => [
                    'query' => [
                      [
                        'kind' => 'query',
                        'name' => 'block',
                        'orig' => 'block',
                        'type' => '`$STRING`',
                      ],
                      [
                        'kind' => 'query',
                        'name' => 'name',
                        'orig' => 'name',
                        'type' => '`$STRING`',
                      ],
                    ],
                  ],
                  'kind' => 'http',
                  'method' => 'GET',
                  'orig' => '/sets',
                  'parts' => [
                    'sets',
                  ],
                  'select' => [
                    'exist' => [
                      'block',
                      'name',
                    ],
                  ],
                  'transform' => [
                    'req' => '`reqdata`',
                    'res' => '`body.sets`',
                  ],
                ],
              ],
            ],
            'load' => [
              'input' => 'data',
              'name' => 'load',
              'points' => [
                [
                  'args' => [
                    'params' => [
                      [
                        'kind' => 'param',
                        'name' => 'id',
                        'orig' => 'id',
                        'reqd' => true,
                        'type' => '`$STRING`',
                      ],
                    ],
                  ],
                  'kind' => 'http',
                  'method' => 'GET',
                  'orig' => '/sets/{id}',
                  'parts' => [
                    'sets',
                    '{id}',
                  ],
                  'select' => [
                    'exist' => [
                      'id',
                    ],
                  ],
                  'transform' => [
                    'req' => '`reqdata`',
                    'res' => '`body.set`',
                  ],
                ],
              ],
            ],
          ],
          'relations' => [
            'ancestors' => [],
          ],
        ],
        'set_booster' => [
          'fields' => [
            [
              'name' => 'artist',
              'type' => '`$STRING`',
            ],
            [
              'name' => 'border',
              'type' => '`$STRING`',
            ],
            [
              'name' => 'cmc',
              'type' => '`$NUMBER`',
            ],
            [
              'name' => 'colorIdentity',
              'type' => '`$ARRAY`',
            ],
            [
              'name' => 'colors',
              'type' => '`$ARRAY`',
            ],
            [
              'name' => 'flavor',
              'type' => '`$STRING`',
            ],
            [
              'name' => 'foreignNames',
              'type' => '`$ARRAY`',
            ],
            [
              'name' => 'hand',
              'type' => '`$INTEGER`',
            ],
            [
              'name' => 'id',
              'type' => '`$STRING`',
            ],
            [
              'name' => 'imageUrl',
              'type' => '`$STRING`',
            ],
            [
              'name' => 'layout',
              'type' => '`$STRING`',
            ],
            [
              'name' => 'legalities',
              'type' => '`$ARRAY`',
            ],
            [
              'name' => 'life',
              'type' => '`$INTEGER`',
            ],
            [
              'name' => 'loyalty',
              'type' => '`$STRING`',
            ],
            [
              'name' => 'manaCost',
              'type' => '`$STRING`',
            ],
            [
              'name' => 'multiverseid',
              'type' => '`$INTEGER`',
            ],
            [
              'name' => 'name',
              'type' => '`$STRING`',
            ],
            [
              'name' => 'names',
              'type' => '`$ARRAY`',
            ],
            [
              'name' => 'number',
              'type' => '`$STRING`',
            ],
            [
              'name' => 'originalText',
              'type' => '`$STRING`',
            ],
            [
              'name' => 'originalType',
              'type' => '`$STRING`',
            ],
            [
              'name' => 'power',
              'type' => '`$STRING`',
            ],
            [
              'name' => 'printings',
              'type' => '`$ARRAY`',
            ],
            [
              'name' => 'rarity',
              'type' => '`$STRING`',
            ],
            [
              'name' => 'releaseDate',
              'type' => '`$STRING`',
            ],
            [
              'name' => 'reserved',
              'type' => '`$BOOLEAN`',
            ],
            [
              'name' => 'rulings',
              'type' => '`$ARRAY`',
            ],
            [
              'name' => 'set',
              'type' => '`$STRING`',
            ],
            [
              'name' => 'setName',
              'type' => '`$STRING`',
            ],
            [
              'name' => 'source',
              'type' => '`$STRING`',
            ],
            [
              'name' => 'starter',
              'type' => '`$BOOLEAN`',
            ],
            [
              'name' => 'subtypes',
              'type' => '`$ARRAY`',
            ],
            [
              'name' => 'supertypes',
              'type' => '`$ARRAY`',
            ],
            [
              'name' => 'text',
              'type' => '`$STRING`',
            ],
            [
              'name' => 'timeshifted',
              'type' => '`$BOOLEAN`',
            ],
            [
              'name' => 'toughness',
              'type' => '`$STRING`',
            ],
            [
              'name' => 'type',
              'type' => '`$STRING`',
            ],
            [
              'name' => 'types',
              'type' => '`$ARRAY`',
            ],
            [
              'name' => 'variations',
              'type' => '`$ARRAY`',
            ],
            [
              'name' => 'watermark',
              'type' => '`$STRING`',
            ],
          ],
          'name' => 'set_booster',
          'op' => [
            'list' => [
              'input' => 'data',
              'name' => 'list',
              'points' => [
                [
                  'args' => [
                    'params' => [
                      [
                        'kind' => 'param',
                        'name' => 'id',
                        'orig' => 'id',
                        'reqd' => true,
                        'type' => '`$STRING`',
                      ],
                    ],
                  ],
                  'kind' => 'http',
                  'method' => 'GET',
                  'orig' => '/sets/{id}/booster',
                  'parts' => [
                    'sets',
                    '{id}',
                    'booster',
                  ],
                  'select' => [
                    'exist' => [
                      'id',
                    ],
                  ],
                  'transform' => [
                    'req' => '`reqdata`',
                    'res' => '`body.cards`',
                  ],
                ],
              ],
            ],
          ],
          'relations' => [
            'ancestors' => [],
          ],
        ],
        'subtype' => [
          'fields' => [
            [
              'name' => 'subtypes',
              'type' => '`$ARRAY`',
            ],
          ],
          'name' => 'subtype',
          'op' => [
            'list' => [
              'input' => 'data',
              'name' => 'list',
              'points' => [
                [
                  'args' => [],
                  'kind' => 'http',
                  'method' => 'GET',
                  'orig' => '/subtypes',
                  'parts' => [
                    'subtypes',
                  ],
                  'select' => [],
                  'transform' => [
                    'req' => '`reqdata`',
                    'res' => '`body.subtypes`',
                  ],
                ],
              ],
            ],
          ],
          'relations' => [
            'ancestors' => [],
          ],
        ],
        'supertype' => [
          'fields' => [
            [
              'name' => 'supertypes',
              'type' => '`$ARRAY`',
            ],
          ],
          'name' => 'supertype',
          'op' => [
            'list' => [
              'input' => 'data',
              'name' => 'list',
              'points' => [
                [
                  'args' => [],
                  'kind' => 'http',
                  'method' => 'GET',
                  'orig' => '/supertypes',
                  'parts' => [
                    'supertypes',
                  ],
                  'select' => [],
                  'transform' => [
                    'req' => '`reqdata`',
                    'res' => '`body.supertypes`',
                  ],
                ],
              ],
            ],
          ],
          'relations' => [
            'ancestors' => [],
          ],
        ],
        'type' => [
          'fields' => [
            [
              'name' => 'types',
              'type' => '`$ARRAY`',
            ],
          ],
          'name' => 'type',
          'op' => [
            'list' => [
              'input' => 'data',
              'name' => 'list',
              'points' => [
                [
                  'args' => [],
                  'kind' => 'http',
                  'method' => 'GET',
                  'orig' => '/types',
                  'parts' => [
                    'types',
                  ],
                  'select' => [],
                  'transform' => [
                    'req' => '`reqdata`',
                    'res' => '`body.types`',
                  ],
                ],
              ],
            ],
          ],
          'relations' => [
            'ancestors' => [],
          ],
        ],
      ],
        ];
    }


    public static function make_feature(string $name)
    {
        require_once __DIR__ . '/features.php';
        return MagicTheGatheringTwoFeatures::make_feature($name);
    }
}
