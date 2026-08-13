# frozen_string_literal: true

# Typed models for the MagicTheGatheringTwo SDK.
#
# GENERATED from the API model: main.kit.entity.<e>.fields[] and per-op
# params (op.<name>.points[].args.params[]). Member types come from the
# canonical type sentinels via @voxgig/sdkgen canonToType (source of truth:
# @voxgig/apidef VALID_CANON). Ruby types are unenforced; these YARD
# annotations document the shapes. Do not edit by hand.

# Card entity data model.
#
# @!attribute [rw] artist
#   @return [String, nil]
#
# @!attribute [rw] border
#   @return [String, nil]
#
# @!attribute [rw] cmc
#   @return [Float, nil]
#
# @!attribute [rw] colorIdentity
#   @return [Array, nil]
#
# @!attribute [rw] colors
#   @return [Array, nil]
#
# @!attribute [rw] flavor
#   @return [String, nil]
#
# @!attribute [rw] foreignNames
#   @return [Array, nil]
#
# @!attribute [rw] hand
#   @return [Integer, nil]
#
# @!attribute [rw] id
#   @return [String, nil]
#
# @!attribute [rw] imageUrl
#   @return [String, nil]
#
# @!attribute [rw] layout
#   @return [String, nil]
#
# @!attribute [rw] legalities
#   @return [Array, nil]
#
# @!attribute [rw] life
#   @return [Integer, nil]
#
# @!attribute [rw] loyalty
#   @return [String, nil]
#
# @!attribute [rw] manaCost
#   @return [String, nil]
#
# @!attribute [rw] multiverseid
#   @return [Integer, nil]
#
# @!attribute [rw] name
#   @return [String, nil]
#
# @!attribute [rw] names
#   @return [Array, nil]
#
# @!attribute [rw] number
#   @return [String, nil]
#
# @!attribute [rw] originalText
#   @return [String, nil]
#
# @!attribute [rw] originalType
#   @return [String, nil]
#
# @!attribute [rw] power
#   @return [String, nil]
#
# @!attribute [rw] printings
#   @return [Array, nil]
#
# @!attribute [rw] rarity
#   @return [String, nil]
#
# @!attribute [rw] releaseDate
#   @return [String, nil]
#
# @!attribute [rw] reserved
#   @return [Boolean, nil]
#
# @!attribute [rw] rulings
#   @return [Array, nil]
#
# @!attribute [rw] set
#   @return [String, nil]
#
# @!attribute [rw] setName
#   @return [String, nil]
#
# @!attribute [rw] source
#   @return [String, nil]
#
# @!attribute [rw] starter
#   @return [Boolean, nil]
#
# @!attribute [rw] subtypes
#   @return [Array, nil]
#
# @!attribute [rw] supertypes
#   @return [Array, nil]
#
# @!attribute [rw] text
#   @return [String, nil]
#
# @!attribute [rw] timeshifted
#   @return [Boolean, nil]
#
# @!attribute [rw] toughness
#   @return [String, nil]
#
# @!attribute [rw] type
#   @return [String, nil]
#
# @!attribute [rw] types
#   @return [Array, nil]
#
# @!attribute [rw] variations
#   @return [Array, nil]
#
# @!attribute [rw] watermark
#   @return [String, nil]
Card = Struct.new(
  :artist,
  :border,
  :cmc,
  :colorIdentity,
  :colors,
  :flavor,
  :foreignNames,
  :hand,
  :id,
  :imageUrl,
  :layout,
  :legalities,
  :life,
  :loyalty,
  :manaCost,
  :multiverseid,
  :name,
  :names,
  :number,
  :originalText,
  :originalType,
  :power,
  :printings,
  :rarity,
  :releaseDate,
  :reserved,
  :rulings,
  :set,
  :setName,
  :source,
  :starter,
  :subtypes,
  :supertypes,
  :text,
  :timeshifted,
  :toughness,
  :type,
  :types,
  :variations,
  :watermark,
  keyword_init: true
)

# Request payload for Card#load.
#
# @!attribute [rw] id
#   @return [String]
CardLoadMatch = Struct.new(
  :id,
  keyword_init: true
)

