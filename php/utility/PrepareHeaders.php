<?php
declare(strict_types=1);

// MagicTheGatheringTwo SDK utility: prepare_headers

class MagicTheGatheringTwoPrepareHeaders
{
    public static function call(MagicTheGatheringTwoContext $ctx): array
    {
        $options = $ctx->client->options_map();
        $headers = \Voxgig\Struct\Struct::getprop($options, 'headers');
        if (!$headers) {
            return [];
        }
        $out = \Voxgig\Struct\Struct::clone($headers);
        return is_array($out) ? $out : [];
    }
}
