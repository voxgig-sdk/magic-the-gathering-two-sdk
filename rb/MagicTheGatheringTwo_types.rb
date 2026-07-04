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
# @!attribute [rw] card
#   @return [Hash, nil]
#
# @!attribute [rw] cmc
#   @return [Float, nil]
#
# @!attribute [rw] color
#   @return [Array, nil]
#
# @!attribute [rw] color_identity
#   @return [Array, nil]
#
# @!attribute [rw] flavor
#   @return [String, nil]
#
# @!attribute [rw] foreign_name
#   @return [Array, nil]
#
# @!attribute [rw] hand
#   @return [Integer, nil]
#
# @!attribute [rw] id
#   @return [String, nil]
#
# @!attribute [rw] image_url
#   @return [String, nil]
#
# @!attribute [rw] layout
#   @return [String, nil]
#
# @!attribute [rw] legality
#   @return [Array, nil]
#
# @!attribute [rw] life
#   @return [Integer, nil]
#
# @!attribute [rw] loyalty
#   @return [String, nil]
#
# @!attribute [rw] mana_cost
#   @return [String, nil]
#
# @!attribute [rw] multiverseid
#   @return [Integer, nil]
#
# @!attribute [rw] name
#   @return [String, nil]
#
# @!attribute [rw] number
#   @return [String, nil]
#
# @!attribute [rw] original_text
#   @return [String, nil]
#
# @!attribute [rw] original_type
#   @return [String, nil]
#
# @!attribute [rw] power
#   @return [String, nil]
#
# @!attribute [rw] printing
#   @return [Array, nil]
#
# @!attribute [rw] rarity
#   @return [String, nil]
#
# @!attribute [rw] release_date
#   @return [String, nil]
#
# @!attribute [rw] reserved
#   @return [Boolean, nil]
#
# @!attribute [rw] ruling
#   @return [Array, nil]
#
# @!attribute [rw] set
#   @return [String, nil]
#
# @!attribute [rw] set_name
#   @return [String, nil]
#
# @!attribute [rw] source
#   @return [String, nil]
#
# @!attribute [rw] starter
#   @return [Boolean, nil]
#
# @!attribute [rw] subtype
#   @return [Array, nil]
#
# @!attribute [rw] supertype
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
# @!attribute [rw] variation
#   @return [Array, nil]
#
# @!attribute [rw] watermark
#   @return [String, nil]
Card = Struct.new(
  :artist,
  :border,
  :card,
  :cmc,
  :color,
  :color_identity,
  :flavor,
  :foreign_name,
  :hand,
  :id,
  :image_url,
  :layout,
  :legality,
  :life,
  :loyalty,
  :mana_cost,
  :multiverseid,
  :name,
  :number,
  :original_text,
  :original_type,
  :power,
  :printing,
  :rarity,
  :release_date,
  :reserved,
  :ruling,
  :set,
  :set_name,
  :source,
  :starter,
  :subtype,
  :supertype,
  :text,
  :timeshifted,
  :toughness,
  :type,
  :variation,
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

# Match filter for Card#list (any subset of Card fields).
#
# @!attribute [rw] artist
#   @return [String, nil]
#
# @!attribute [rw] border
#   @return [String, nil]
#
# @!attribute [rw] card
#   @return [Hash, nil]
#
# @!attribute [rw] cmc
#   @return [Float, nil]
#
# @!attribute [rw] color
#   @return [Array, nil]
#
# @!attribute [rw] color_identity
#   @return [Array, nil]
#
# @!attribute [rw] flavor
#   @return [String, nil]
#
# @!attribute [rw] foreign_name
#   @return [Array, nil]
#
# @!attribute [rw] hand
#   @return [Integer, nil]
#
# @!attribute [rw] id
#   @return [String, nil]
#
# @!attribute [rw] image_url
#   @return [String, nil]
#
# @!attribute [rw] layout
#   @return [String, nil]
#
# @!attribute [rw] legality
#   @return [Array, nil]
#
# @!attribute [rw] life
#   @return [Integer, nil]
#
# @!attribute [rw] loyalty
#   @return [String, nil]
#
# @!attribute [rw] mana_cost
#   @return [String, nil]
#
# @!attribute [rw] multiverseid
#   @return [Integer, nil]
#
# @!attribute [rw] name
#   @return [String, nil]
#
# @!attribute [rw] number
#   @return [String, nil]
#
# @!attribute [rw] original_text
#   @return [String, nil]
#
# @!attribute [rw] original_type
#   @return [String, nil]
#
# @!attribute [rw] power
#   @return [String, nil]
#
# @!attribute [rw] printing
#   @return [Array, nil]
#
# @!attribute [rw] rarity
#   @return [String, nil]
#
# @!attribute [rw] release_date
#   @return [String, nil]
#
# @!attribute [rw] reserved
#   @return [Boolean, nil]
#
# @!attribute [rw] ruling
#   @return [Array, nil]
#
# @!attribute [rw] set
#   @return [String, nil]
#
# @!attribute [rw] set_name
#   @return [String, nil]
#
# @!attribute [rw] source
#   @return [String, nil]
#
# @!attribute [rw] starter
#   @return [Boolean, nil]
#
# @!attribute [rw] subtype
#   @return [Array, nil]
#
# @!attribute [rw] supertype
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
# @!attribute [rw] variation
#   @return [Array, nil]
#
# @!attribute [rw] watermark
#   @return [String, nil]
CardListMatch = Struct.new(
  :artist,
  :border,
  :card,
  :cmc,
  :color,
  :color_identity,
  :flavor,
  :foreign_name,
  :hand,
  :id,
  :image_url,
  :layout,
  :legality,
  :life,
  :loyalty,
  :mana_cost,
  :multiverseid,
  :name,
  :number,
  :original_text,
  :original_type,
  :power,
  :printing,
  :rarity,
  :release_date,
  :reserved,
  :ruling,
  :set,
  :set_name,
  :source,
  :starter,
  :subtype,
  :supertype,
  :text,
  :timeshifted,
  :toughness,
  :type,
  :variation,
  :watermark,
  keyword_init: true
)

# Format entity data model.
#
# @!attribute [rw] format
#   @return [Array, nil]
Format = Struct.new(
  :format,
  keyword_init: true
)

# Match filter for Format#list (any subset of Format fields).
#
# @!attribute [rw] format
#   @return [Array, nil]
FormatListMatch = Struct.new(
  :format,
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
# @!attribute [rw] gatherer_code
#   @return [String, nil]
#
# @!attribute [rw] magic_cards_info_code
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
# @!attribute [rw] online_only
#   @return [Boolean, nil]
#
# @!attribute [rw] release_date
#   @return [String, nil]
#
# @!attribute [rw] set
#   @return [Hash, nil]
#
# @!attribute [rw] type
#   @return [String, nil]
Set = Struct.new(
  :block,
  :booster,
  :border,
  :code,
  :gatherer_code,
  :magic_cards_info_code,
  :mkm_id,
  :mkm_name,
  :name,
  :online_only,
  :release_date,
  :set,
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

# Match filter for Set#list (any subset of Set fields).
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
# @!attribute [rw] gatherer_code
#   @return [String, nil]
#
# @!attribute [rw] magic_cards_info_code
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
# @!attribute [rw] online_only
#   @return [Boolean, nil]
#
# @!attribute [rw] release_date
#   @return [String, nil]
#
# @!attribute [rw] set
#   @return [Hash, nil]
#
# @!attribute [rw] type
#   @return [String, nil]
SetListMatch = Struct.new(
  :block,
  :booster,
  :border,
  :code,
  :gatherer_code,
  :magic_cards_info_code,
  :mkm_id,
  :mkm_name,
  :name,
  :online_only,
  :release_date,
  :set,
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
# @!attribute [rw] color
#   @return [Array, nil]
#
# @!attribute [rw] color_identity
#   @return [Array, nil]
#
# @!attribute [rw] flavor
#   @return [String, nil]
#
# @!attribute [rw] foreign_name
#   @return [Array, nil]
#
# @!attribute [rw] hand
#   @return [Integer, nil]
#
# @!attribute [rw] id
#   @return [String, nil]
#
# @!attribute [rw] image_url
#   @return [String, nil]
#
# @!attribute [rw] layout
#   @return [String, nil]
#
# @!attribute [rw] legality
#   @return [Array, nil]
#
# @!attribute [rw] life
#   @return [Integer, nil]
#
# @!attribute [rw] loyalty
#   @return [String, nil]
#
# @!attribute [rw] mana_cost
#   @return [String, nil]
#
# @!attribute [rw] multiverseid
#   @return [Integer, nil]
#
# @!attribute [rw] name
#   @return [String, nil]
#
# @!attribute [rw] number
#   @return [String, nil]
#
# @!attribute [rw] original_text
#   @return [String, nil]
#
# @!attribute [rw] original_type
#   @return [String, nil]
#
# @!attribute [rw] power
#   @return [String, nil]
#
# @!attribute [rw] printing
#   @return [Array, nil]
#
# @!attribute [rw] rarity
#   @return [String, nil]
#
# @!attribute [rw] release_date
#   @return [String, nil]
#
# @!attribute [rw] reserved
#   @return [Boolean, nil]
#
# @!attribute [rw] ruling
#   @return [Array, nil]
#
# @!attribute [rw] set
#   @return [String, nil]
#
# @!attribute [rw] set_name
#   @return [String, nil]
#
# @!attribute [rw] source
#   @return [String, nil]
#
# @!attribute [rw] starter
#   @return [Boolean, nil]
#
# @!attribute [rw] subtype
#   @return [Array, nil]
#
# @!attribute [rw] supertype
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
# @!attribute [rw] variation
#   @return [Array, nil]
#
# @!attribute [rw] watermark
#   @return [String, nil]
SetBooster = Struct.new(
  :artist,
  :border,
  :cmc,
  :color,
  :color_identity,
  :flavor,
  :foreign_name,
  :hand,
  :id,
  :image_url,
  :layout,
  :legality,
  :life,
  :loyalty,
  :mana_cost,
  :multiverseid,
  :name,
  :number,
  :original_text,
  :original_type,
  :power,
  :printing,
  :rarity,
  :release_date,
  :reserved,
  :ruling,
  :set,
  :set_name,
  :source,
  :starter,
  :subtype,
  :supertype,
  :text,
  :timeshifted,
  :toughness,
  :type,
  :variation,
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
# @!attribute [rw] subtype
#   @return [Array, nil]
Subtype = Struct.new(
  :subtype,
  keyword_init: true
)

# Match filter for Subtype#list (any subset of Subtype fields).
#
# @!attribute [rw] subtype
#   @return [Array, nil]
SubtypeListMatch = Struct.new(
  :subtype,
  keyword_init: true
)

# Supertype entity data model.
#
# @!attribute [rw] supertype
#   @return [Array, nil]
Supertype = Struct.new(
  :supertype,
  keyword_init: true
)

# Match filter for Supertype#list (any subset of Supertype fields).
#
# @!attribute [rw] supertype
#   @return [Array, nil]
SupertypeListMatch = Struct.new(
  :supertype,
  keyword_init: true
)

# Type entity data model.
#
# @!attribute [rw] type
#   @return [Array, nil]
Type = Struct.new(
  :type,
  keyword_init: true
)

# Match filter for Type#list (any subset of Type fields).
#
# @!attribute [rw] type
#   @return [Array, nil]
TypeListMatch = Struct.new(
  :type,
  keyword_init: true
)