# Request payload for Card#list.
#
# @!attribute [rw] artist
#   @return [String, nil]
#
# @!attribute [rw] border
#   @return [String, nil]
#
# @!attribute [rw] cmc
#   @return [Float, nil]
#
# @!attribute [rw] colorIdentity
#   @return [Array, nil]
#
# @!attribute [rw] colors
#   @return [Array, nil]
#
# @!attribute [rw] flavor
#   @return [String, nil]
#
# @!attribute [rw] foreignNames
#   @return [Array, nil]
#
# @!attribute [rw] hand
#   @return [Integer, nil]
#
# @!attribute [rw] id
#   @return [String, nil]
#
# @!attribute [rw] imageUrl
#   @return [String, nil]
#
# @!attribute [rw] layout
#   @return [String, nil]
#
# @!attribute [rw] legalities
#   @return [Array, nil]
#
# @!attribute [rw] life
#   @return [Integer, nil]
#
# @!attribute [rw] loyalty
#   @return [String, nil]
#
# @!attribute [rw] manaCost
#   @return [String, nil]
#
# @!attribute [rw] multiverseid
#   @return [Integer, nil]
#
# @!attribute [rw] name
#   @return [String, nil]
#
# @!attribute [rw] names
#   @return [Array, nil]
#
# @!attribute [rw] number
#   @return [String, nil]
#
# @!attribute [rw] originalText
#   @return [String, nil]
#
# @!attribute [rw] originalType
#   @return [String, nil]
#
# @!attribute [rw] power
#   @return [String, nil]
#
# @!attribute [rw] printings
#   @return [Array, nil]
#
# @!attribute [rw] rarity
#   @return [String, nil]
#
# @!attribute [rw] releaseDate
#   @return [String, nil]
#
# @!attribute [rw] reserved
#   @return [Boolean, nil]
#
# @!attribute [rw] rulings
#   @return [Array, nil]
#
# @!attribute [rw] set
#   @return [String, nil]
#
# @!attribute [rw] setName
#   @return [String, nil]
#
# @!attribute [rw] source
#   @return [String, nil]
#
# @!attribute [rw] starter
#   @return [Boolean, nil]
#
# @!attribute [rw] subtypes
#   @return [Array, nil]
#
# @!attribute [rw] supertypes
#   @return [Array, nil]
#
# @!attribute [rw] text
#   @return [String, nil]
#
# @!attribute [rw] timeshifted
#   @return [Boolean, nil]
#
# @!attribute [rw] toughness
#   @return [String, nil]
#
# @!attribute [rw] type
#   @return [String, nil]
#
# @!attribute [rw] types
#   @return [Array, nil]
#
# @!attribute [rw] variations
#   @return [Array, nil]
#
# @!attribute [rw] watermark
#   @return [String, nil]
CardListMatch = Struct.new(
  :artist,
  :border,
  :cmc,
  :colorIdentity,
  :colors,
  :flavor,
  :foreignNames,
  :hand,
  :id,
  :imageUrl,
  :layout,
  :legalities,
  :life,
  :loyalty,
  :manaCost,
  :multiverseid,
  :name,
  :names,
  :number,
  :originalText,
  :originalType,
  :power,
  :printings,
  :rarity,
  :releaseDate,
  :reserved,
  :rulings,
  :set,
  :setName,
  :source,
  :starter,
  :subtypes,
  :supertypes,
  :text,
  :timeshifted,
  :toughness,
  :type,
  :types,
  :variations,
  :watermark,
  keyword_init: true
)

# Format entity data model.
#
# @!attribute [rw] formats
#   @return [Array, nil]
Format = Struct.new(
  :formats,
  keyword_init: true
)

# Request payload for Format#list.
#
# @!attribute [rw] formats
#   @return [Array, nil]
FormatListMatch = Struct.new(
  :formats,
  keyword_init: true
)

# Set entity data model.
#
# @!attribute [rw] block
#   @return [String, nil]
#
# @!attribute [rw] booster
#   @return [Array, nil]
#
# @!attribute [rw] border
#   @return [String, nil]
#
# @!attribute [rw] code
#   @return [String, nil]
#
# @!attribute [rw] gathererCode
#   @return [String, nil]
#
# @!attribute [rw] magicCardsInfoCode
#   @return [String, nil]
#
# @!attribute [rw] mkm_id
#   @return [Integer, nil]
#
# @!attribute [rw] mkm_name
#   @return [String, nil]
#
# @!attribute [rw] name
#   @return [String, nil]
#
# @!attribute [rw] onlineOnly
#   @return [Boolean, nil]
#
# @!attribute [rw] releaseDate
#   @return [String, nil]
#
# @!attribute [rw] type
#   @return [String, nil]
SetType = Struct.new(
  :block,
  :booster,
  :border,
  :code,
  :gathererCode,
  :magicCardsInfoCode,
  :mkm_id,
  :mkm_name,
  :name,
  :onlineOnly,
  :releaseDate,
  :type,
  keyword_init: true
)

# Request payload for Set#load.
#
# @!attribute [rw] id
#   @return [String]
SetLoadMatch = Struct.new(
  :id,
  keyword_init: true
)

# Request payload for Set#list.
#
# @!attribute [rw] block
#   @return [String, nil]
#
# @!attribute [rw] booster
#   @return [Array, nil]
#
# @!attribute [rw] border
#   @return [String, nil]
#
# @!attribute [rw] code
#   @return [String, nil]
#
# @!attribute [rw] gathererCode
#   @return [String, nil]
#
# @!attribute [rw] magicCardsInfoCode
#   @return [String, nil]
#
# @!attribute [rw] mkm_id
#   @return [Integer, nil]
#
# @!attribute [rw] mkm_name
#   @return [String, nil]
#
# @!attribute [rw] name
#   @return [String, nil]
#
# @!attribute [rw] onlineOnly
#   @return [Boolean, nil]
#
# @!attribute [rw] releaseDate
#   @return [String, nil]
#
# @!attribute [rw] type
#   @return [String, nil]
SetListMatch = Struct.new(
  :block,
  :booster,
  :border,
  :code,
  :gathererCode,
  :magicCardsInfoCode,
  :mkm_id,
  :mkm_name,
  :name,
  :onlineOnly,
  :releaseDate,
  :type,
  keyword_init: true
)

