# BluefinPayconex SDK utility registration
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

BluefinPayconexUtility.registrar = ->(u) {
  u.clean = BluefinPayconexUtilities::Clean
  u.done = BluefinPayconexUtilities::Done
  u.make_error = BluefinPayconexUtilities::MakeError
  u.feature_add = BluefinPayconexUtilities::FeatureAdd
  u.feature_hook = BluefinPayconexUtilities::FeatureHook
  u.feature_init = BluefinPayconexUtilities::FeatureInit
  u.fetcher = BluefinPayconexUtilities::Fetcher
  u.make_fetch_def = BluefinPayconexUtilities::MakeFetchDef
  u.make_context = BluefinPayconexUtilities::MakeContext
  u.make_options = BluefinPayconexUtilities::MakeOptions
  u.make_request = BluefinPayconexUtilities::MakeRequest
  u.make_response = BluefinPayconexUtilities::MakeResponse
  u.make_result = BluefinPayconexUtilities::MakeResult
  u.make_point = BluefinPayconexUtilities::MakePoint
  u.make_spec = BluefinPayconexUtilities::MakeSpec
  u.make_url = BluefinPayconexUtilities::MakeUrl
  u.param = BluefinPayconexUtilities::Param
  u.prepare_auth = BluefinPayconexUtilities::PrepareAuth
  u.prepare_body = BluefinPayconexUtilities::PrepareBody
  u.prepare_headers = BluefinPayconexUtilities::PrepareHeaders
  u.prepare_method = BluefinPayconexUtilities::PrepareMethod
  u.prepare_params = BluefinPayconexUtilities::PrepareParams
  u.prepare_path = BluefinPayconexUtilities::PreparePath
  u.prepare_query = BluefinPayconexUtilities::PrepareQuery
  u.result_basic = BluefinPayconexUtilities::ResultBasic
  u.result_body = BluefinPayconexUtilities::ResultBody
  u.result_headers = BluefinPayconexUtilities::ResultHeaders
  u.transform_request = BluefinPayconexUtilities::TransformRequest
  u.transform_response = BluefinPayconexUtilities::TransformResponse
}
