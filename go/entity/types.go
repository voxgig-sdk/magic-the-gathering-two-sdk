// Typed models for the MagicTheGatheringTwo SDK.
//
// GENERATED from the API model: main.kit.entity.<e>.fields{} and per-op
// params (op.<name>.points[].g.params[]). Field/param types come from the
// canonical type sentinels via @voxgig/sdkgen canonToType (source of truth:
// @voxgig/apidef VALID_CANON). Do not edit by hand.
package entity

import (
	"encoding/json"

	"github.com/voxgig-sdk/magic-the-gathering-two-sdk/go/core"
)

// Card is the typed data model for the card entity.
type Card struct {
}

// CardLoadMatch is the typed request payload for Card.LoadTyped.
type CardLoadMatch struct {
	Id string `json:"id"`
}

// CardListMatch is the typed request payload for Card.ListTyped.
type CardListMatch struct {
	Artist *string `json:"artist,omitempty"`
	Cmc *float64 `json:"cmc,omitempty"`
	Color *string `json:"color,omitempty"`
	ColorIdentity *string `json:"color_identity,omitempty"`
	Contain *string `json:"contain,omitempty"`
	Flavor *string `json:"flavor,omitempty"`
	GameFormat *string `json:"game_format,omitempty"`
	Id *string `json:"id,omitempty"`
	Language *string `json:"language,omitempty"`
	Layout *string `json:"layout,omitempty"`
	Legality *string `json:"legality,omitempty"`
	Loyalty *string `json:"loyalty,omitempty"`
	Multiverseid *int `json:"multiverseid,omitempty"`
	Name *string `json:"name,omitempty"`
	Number *string `json:"number,omitempty"`
	OrderBy *string `json:"order_by,omitempty"`
	Page *int `json:"page,omitempty"`
	PageSize *int `json:"page_size,omitempty"`
	Power *string `json:"power,omitempty"`
	Random *bool `json:"random,omitempty"`
	Rarity *string `json:"rarity,omitempty"`
	Set *string `json:"set,omitempty"`
	SetName *string `json:"set_name,omitempty"`
	Subtype *string `json:"subtype,omitempty"`
	Supertype *string `json:"supertype,omitempty"`
	Text *string `json:"text,omitempty"`
	Toughness *string `json:"toughness,omitempty"`
	Type *string `json:"type,omitempty"`
}

// Format is the typed data model for the format entity.
type Format struct {
}

// FormatListMatch is the typed request payload for Format.ListTyped.
type FormatListMatch struct {
	Formats *[]any `json:"formats,omitempty"`
}

// Set is the typed data model for the set entity.
type Set struct {
}

// SetLoadMatch is the typed request payload for Set.LoadTyped.
type SetLoadMatch struct {
	Id string `json:"id"`
}

// SetListMatch is the typed request payload for Set.ListTyped.
type SetListMatch struct {
	Block *string `json:"block,omitempty"`
	Name *string `json:"name,omitempty"`
}

// SetBooster is the typed data model for the set_booster entity.
type SetBooster struct {
}

// SetBoosterListMatch is the typed request payload for SetBooster.ListTyped.
type SetBoosterListMatch struct {
	Id string `json:"id"`
}

// Subtype is the typed data model for the subtype entity.
type Subtype struct {
}

// SubtypeListMatch is the typed request payload for Subtype.ListTyped.
type SubtypeListMatch struct {
	Subtypes *[]any `json:"subtypes,omitempty"`
}

// Supertype is the typed data model for the supertype entity.
type Supertype struct {
}

// SupertypeListMatch is the typed request payload for Supertype.ListTyped.
type SupertypeListMatch struct {
	Supertypes *[]any `json:"supertypes,omitempty"`
}

// Type is the typed data model for the type entity.
type Type struct {
}

// TypeListMatch is the typed request payload for Type.ListTyped.
type TypeListMatch struct {
	Types *[]any `json:"types,omitempty"`
}

// asMap turns a typed request/data struct into the map[string]any the
// runtime op pipeline consumes, honouring the json tags above.
func asMap(v any) map[string]any {
	out := map[string]any{}
	b, err := json.Marshal(v)
	if err != nil {
		return out
	}
	_ = json.Unmarshal(b, &out)
	return out
}

// entityData unwraps an entity to its data map.
//
// Operations resolve to the ENTITY, not the raw data (see AGENTS.md), and an
// entity's fields are UNEXPORTED — marshalling one directly yields `{}`, so
// every typed accessor would silently hand back a zero-valued struct. The
// typed boundary therefore takes the data hop first.
func entityData(v any) any {
	if ent, ok := v.(core.Entity); ok {
		return ent.Data()
	}
	return v
}

// typedFrom decodes a runtime value (an entity, or the map[string]any the op
// pipeline produced) into a typed model T via a JSON round-trip. On any error
// it returns the zero value of T; the op's own (value, error) tuple carries
// the real error.
func typedFrom[T any](v any) T {
	var out T
	v = entityData(v)
	if v == nil {
		return out
	}
	b, err := json.Marshal(v)
	if err != nil {
		return out
	}
	_ = json.Unmarshal(b, &out)
	return out
}

// typedSliceFrom decodes a runtime list value into a typed slice []T via a
// JSON round-trip, for list ops. `list` resolves to a slice of ENTITY
// instances, so each element takes the data hop.
func typedSliceFrom[T any](v any) []T {
	var out []T
	if v == nil {
		return out
	}
	if list, ok := v.([]any); ok {
		unwrapped := make([]any, 0, len(list))
		for _, item := range list {
			unwrapped = append(unwrapped, entityData(item))
		}
		v = unwrapped
	}
	b, err := json.Marshal(v)
	if err != nil {
		return out
	}
	_ = json.Unmarshal(b, &out)
	return out
}
