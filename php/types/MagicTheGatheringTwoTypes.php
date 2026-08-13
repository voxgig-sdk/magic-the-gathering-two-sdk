<?php
declare(strict_types=1);

// Typed models for the MagicTheGatheringTwo SDK.
//
// GENERATED from the API model: main.kit.entity.<e>.fields[] and per-op
// params (op.<name>.points[].args.params[]). Field/param types come from the
// canonical type sentinels via @voxgig/sdkgen canonToType (source of truth:
// @voxgig/apidef VALID_CANON). Do not edit by hand.
//
// These are documentation-grade value objects (PHP 8 typed properties),
// registered on the composer classmap autoload. The SDK boundary exchanges
// assoc-arrays; these classes name the shapes for tooling and typed callers.

/** Card entity data model. */
class Card
{
    public ?string $artist = null;
    public ?string $border = null;
    public ?float $cmc = null;
    public ?array $colorIdentity = null;
    public ?array $colors = null;
    public ?string $flavor = null;
    public ?array $foreignNames = null;
    public ?int $hand = null;
    public ?string $id = null;
    public ?string $imageUrl = null;
    public ?string $layout = null;
    public ?array $legalities = null;
    public ?int $life = null;
    public ?string $loyalty = null;
    public ?string $manaCost = null;
    public ?int $multiverseid = null;
    public ?string $name = null;
    public ?array $names = null;
    public ?string $number = null;
    public ?string $originalText = null;
    public ?string $originalType = null;
    public ?string $power = null;
    public ?array $printings = null;
    public ?string $rarity = null;
    public ?string $releaseDate = null;
    public ?bool $reserved = null;
    public ?array $rulings = null;
    public ?string $set = null;
    public ?string $setName = null;
    public ?string $source = null;
    public ?bool $starter = null;
    public ?array $subtypes = null;
    public ?array $supertypes = null;
    public ?string $text = null;
    public ?bool $timeshifted = null;
    public ?string $toughness = null;
    public ?string $type = null;
    public ?array $types = null;
    public ?array $variations = null;
    public ?string $watermark = null;
}

/** Request payload for Card#load. */
class CardLoadMatch
{
    public string $id;
}

/** Request payload for Card#list. */
class CardListMatch
{
    public ?string $artist = null;
    public ?string $border = null;
    public ?float $cmc = null;
    public ?array $colorIdentity = null;
    public ?array $colors = null;
    public ?string $flavor = null;
    public ?array $foreignNames = null;
    public ?int $hand = null;
    public ?string $id = null;
    public ?string $imageUrl = null;
    public ?string $layout = null;
    public ?array $legalities = null;
    public ?int $life = null;
    public ?string $loyalty = null;
    public ?string $manaCost = null;
    public ?int $multiverseid = null;
    public ?string $name = null;
    public ?array $names = null;
    public ?string $number = null;
    public ?string $originalText = null;
    public ?string $originalType = null;
    public ?string $power = null;
    public ?array $printings = null;
    public ?string $rarity = null;
    public ?string $releaseDate = null;
    public ?bool $reserved = null;
    public ?array $rulings = null;
    public ?string $set = null;
    public ?string $setName = null;
    public ?string $source = null;
    public ?bool $starter = null;
    public ?array $subtypes = null;
    public ?array $supertypes = null;
    public ?string $text = null;
    public ?bool $timeshifted = null;
    public ?string $toughness = null;
    public ?string $type = null;
    public ?array $types = null;
    public ?array $variations = null;
    public ?string $watermark = null;
}

/** Format entity data model. */
class Format
{
    public ?array $formats = null;
}

/** Request payload for Format#list. */
class FormatListMatch
{
    public ?array $formats = null;
}

/** Set entity data model. */
class Set
{
    public ?string $block = null;
    public ?array $booster = null;
    public ?string $border = null;
    public ?string $code = null;
    public ?string $gathererCode = null;
    public ?string $magicCardsInfoCode = null;
    public ?int $mkm_id = null;
    public ?string $mkm_name = null;
    public ?string $name = null;
    public ?bool $onlineOnly = null;
    public ?string $releaseDate = null;
    public ?string $type = null;
}

/** Request payload for Set#load. */
class SetLoadMatch
{
    public string $id;
}

/** Request payload for Set#list. */
class SetListMatch
{
    public ?string $block = null;
    public ?array $booster = null;
    public ?string $border = null;
    public ?string $code = null;
    public ?string $gathererCode = null;
    public ?string $magicCardsInfoCode = null;
    public ?int $mkm_id = null;
    public ?string $mkm_name = null;
    public ?string $name = null;
    public ?bool $onlineOnly = null;
    public ?string $releaseDate = null;
    public ?string $type = null;
}

/** SetBooster entity data model. */
class SetBooster
{
    public ?string $artist = null;
    public ?string $border = null;
    public ?float $cmc = null;
    public ?array $colorIdentity = null;
    public ?array $colors = null;
    public ?string $flavor = null;
    public ?array $foreignNames = null;
    public ?int $hand = null;
    public ?string $id = null;
    public ?string $imageUrl = null;
    public ?string $layout = null;
    public ?array $legalities = null;
    public ?int $life = null;
    public ?string $loyalty = null;
    public ?string $manaCost = null;
    public ?int $multiverseid = null;
    public ?string $name = null;
    public ?array $names = null;
    public ?string $number = null;
    public ?string $originalText = null;
    public ?string $originalType = null;
    public ?string $power = null;
    public ?array $printings = null;
    public ?string $rarity = null;
    public ?string $releaseDate = null;
    public ?bool $reserved = null;
    public ?array $rulings = null;
    public ?string $set = null;
    public ?string $setName = null;
    public ?string $source = null;
    public ?bool $starter = null;
    public ?array $subtypes = null;
    public ?array $supertypes = null;
    public ?string $text = null;
    public ?bool $timeshifted = null;
    public ?string $toughness = null;
    public ?string $type = null;
    public ?array $types = null;
    public ?array $variations = null;
    public ?string $watermark = null;
}

/** Request payload for SetBooster#list. */
class SetBoosterListMatch
{
    public string $id;
}

/** Subtype entity data model. */
class Subtype
{
    public ?array $subtypes = null;
}

/** Request payload for Subtype#list. */
class SubtypeListMatch
{
    public ?array $subtypes = null;
}

/** Supertype entity data model. */
class Supertype
{
    public ?array $supertypes = null;
}

/** Request payload for Supertype#list. */
class SupertypeListMatch
{
    public ?array $supertypes = null;
}

/** Type entity data model. */
class Type
{
    public ?array $types = null;
}

/** Request payload for Type#list. */
class TypeListMatch
{
    public ?array $types = null;
}

