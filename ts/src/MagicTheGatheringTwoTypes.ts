// Typed models for the MagicTheGatheringTwo SDK.
//
// GENERATED from the API model: main.kit.entity.<e>.fields[] and per-op
// params (op.<name>.points[].args.params[]). Field/param types come from the
// canonical type sentinels via @voxgig/sdkgen canonToType (source of truth:
// @voxgig/apidef VALID_CANON). Do not edit by hand.

export interface Card {
  artist?: string
  border?: string
  cmc?: number
  colorIdentity?: any[]
  colors?: any[]
  flavor?: string
  foreignNames?: any[]
  hand?: number
  id?: string
  imageUrl?: string
  layout?: string
  legalities?: any[]
  life?: number
  loyalty?: string
  manaCost?: string
  multiverseid?: number
  name?: string
  names?: any[]
  number?: string
  originalText?: string
  originalType?: string
  power?: string
  printings?: any[]
  rarity?: string
  releaseDate?: string
  reserved?: boolean
  rulings?: any[]
  set?: string
  setName?: string
  source?: string
  starter?: boolean
  subtypes?: any[]
  supertypes?: any[]
  text?: string
  timeshifted?: boolean
  toughness?: string
  type?: string
  types?: any[]
  variations?: any[]
  watermark?: string
}

export interface CardLoadMatch {
  id: string
}

export interface CardListMatch {
  artist?: string
  border?: string
  cmc?: number
  colorIdentity?: any[]
  colors?: any[]
  flavor?: string
  foreignNames?: any[]
  hand?: number
  id?: string
  imageUrl?: string
  layout?: string
  legalities?: any[]
  life?: number
  loyalty?: string
  manaCost?: string
  multiverseid?: number
  name?: string
  names?: any[]
  number?: string
  originalText?: string
  originalType?: string
  power?: string
  printings?: any[]
  rarity?: string
  releaseDate?: string
  reserved?: boolean
  rulings?: any[]
  set?: string
  setName?: string
  source?: string
  starter?: boolean
  subtypes?: any[]
  supertypes?: any[]
  text?: string
  timeshifted?: boolean
  toughness?: string
  type?: string
  types?: any[]
  variations?: any[]
  watermark?: string
}

export interface Format {
  formats?: any[]
}

export interface FormatListMatch {
  formats?: any[]
}

export interface Set {
  block?: string
  booster?: any[]
  border?: string
  code?: string
  gathererCode?: string
  magicCardsInfoCode?: string
  mkm_id?: number
  mkm_name?: string
  name?: string
  onlineOnly?: boolean
  releaseDate?: string
  type?: string
}

export interface SetLoadMatch {
  id: string
}

export interface SetListMatch {
  block?: string
  booster?: any[]
  border?: string
  code?: string
  gathererCode?: string
  magicCardsInfoCode?: string
  mkm_id?: number
  mkm_name?: string
  name?: string
  onlineOnly?: boolean
  releaseDate?: string
  type?: string
}

export interface SetBooster {
  artist?: string
  border?: string
  cmc?: number
  colorIdentity?: any[]
  colors?: any[]
  flavor?: string
  foreignNames?: any[]
  hand?: number
  id?: string
  imageUrl?: string
  layout?: string
  legalities?: any[]
  life?: number
  loyalty?: string
  manaCost?: string
  multiverseid?: number
  name?: string
  names?: any[]
  number?: string
  originalText?: string
  originalType?: string
  power?: string
  printings?: any[]
  rarity?: string
  releaseDate?: string
  reserved?: boolean
  rulings?: any[]
  set?: string
  setName?: string
  source?: string
  starter?: boolean
  subtypes?: any[]
  supertypes?: any[]
  text?: string
  timeshifted?: boolean
  toughness?: string
  type?: string
  types?: any[]
  variations?: any[]
  watermark?: string
}

export interface SetBoosterListMatch {
  id: string
}

export interface Subtype {
  subtypes?: any[]
}

export interface SubtypeListMatch {
  subtypes?: any[]
}

export interface Supertype {
  supertypes?: any[]
}

export interface SupertypeListMatch {
  supertypes?: any[]
}

export interface Type {
  types?: any[]
}

export interface TypeListMatch {
  types?: any[]
}