# SetBooster entity data model.
#
# @!attribute [rw] artist
#   @return [String, nil]
#
# @!attribute [rw] border
#   @return [String, nil]
#
# @!attribute [rw] cmc
#   @return [Float, nil]
#
# @!attribute [rw] colorIdentity
#   @return [Array, nil]
#
# @!attribute [rw] colors
#   @return [Array, nil]
#
# @!attribute [rw] flavor
#   @return [String, nil]
#
# @!attribute [rw] foreignNames
#   @return [Array, nil]
#
# @!attribute [rw] hand
#   @return [Integer, nil]
#
# @!attribute [rw] id
#   @return [String, nil]
#
# @!attribute [rw] imageUrl
#   @return [String, nil]
#
# @!attribute [rw] layout
#   @return [String, nil]
#
# @!attribute [rw] legalities
#   @return [Array, nil]
#
# @!attribute [rw] life
#   @return [Integer, nil]
#
# @!attribute [rw] loyalty
#   @return [String, nil]
#
# @!attribute [rw] manaCost
#   @return [String, nil]
#
# @!attribute [rw] multiverseid
#   @return [Integer, nil]
#
# @!attribute [rw] name
#   @return [String, nil]
#
# @!attribute [rw] names
#   @return [Array, nil]
#
# @!attribute [rw] number
#   @return [String, nil]
#
# @!attribute [rw] originalText
#   @return [String, nil]
#
# @!attribute [rw] originalType
#   @return [String, nil]
#
# @!attribute [rw] power
#   @return [String, nil]
#
# @!attribute [rw] printings
#   @return [Array, nil]
#
# @!attribute [rw] rarity
#   @return [String, nil]
#
# @!attribute [rw] releaseDate
#   @return [String, nil]
#
# @!attribute [rw] reserved
#   @return [Boolean, nil]
#
# @!attribute [rw] rulings
#   @return [Array, nil]
#
# @!attribute [rw] set
#   @return [String, nil]
#
# @!attribute [rw] setName
#   @return [String, nil]
#
# @!attribute [rw] source
#   @return [String, nil]
#
# @!attribute [rw] starter
#   @return [Boolean, nil]
#
# @!attribute [rw] subtypes
#   @return [Array, nil]
#
# @!attribute [rw] supertypes
#   @return [Array, nil]
#
# @!attribute [rw] text
#   @return [String, nil]
#
# @!attribute [rw] timeshifted
#   @return [Boolean, nil]
#
# @!attribute [rw] toughness
#   @return [String, nil]
#
# @!attribute [rw] type
#   @return [String, nil]
#
# @!attribute [rw] types
#   @return [Array, nil]
#
# @!attribute [rw] variations
#   @return [Array, nil]
#
# @!attribute [rw] watermark
#   @return [String, nil]
SetBooster = Struct.new(
  :artist,
  :border,
  :cmc,
  :colorIdentity,
  :colors,
  :flavor,
  :foreignNames,
  :hand,
  :id,
  :imageUrl,
  :layout,
  :legalities,
  :life,
  :loyalty,
  :manaCost,
  :multiverseid,
  :name,
  :names,
  :number,
  :originalText,
  :originalType,
  :power,
  :printings,
  :rarity,
  :releaseDate,
  :reserved,
  :rulings,
  :set,
  :setName,
  :source,
  :starter,
  :subtypes,
  :supertypes,
  :text,
  :timeshifted,
  :toughness,
  :type,
  :types,
  :variations,
  :watermark,
  keyword_init: true
)

# Request payload for SetBooster#list.
#
# @!attribute [rw] id
#   @return [String]
SetBoosterListMatch = Struct.new(
  :id,
  keyword_init: true
)

# Subtype entity data model.
#
# @!attribute [rw] subtypes
#   @return [Array, nil]
Subtype = Struct.new(
  :subtypes,
  keyword_init: true
)

# Request payload for Subtype#list.
#
# @!attribute [rw] subtypes
#   @return [Array, nil]
SubtypeListMatch = Struct.new(
  :subtypes,
  keyword_init: true
)

# Supertype entity data model.
#
# @!attribute [rw] supertypes
#   @return [Array, nil]
Supertype = Struct.new(
  :supertypes,
  keyword_init: true
)

# Request payload for Supertype#list.
#
# @!attribute [rw] supertypes
#   @return [Array, nil]
SupertypeListMatch = Struct.new(
  :supertypes,
  keyword_init: true
)

# Type entity data model.
#
# @!attribute [rw] types
#   @return [Array, nil]
Type = Struct.new(
  :types,
  keyword_init: true
)

# Request payload for Type#list.
#
# @!attribute [rw] types
#   @return [Array, nil]
TypeListMatch = Struct.new(
  :types,
  keyword_init: true
)

