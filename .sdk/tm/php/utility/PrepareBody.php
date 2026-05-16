<?php
declare(strict_types=1);

// MagicTheGatheringTwo SDK utility: prepare_body

class MagicTheGatheringTwoPrepareBody
{
    public static function call(MagicTheGatheringTwoContext $ctx): mixed
    {
        if ($ctx->op->input === 'data') {
            return ($ctx->utility->transform_request)($ctx);
        }
        return null;
    }
}
