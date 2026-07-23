<?php
declare(strict_types=1);

// BluefinPayconex SDK utility registration

require_once __DIR__ . '/../core/UtilityType.php';
require_once __DIR__ . '/Clean.php';
require_once __DIR__ . '/Done.php';
require_once __DIR__ . '/MakeError.php';
require_once __DIR__ . '/FeatureAdd.php';
require_once __DIR__ . '/FeatureHook.php';
require_once __DIR__ . '/FeatureInit.php';
require_once __DIR__ . '/Fetcher.php';
require_once __DIR__ . '/MakeFetchDef.php';
require_once __DIR__ . '/MakeContext.php';
require_once __DIR__ . '/MakeOptions.php';
require_once __DIR__ . '/MakeRequest.php';
require_once __DIR__ . '/MakeResponse.php';
require_once __DIR__ . '/MakeResult.php';
require_once __DIR__ . '/MakePoint.php';
require_once __DIR__ . '/MakeSpec.php';
require_once __DIR__ . '/MakeUrl.php';
require_once __DIR__ . '/Param.php';
require_once __DIR__ . '/PrepareAuth.php';
require_once __DIR__ . '/PrepareBody.php';
require_once __DIR__ . '/PrepareHeaders.php';
require_once __DIR__ . '/PrepareMethod.php';
require_once __DIR__ . '/PrepareParams.php';
require_once __DIR__ . '/PreparePath.php';
require_once __DIR__ . '/PrepareQuery.php';
require_once __DIR__ . '/ResultBasic.php';
require_once __DIR__ . '/ResultBody.php';
require_once __DIR__ . '/ResultHeaders.php';
require_once __DIR__ . '/TransformRequest.php';
require_once __DIR__ . '/TransformResponse.php';

BluefinPayconexUtility::setRegistrar(function (BluefinPayconexUtility $u): void {
    $u->clean = [BluefinPayconexClean::class, 'call'];
    $u->done = [BluefinPayconexDone::class, 'call'];
    $u->make_error = [BluefinPayconexMakeError::class, 'call'];
    $u->feature_add = [BluefinPayconexFeatureAdd::class, 'call'];
    $u->feature_hook = [BluefinPayconexFeatureHook::class, 'call'];
    $u->feature_init = [BluefinPayconexFeatureInit::class, 'call'];
    $u->fetcher = [BluefinPayconexFetcher::class, 'call'];
    $u->make_fetch_def = [BluefinPayconexMakeFetchDef::class, 'call'];
    $u->make_context = [BluefinPayconexMakeContext::class, 'call'];
    $u->make_options = [BluefinPayconexMakeOptions::class, 'call'];
    $u->make_request = [BluefinPayconexMakeRequest::class, 'call'];
    $u->make_response = [BluefinPayconexMakeResponse::class, 'call'];
    $u->make_result = [BluefinPayconexMakeResult::class, 'call'];
    $u->make_point = [BluefinPayconexMakePoint::class, 'call'];
    $u->make_spec = [BluefinPayconexMakeSpec::class, 'call'];
    $u->make_url = [BluefinPayconexMakeUrl::class, 'call'];
    $u->param = [BluefinPayconexParam::class, 'call'];
    $u->prepare_auth = [BluefinPayconexPrepareAuth::class, 'call'];
    $u->prepare_body = [BluefinPayconexPrepareBody::class, 'call'];
    $u->prepare_headers = [BluefinPayconexPrepareHeaders::class, 'call'];
    $u->prepare_method = [BluefinPayconexPrepareMethod::class, 'call'];
    $u->prepare_params = [BluefinPayconexPrepareParams::class, 'call'];
    $u->prepare_path = [BluefinPayconexPreparePath::class, 'call'];
    $u->prepare_query = [BluefinPayconexPrepareQuery::class, 'call'];
    $u->result_basic = [BluefinPayconexResultBasic::class, 'call'];
    $u->result_body = [BluefinPayconexResultBody::class, 'call'];
    $u->result_headers = [BluefinPayconexResultHeaders::class, 'call'];
    $u->transform_request = [BluefinPayconexTransformRequest::class, 'call'];
    $u->transform_response = [BluefinPayconexTransformResponse::class, 'call'];
});
