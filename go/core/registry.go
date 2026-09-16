package core

var UtilityRegistrar func(u *Utility)

var NewBaseFeatureFunc func() Feature

var NewRatelimitFeatureFunc func() Feature

var NewRetryFeatureFunc func() Feature

var NewTestFeatureFunc func() Feature

var NewTimeoutFeatureFunc func() Feature

var NewCardEntityFunc func(client *MagicTheGatheringTwoSDK, entopts map[string]any) MagicTheGatheringTwoEntity

var NewFormatEntityFunc func(client *MagicTheGatheringTwoSDK, entopts map[string]any) MagicTheGatheringTwoEntity

var NewSetEntityFunc func(client *MagicTheGatheringTwoSDK, entopts map[string]any) MagicTheGatheringTwoEntity

var NewSetBoosterEntityFunc func(client *MagicTheGatheringTwoSDK, entopts map[string]any) MagicTheGatheringTwoEntity

var NewSubtypeEntityFunc func(client *MagicTheGatheringTwoSDK, entopts map[string]any) MagicTheGatheringTwoEntity

var NewSupertypeEntityFunc func(client *MagicTheGatheringTwoSDK, entopts map[string]any) MagicTheGatheringTwoEntity

var NewTypeEntityFunc func(client *MagicTheGatheringTwoSDK, entopts map[string]any) MagicTheGatheringTwoEntity

