<?php
declare(strict_types=1);

// MagicTheGatheringTwo SDK utility registration

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

MagicTheGatheringTwoUtility::setRegistrar(function (MagicTheGatheringTwoUtility $u): void {
    $u->clean = [MagicTheGatheringTwoClean::class, 'call'];
    $u->done = [MagicTheGatheringTwoDone::class, 'call'];
    $u->make_error = [MagicTheGatheringTwoMakeError::class, 'call'];
    $u->feature_add = [MagicTheGatheringTwoFeatureAdd::class, 'call'];
    $u->feature_hook = [MagicTheGatheringTwoFeatureHook::class, 'call'];
    $u->feature_init = [MagicTheGatheringTwoFeatureInit::class, 'call'];
    $u->fetcher = [MagicTheGatheringTwoFetcher::class, 'call'];
    $u->make_fetch_def = [MagicTheGatheringTwoMakeFetchDef::class, 'call'];
    $u->make_context = [MagicTheGatheringTwoMakeContext::class, 'call'];
    $u->make_options = [MagicTheGatheringTwoMakeOptions::class, 'call'];
    $u->make_request = [MagicTheGatheringTwoMakeRequest::class, 'call'];
    $u->make_response = [MagicTheGatheringTwoMakeResponse::class, 'call'];
    $u->make_result = [MagicTheGatheringTwoMakeResult::class, 'call'];
    $u->make_point = [MagicTheGatheringTwoMakePoint::class, 'call'];
    $u->make_spec = [MagicTheGatheringTwoMakeSpec::class, 'call'];
    $u->make_url = [MagicTheGatheringTwoMakeUrl::class, 'call'];
    $u->param = [MagicTheGatheringTwoParam::class, 'call'];
    $u->prepare_auth = [MagicTheGatheringTwoPrepareAuth::class, 'call'];
    $u->prepare_body = [MagicTheGatheringTwoPrepareBody::class, 'call'];
    $u->prepare_headers = [MagicTheGatheringTwoPrepareHeaders::class, 'call'];
    $u->prepare_method = [MagicTheGatheringTwoPrepareMethod::class, 'call'];
    $u->prepare_params = [MagicTheGatheringTwoPrepareParams::class, 'call'];
    $u->prepare_path = [MagicTheGatheringTwoPreparePath::class, 'call'];
    $u->prepare_query = [MagicTheGatheringTwoPrepareQuery::class, 'call'];
    $u->result_basic = [MagicTheGatheringTwoResultBasic::class, 'call'];
    $u->result_body = [MagicTheGatheringTwoResultBody::class, 'call'];
    $u->result_headers = [MagicTheGatheringTwoResultHeaders::class, 'call'];
    $u->transform_request = [MagicTheGatheringTwoTransformRequest::class, 'call'];
    $u->transform_response = [MagicTheGatheringTwoTransformResponse::class, 'call'];
});
