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
    card: dict
    cmc: float
    color: list
    color_identity: list
    flavor: str
    foreign_name: list
    hand: int
    id: str
    image_url: str
    layout: str
    legality: list
    life: int
    loyalty: str
    mana_cost: str
    multiverseid: int
    name: str
    number: str
    original_text: str
    original_type: str
    power: str
    printing: list
    rarity: str
    release_date: str
    reserved: bool
    ruling: list
    set: str
    set_name: str
    source: str
    starter: bool
    subtype: list
    supertype: list
    text: str
    timeshifted: bool
    toughness: str
    type: str
    variation: list
    watermark: str


class CardLoadMatch(TypedDict):
    id: str


class CardListMatch(TypedDict, total=False):
    artist: str
    border: str
    card: dict
    cmc: float
    color: list
    color_identity: list
    flavor: str
    foreign_name: list
    hand: int
    id: str
    image_url: str
    layout: str
    legality: list
    life: int
    loyalty: str
    mana_cost: str
    multiverseid: int
    name: str
    number: str
    original_text: str
    original_type: str
    power: str
    printing: list
    rarity: str
    release_date: str
    reserved: bool
    ruling: list
    set: str
    set_name: str
    source: str
    starter: bool
    subtype: list
    supertype: list
    text: str
    timeshifted: bool
    toughness: str
    type: str
    variation: list
    watermark: str


class Format(TypedDict, total=False):
    format: list


class FormatListMatch(TypedDict, total=False):
    format: list


class Set(TypedDict, total=False):
    block: str
    booster: list
    border: str
    code: str
    gatherer_code: str
    magic_cards_info_code: str
    mkm_id: int
    mkm_name: str
    name: str
    online_only: bool
    release_date: str
    set: dict
    type: str


class SetLoadMatch(TypedDict):
    id: str


class SetListMatch(TypedDict, total=False):
    block: str
    booster: list
    border: str
    code: str
    gatherer_code: str
    magic_cards_info_code: str
    mkm_id: int
    mkm_name: str
    name: str
    online_only: bool
    release_date: str
    set: dict
    type: str


class SetBooster(TypedDict, total=False):
    artist: str
    border: str
    cmc: float
    color: list
    color_identity: list
    flavor: str
    foreign_name: list
    hand: int
    id: str
    image_url: str
    layout: str
    legality: list
    life: int
    loyalty: str
    mana_cost: str
    multiverseid: int
    name: str
    number: str
    original_text: str
    original_type: str
    power: str
    printing: list
    rarity: str
    release_date: str
    reserved: bool
    ruling: list
    set: str
    set_name: str
    source: str
    starter: bool
    subtype: list
    supertype: list
    text: str
    timeshifted: bool
    toughness: str
    type: str
    variation: list
    watermark: str


class SetBoosterListMatch(TypedDict):
    id: str


class Subtype(TypedDict, total=False):
    subtype: list


class SubtypeListMatch(TypedDict, total=False):
    subtype: list


class Supertype(TypedDict, total=False):
    supertype: list


class SupertypeListMatch(TypedDict, total=False):
    supertype: list


class Type(TypedDict, total=False):
    type: list


class TypeListMatch(TypedDict, total=False):
    type: list
