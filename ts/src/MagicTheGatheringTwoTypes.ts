// Typed models for the MagicTheGatheringTwo SDK.
//
// GENERATED from the API model: main.kit.entity.<e>.fields[] and per-op
// params (op.<name>.points[].args.params[]). Field/param types come from the
// canonical type sentinels via @voxgig/sdkgen canonToType (source of truth:
// @voxgig/apidef VALID_CANON). Do not edit by hand.

export interface Card {
  artist?: string
  border?: string
  card?: Record<string, any>
  cmc?: number
  color?: any[]
  color_identity?: any[]
  flavor?: string
  foreign_name?: any[]
  hand?: number
  id?: string
  image_url?: string
  layout?: string
  legality?: any[]
  life?: number
  loyalty?: string
  mana_cost?: string
  multiverseid?: number
  name?: string
  number?: string
  original_text?: string
  original_type?: string
  power?: string
  printing?: any[]
  rarity?: string
  release_date?: string
  reserved?: boolean
  ruling?: any[]
  set?: string
  set_name?: string
  source?: string
  starter?: boolean
  subtype?: any[]
  supertype?: any[]
  text?: string
  timeshifted?: boolean
  toughness?: string
  type?: string
  variation?: any[]
  watermark?: string
}

export interface CardLoadMatch {
  id: string
}

export type CardListMatch = Partial<Card>

export interface Format {
  format?: any[]
}

export type FormatListMatch = Partial<Format>

export interface Set {
  block?: string
  booster?: any[]
  border?: string
  code?: string
  gatherer_code?: string
  magic_cards_info_code?: string
  mkm_id?: number
  mkm_name?: string
  name?: string
  online_only?: boolean
  release_date?: string
  set?: Record<string, any>
  type?: string
}

export interface SetLoadMatch {
  id: string
}

export type SetListMatch = Partial<Set>

export interface SetBooster {
  artist?: string
  border?: string
  cmc?: number
  color?: any[]
  color_identity?: any[]
  flavor?: string
  foreign_name?: any[]
  hand?: number
  id?: string
  image_url?: string
  layout?: string
  legality?: any[]
  life?: number
  loyalty?: string
  mana_cost?: string
  multiverseid?: number
  name?: string
  number?: string
  original_text?: string
  original_type?: string
  power?: string
  printing?: any[]
  rarity?: string
  release_date?: string
  reserved?: boolean
  ruling?: any[]
  set?: string
  set_name?: string
  source?: string
  starter?: boolean
  subtype?: any[]
  supertype?: any[]
  text?: string
  timeshifted?: boolean
  toughness?: string
  type?: string
  variation?: any[]
  watermark?: string
}

export interface SetBoosterListMatch {
  id: string
}

export interface Subtype {
  subtype?: any[]
}

export type SubtypeListMatch = Partial<Subtype>

export interface Supertype {
  supertype?: any[]
}

export type SupertypeListMatch = Partial<Supertype>

export interface Type {
  type?: any[]
}

export type TypeListMatch = Partial<Type>

