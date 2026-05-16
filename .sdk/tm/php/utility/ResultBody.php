<?php
declare(strict_types=1);

// MagicTheGatheringTwo SDK utility: result_body

class MagicTheGatheringTwoResultBody
{
    public static function call(MagicTheGatheringTwoContext $ctx): ?MagicTheGatheringTwoResult
    {
        $response = $ctx->response;
        $result = $ctx->result;
        if ($result && $response && $response->json_func && $response->body) {
            $result->body = ($response->json_func)();
        }
        return $result;
    }
}
