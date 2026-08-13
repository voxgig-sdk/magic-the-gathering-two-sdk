# Typed models for the MagicTheGatheringTwo SDK.
#
# GENERATED from the API model: main.kit.entity.<e>.fields[] and per-op
# params (op.<name>.points[].args.params[]). Field/param types come from the
# canonical type sentinels via @voxgig/sdkgen canonToType (source of truth:
# @voxgig/apidef VALID_CANON). Do not edit by hand.
#
# These are TypedDicts, not dataclasses: the SDK ops return/accept plain dicts
# at runtime, and a TypedDict IS a dict shape, so the types match the runtime.
# Optional (req:false) keys are modelled as TypedDict key-optionality
# (total=False), split into a required base + total=False subclass when a type
# has both required and optional keys.

from __future__ import annotations

from typing import TypedDict, Any


class Card(TypedDict, total=False):
    artist: str
    border: str
    cmc: float
    colorIdentity: list
    colors: list
    flavor: str
    foreignNames: list
    hand: int
    id: str
    imageUrl: str
    layout: str
    legalities: list
    life: int
    loyalty: str
    manaCost: str
    multiverseid: int
    name: str
    names: list
    number: str
    originalText: str
    originalType: str
    power: str
    printings: list
    rarity: str
    releaseDate: str
    reserved: bool
    rulings: list
    set: str
    setName: str
    source: str
    starter: bool
    subtypes: list
    supertypes: list
    text: str
    timeshifted: bool
    toughness: str
    type: str
    types: list
    variations: list
    watermark: str


class CardLoadMatch(TypedDict):
    id: str


class CardListMatch(TypedDict, total=False):
    artist: str
    border: str
    cmc: float
    colorIdentity: list
    colors: list
    flavor: str
    foreignNames: list
    hand: int
    id: str
    imageUrl: str
    layout: str
    legalities: list
    life: int
    loyalty: str
    manaCost: str
    multiverseid: int
    name: str
    names: list
    number: str
    originalText: str
    originalType: str
    power: str
    printings: list
    rarity: str
    releaseDate: str
    reserved: bool
    rulings: list
    set: str
    setName: str
    source: str
    starter: bool
    subtypes: list
    supertypes: list
    text: str
    timeshifted: bool
    toughness: str
    type: str
    types: list
    variations: list
    watermark: str


class Format(TypedDict, total=False):
    formats: list


class FormatListMatch(TypedDict, total=False):
    formats: list


class Set(TypedDict, total=False):
    block: str
    booster: list
    border: str
    code: str
    gathererCode: str
    magicCardsInfoCode: str
    mkm_id: int
    mkm_name: str
    name: str
    onlineOnly: bool
    releaseDate: str
    type: str


class SetLoadMatch(TypedDict):
    id: str


class SetListMatch(TypedDict, total=False):
    block: str
    booster: list
    border: str
    code: str
    gathererCode: str
    magicCardsInfoCode: str
    mkm_id: int
    mkm_name: str
    name: str
    onlineOnly: bool
    releaseDate: str
    type: str


class SetBooster(TypedDict, total=False):
    artist: str
    border: str
    cmc: float
    colorIdentity: list
    colors: list
    flavor: str
    foreignNames: list
    hand: int
    id: str
    imageUrl: str
    layout: str
    legalities: list
    life: int
    loyalty: str
    manaCost: str
    multiverseid: int
    name: str
    names: list
    number: str
    originalText: str
    originalType: str
    power: str
    printings: list
    rarity: str
    releaseDate: str
    reserved: bool
    rulings: list
    set: str
    setName: str
    source: str
    starter: bool
    subtypes: list
    supertypes: list
    text: str
    timeshifted: bool
    toughness: str
    type: str
    types: list
    variations: list
    watermark: str


class SetBoosterListMatch(TypedDict):
    id: str


class Subtype(TypedDict, total=False):
    subtypes: list


class SubtypeListMatch(TypedDict, total=False):
    subtypes: list


class Supertype(TypedDict, total=False):
    supertypes: list


class SupertypeListMatch(TypedDict, total=False):
    supertypes: list


class Type(TypedDict, total=False):
    types: list


class TypeListMatch(TypedDict, total=False):
    types: list
