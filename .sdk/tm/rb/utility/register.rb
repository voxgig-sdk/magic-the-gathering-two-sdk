# MagicTheGatheringTwo SDK utility registration
require_relative '../core/utility_type'
require_relative 'clean'
require_relative 'done'
require_relative 'make_error'
require_relative 'feature_add'
require_relative 'feature_hook'
require_relative 'feature_init'
require_relative 'fetcher'
require_relative 'make_fetch_def'
require_relative 'make_context'
require_relative 'make_options'
require_relative 'make_request'
require_relative 'make_response'
require_relative 'make_result'
require_relative 'make_point'
require_relative 'make_spec'
require_relative 'make_url'
require_relative 'param'
require_relative 'prepare_auth'
require_relative 'prepare_body'
require_relative 'prepare_headers'
require_relative 'prepare_method'
require_relative 'prepare_params'
require_relative 'prepare_path'
require_relative 'prepare_query'
require_relative 'result_basic'
require_relative 'result_body'
require_relative 'result_headers'
require_relative 'transform_request'
require_relative 'transform_response'

MagicTheGatheringTwoUtility.registrar = ->(u) {
  u.clean = MagicTheGatheringTwoUtilities::Clean
  u.done = MagicTheGatheringTwoUtilities::Done
  u.make_error = MagicTheGatheringTwoUtilities::MakeError
  u.feature_add = MagicTheGatheringTwoUtilities::FeatureAdd
  u.feature_hook = MagicTheGatheringTwoUtilities::FeatureHook
  u.feature_init = MagicTheGatheringTwoUtilities::FeatureInit
  u.fetcher = MagicTheGatheringTwoUtilities::Fetcher
  u.make_fetch_def = MagicTheGatheringTwoUtilities::MakeFetchDef
  u.make_context = MagicTheGatheringTwoUtilities::MakeContext
  u.make_options = MagicTheGatheringTwoUtilities::MakeOptions
  u.make_request = MagicTheGatheringTwoUtilities::MakeRequest
  u.make_response = MagicTheGatheringTwoUtilities::MakeResponse
  u.make_result = MagicTheGatheringTwoUtilities::MakeResult
  u.make_point = MagicTheGatheringTwoUtilities::MakePoint
  u.make_spec = MagicTheGatheringTwoUtilities::MakeSpec
  u.make_url = MagicTheGatheringTwoUtilities::MakeUrl
  u.param = MagicTheGatheringTwoUtilities::Param
  u.prepare_auth = MagicTheGatheringTwoUtilities::PrepareAuth
  u.prepare_body = MagicTheGatheringTwoUtilities::PrepareBody
  u.prepare_headers = MagicTheGatheringTwoUtilities::PrepareHeaders
  u.prepare_method = MagicTheGatheringTwoUtilities::PrepareMethod
  u.prepare_params = MagicTheGatheringTwoUtilities::PrepareParams
  u.prepare_path = MagicTheGatheringTwoUtilities::PreparePath
  u.prepare_query = MagicTheGatheringTwoUtilities::PrepareQuery
  u.result_basic = MagicTheGatheringTwoUtilities::ResultBasic
  u.result_body = MagicTheGatheringTwoUtilities::ResultBody
  u.result_headers = MagicTheGatheringTwoUtilities::ResultHeaders
  u.transform_request = MagicTheGatheringTwoUtilities::TransformRequest
  u.transform_response = MagicTheGatheringTwoUtilities::TransformResponse
}
