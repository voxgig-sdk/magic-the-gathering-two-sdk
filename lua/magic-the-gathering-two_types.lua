-- Typed models for the MagicTheGatheringTwo SDK (LuaLS annotations).
--
-- GENERATED from the API model: main.kit.entity.<e>.fields[] and per-op
-- params (op.<name>.points[].args.params[]). Field/param types come from the
-- canonical type sentinels via @voxgig/sdkgen canonToType (source of truth:
-- @voxgig/apidef VALID_CANON). Annotations only — no runtime effect. Do not
-- edit by hand.

---@class Card
---@field artist? string
---@field border? string
---@field cmc? number
---@field colorIdentity? table
---@field colors? table
---@field flavor? string
---@field foreignNames? table
---@field hand? number
---@field id? string
---@field imageUrl? string
---@field layout? string
---@field legalities? table
---@field life? number
---@field loyalty? string
---@field manaCost? string
---@field multiverseid? number
---@field name? string
---@field names? table
---@field number? string
---@field originalText? string
---@field originalType? string
---@field power? string
---@field printings? table
---@field rarity? string
---@field releaseDate? string
---@field reserved? boolean
---@field rulings? table
---@field set? string
---@field setName? string
---@field source? string
---@field starter? boolean
---@field subtypes? table
---@field supertypes? table
---@field text? string
---@field timeshifted? boolean
---@field toughness? string
---@field type? string
---@field types? table
---@field variations? table
---@field watermark? string

---@class CardLoadMatch
---@field id string

---@class CardListMatch
---@field artist? string
---@field cmc? number
---@field color? string
---@field color_identity? string
---@field contain? string
---@field flavor? string
---@field game_format? string
---@field id? string
---@field language? string
---@field layout? string
---@field legality? string
---@field loyalty? string
---@field multiverseid? number
---@field name? string
---@field number? string
---@field order_by? string
---@field page? number
---@field page_size? number
---@field power? string
---@field random? boolean
---@field rarity? string
---@field set? string
---@field set_name? string
---@field subtype? string
---@field supertype? string
---@field text? string
---@field toughness? string
---@field type? string

---@class Format
---@field formats? table

---@class FormatListMatch
---@field formats? table

---@class Set
---@field block? string
---@field booster? table
---@field border? string
---@field code? string
---@field gathererCode? string
---@field id? string
---@field magicCardsInfoCode? string
---@field mkm_id? number
---@field mkm_name? string
---@field name? string
---@field onlineOnly? boolean
---@field releaseDate? string
---@field type? string

---@class SetLoadMatch
---@field id string

---@class SetListMatch
---@field block? string
---@field name? string

---@class SetBooster
---@field artist? string
---@field border? string
---@field cmc? number
---@field colorIdentity? table
---@field colors? table
---@field flavor? string
---@field foreignNames? table
---@field hand? number
---@field id? string
---@field imageUrl? string
---@field layout? string
---@field legalities? table
---@field life? number
---@field loyalty? string
---@field manaCost? string
---@field multiverseid? number
---@field name? string
---@field names? table
---@field number? string
---@field originalText? string
---@field originalType? string
---@field power? string
---@field printings? table
---@field rarity? string
---@field releaseDate? string
---@field reserved? boolean
---@field rulings? table
---@field set? string
---@field setName? string
---@field source? string
---@field starter? boolean
---@field subtypes? table
---@field supertypes? table
---@field text? string
---@field timeshifted? boolean
---@field toughness? string
---@field type? string
---@field types? table
---@field variations? table
---@field watermark? string

---@class SetBoosterListMatch
---@field id string

---@class Subtype
---@field subtypes? table

---@class SubtypeListMatch
---@field subtypes? table

---@class Supertype
---@field supertypes? table

---@class SupertypeListMatch
---@field supertypes? table

---@class Type
---@field types? table

---@class TypeListMatch
---@field types? table

local M = {}

return M
