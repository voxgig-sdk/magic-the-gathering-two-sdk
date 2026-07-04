# Typed models for the MagicTheGatheringTwo SDK.
#
# GENERATED from the API model: main.kit.entity.<e>.fields[] and per-op
# params (op.<name>.points[].args.params[]). Field/param types come from the
# canonical type sentinels via @voxgig/sdkgen canonToType (source of truth:
# @voxgig/apidef VALID_CANON). Do not edit by hand.

from __future__ import annotations

from dataclasses import dataclass
from typing import Optional, Any


@dataclass
class Card:
    artist: Optional[str] = None
    border: Optional[str] = None
    card: Optional[dict] = None
    cmc: Optional[float] = None
    color: Optional[list] = None
    color_identity: Optional[list] = None
    flavor: Optional[str] = None
    foreign_name: Optional[list] = None
    hand: Optional[int] = None
    id: Optional[str] = None
    image_url: Optional[str] = None
    layout: Optional[str] = None
    legality: Optional[list] = None
    life: Optional[int] = None
    loyalty: Optional[str] = None
    mana_cost: Optional[str] = None
    multiverseid: Optional[int] = None
    name: Optional[str] = None
    number: Optional[str] = None
    original_text: Optional[str] = None
    original_type: Optional[str] = None
    power: Optional[str] = None
    printing: Optional[list] = None
    rarity: Optional[str] = None
    release_date: Optional[str] = None
    reserved: Optional[bool] = None
    ruling: Optional[list] = None
    set: Optional[str] = None
    set_name: Optional[str] = None
    source: Optional[str] = None
    starter: Optional[bool] = None
    subtype: Optional[list] = None
    supertype: Optional[list] = None
    text: Optional[str] = None
    timeshifted: Optional[bool] = None
    toughness: Optional[str] = None
    type: Optional[str] = None
    variation: Optional[list] = None
    watermark: Optional[str] = None


@dataclass
class CardLoadMatch:
    id: str


@dataclass
class CardListMatch:
    artist: Optional[str] = None
    border: Optional[str] = None
    card: Optional[dict] = None
    cmc: Optional[float] = None
    color: Optional[list] = None
    color_identity: Optional[list] = None
    flavor: Optional[str] = None
    foreign_name: Optional[list] = None
    hand: Optional[int] = None
    id: Optional[str] = None
    image_url: Optional[str] = None
    layout: Optional[str] = None
    legality: Optional[list] = None
    life: Optional[int] = None
    loyalty: Optional[str] = None
    mana_cost: Optional[str] = None
    multiverseid: Optional[int] = None
    name: Optional[str] = None
    number: Optional[str] = None
    original_text: Optional[str] = None
    original_type: Optional[str] = None
    power: Optional[str] = None
    printing: Optional[list] = None
    rarity: Optional[str] = None
    release_date: Optional[str] = None
    reserved: Optional[bool] = None
    ruling: Optional[list] = None
    set: Optional[str] = None
    set_name: Optional[str] = None
    source: Optional[str] = None
    starter: Optional[bool] = None
    subtype: Optional[list] = None
    supertype: Optional[list] = None
    text: Optional[str] = None
    timeshifted: Optional[bool] = None
    toughness: Optional[str] = None
    type: Optional[str] = None
    variation: Optional[list] = None
    watermark: Optional[str] = None


@dataclass
class Format:
    format: Optional[list] = None


@dataclass
class FormatListMatch:
    format: Optional[list] = None


@dataclass
class Set:
    block: Optional[str] = None
    booster: Optional[list] = None
    border: Optional[str] = None
    code: Optional[str] = None
    gatherer_code: Optional[str] = None
    magic_cards_info_code: Optional[str] = None
    mkm_id: Optional[int] = None
    mkm_name: Optional[str] = None
    name: Optional[str] = None
    online_only: Optional[bool] = None
    release_date: Optional[str] = None
    set: Optional[dict] = None
    type: Optional[str] = None


@dataclass
class SetLoadMatch:
    id: str


@dataclass
class SetListMatch:
    block: Optional[str] = None
    booster: Optional[list] = None
    border: Optional[str] = None
    code: Optional[str] = None
    gatherer_code: Optional[str] = None
    magic_cards_info_code: Optional[str] = None
    mkm_id: Optional[int] = None
    mkm_name: Optional[str] = None
    name: Optional[str] = None
    online_only: Optional[bool] = None
    release_date: Optional[str] = None
    set: Optional[dict] = None
    type: Optional[str] = None


@dataclass
class SetBooster:
    artist: Optional[str] = None
    border: Optional[str] = None
    cmc: Optional[float] = None
    color: Optional[list] = None
    color_identity: Optional[list] = None
    flavor: Optional[str] = None
    foreign_name: Optional[list] = None
    hand: Optional[int] = None
    id: Optional[str] = None
    image_url: Optional[str] = None
    layout: Optional[str] = None
    legality: Optional[list] = None
    life: Optional[int] = None
    loyalty: Optional[str] = None
    mana_cost: Optional[str] = None
    multiverseid: Optional[int] = None
    name: Optional[str] = None
    number: Optional[str] = None
    original_text: Optional[str] = None
    original_type: Optional[str] = None
    power: Optional[str] = None
    printing: Optional[list] = None
    rarity: Optional[str] = None
    release_date: Optional[str] = None
    reserved: Optional[bool] = None
    ruling: Optional[list] = None
    set: Optional[str] = None
    set_name: Optional[str] = None
    source: Optional[str] = None
    starter: Optional[bool] = None
    subtype: Optional[list] = None
    supertype: Optional[list] = None
    text: Optional[str] = None
    timeshifted: Optional[bool] = None
    toughness: Optional[str] = None
    type: Optional[str] = None
    variation: Optional[list] = None
    watermark: Optional[str] = None


@dataclass
class SetBoosterListMatch:
    id: str


@dataclass
class Subtype:
    subtype: Optional[list] = None


@dataclass
class SubtypeListMatch:
    subtype: Optional[list] = None


@dataclass
class Supertype:
    supertype: Optional[list] = None


@dataclass
class SupertypeListMatch:
    supertype: Optional[list] = None


@dataclass
class Type:
    type: Optional[list] = None


@dataclass
class TypeListMatch:
    type: Optional[list] = None

