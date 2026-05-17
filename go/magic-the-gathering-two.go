package voxgigmagicthegatheringtwosdk

import (
	"github.com/voxgig-sdk/magic-the-gathering-two-sdk/go/core"
	"github.com/voxgig-sdk/magic-the-gathering-two-sdk/go/entity"
	"github.com/voxgig-sdk/magic-the-gathering-two-sdk/go/feature"
	_ "github.com/voxgig-sdk/magic-the-gathering-two-sdk/go/utility"
)

// Type aliases preserve external API.
type MagicTheGatheringTwoSDK = core.MagicTheGatheringTwoSDK
type Context = core.Context
type Utility = core.Utility
type Feature = core.Feature
type Entity = core.Entity
type MagicTheGatheringTwoEntity = core.MagicTheGatheringTwoEntity
type FetcherFunc = core.FetcherFunc
type Spec = core.Spec
type Result = core.Result
type Response = core.Response
type Operation = core.Operation
type Control = core.Control
type MagicTheGatheringTwoError = core.MagicTheGatheringTwoError

// BaseFeature from feature package.
type BaseFeature = feature.BaseFeature

func init() {
	core.NewBaseFeatureFunc = func() core.Feature {
		return feature.NewBaseFeature()
	}
	core.NewTestFeatureFunc = func() core.Feature {
		return feature.NewTestFeature()
	}
	core.NewCardEntityFunc = func(client *core.MagicTheGatheringTwoSDK, entopts map[string]any) core.MagicTheGatheringTwoEntity {
		return entity.NewCardEntity(client, entopts)
	}
	core.NewFormatEntityFunc = func(client *core.MagicTheGatheringTwoSDK, entopts map[string]any) core.MagicTheGatheringTwoEntity {
		return entity.NewFormatEntity(client, entopts)
	}
	core.NewSetEntityFunc = func(client *core.MagicTheGatheringTwoSDK, entopts map[string]any) core.MagicTheGatheringTwoEntity {
		return entity.NewSetEntity(client, entopts)
	}
	core.NewSetBoosterEntityFunc = func(client *core.MagicTheGatheringTwoSDK, entopts map[string]any) core.MagicTheGatheringTwoEntity {
		return entity.NewSetBoosterEntity(client, entopts)
	}
	core.NewSubtypeEntityFunc = func(client *core.MagicTheGatheringTwoSDK, entopts map[string]any) core.MagicTheGatheringTwoEntity {
		return entity.NewSubtypeEntity(client, entopts)
	}
	core.NewSupertypeEntityFunc = func(client *core.MagicTheGatheringTwoSDK, entopts map[string]any) core.MagicTheGatheringTwoEntity {
		return entity.NewSupertypeEntity(client, entopts)
	}
	core.NewTypeEntityFunc = func(client *core.MagicTheGatheringTwoSDK, entopts map[string]any) core.MagicTheGatheringTwoEntity {
		return entity.NewTypeEntity(client, entopts)
	}
}

// Constructor re-exports.
var NewMagicTheGatheringTwoSDK = core.NewMagicTheGatheringTwoSDK
var TestSDK = core.TestSDK
var NewContext = core.NewContext
var NewSpec = core.NewSpec
var NewResult = core.NewResult
var NewResponse = core.NewResponse
var NewOperation = core.NewOperation
var MakeConfig = core.MakeConfig
var NewBaseFeature = feature.NewBaseFeature
var NewTestFeature = feature.NewTestFeature
