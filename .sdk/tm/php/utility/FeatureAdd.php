<?php
declare(strict_types=1);

// MagicTheGatheringTwo SDK utility: feature_add

class MagicTheGatheringTwoFeatureAdd
{
    public static function call(MagicTheGatheringTwoContext $ctx, mixed $f): void
    {
        $ctx->client->features[] = $f;
    }
}
