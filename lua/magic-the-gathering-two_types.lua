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
---@field card? table
---@field cmc? number
---@field color? table
---@field color_identity? table
---@field flavor? string
---@field foreign_name? table
---@field hand? number
---@field id? string
---@field image_url? string
---@field layout? string
---@field legality? table
---@field life? number
---@field loyalty? string
---@field mana_cost? string
---@field multiverseid? number
---@field name? string
---@field number? string
---@field original_text? string
---@field original_type? string
---@field power? string
---@field printing? table
---@field rarity? string
---@field release_date? string
---@field reserved? boolean
---@field ruling? table
---@field set? string
---@field set_name? string
---@field source? string
---@field starter? boolean
---@field subtype? table
---@field supertype? table
---@field text? string
---@field timeshifted? boolean
---@field toughness? string
---@field type? string
---@field variation? table
---@field watermark? string

---@class CardLoadMatch
---@field id string

---@class CardListMatch
---@field artist? string
---@field border? string
---@field card? table
---@field cmc? number
---@field color? table
---@field color_identity? table
---@field flavor? string
---@field foreign_name? table
---@field hand? number
---@field id? string
---@field image_url? string
---@field layout? string
---@field legality? table
---@field life? number
---@field loyalty? string
---@field mana_cost? string
---@field multiverseid? number
---@field name? string
---@field number? string
---@field original_text? string
---@field original_type? string
---@field power? string
---@field printing? table
---@field rarity? string
---@field release_date? string
---@field reserved? boolean
---@field ruling? table
---@field set? string
---@field set_name? string
---@field source? string
---@field starter? boolean
---@field subtype? table
---@field supertype? table
---@field text? string
---@field timeshifted? boolean
---@field toughness? string
---@field type? string
---@field variation? table
---@field watermark? string

---@class Format
---@field format? table

---@class FormatListMatch
---@field format? table

---@class Set
---@field block? string
---@field booster? table
---@field border? string
---@field code? string
---@field gatherer_code? string
---@field magic_cards_info_code? string
---@field mkm_id? number
---@field mkm_name? string
---@field name? string
---@field online_only? boolean
---@field release_date? string
---@field set? table
---@field type? string

---@class SetLoadMatch
---@field id string

---@class SetListMatch
---@field block? string
---@field booster? table
---@field border? string
---@field code? string
---@field gatherer_code? string
---@field magic_cards_info_code? string
---@field mkm_id? number
---@field mkm_name? string
---@field name? string
---@field online_only? boolean
---@field release_date? string
---@field set? table
---@field type? string

---@class SetBooster
---@field artist? string
---@field border? string
---@field cmc? number
---@field color? table
---@field color_identity? table
---@field flavor? string
---@field foreign_name? table
---@field hand? number
---@field id? string
---@field image_url? string
---@field layout? string
---@field legality? table
---@field life? number
---@field loyalty? string
---@field mana_cost? string
---@field multiverseid? number
---@field name? string
---@field number? string
---@field original_text? string
---@field original_type? string
---@field power? string
---@field printing? table
---@field rarity? string
---@field release_date? string
---@field reserved? boolean
---@field ruling? table
---@field set? string
---@field set_name? string
---@field source? string
---@field starter? boolean
---@field subtype? table
---@field supertype? table
---@field text? string
---@field timeshifted? boolean
---@field toughness? string
---@field type? string
---@field variation? table
---@field watermark? string

---@class SetBoosterListMatch
---@field id string

---@class Subtype
---@field subtype? table

---@class SubtypeListMatch
---@field subtype? table

---@class Supertype
---@field supertype? table

---@class SupertypeListMatch
---@field supertype? table

---@class Type
---@field type? table

---@class TypeListMatch
---@field type? table

local M = {}

return M
