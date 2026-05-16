<?php
declare(strict_types=1);

// MagicTheGatheringTwo SDK utility: make_context

require_once __DIR__ . '/../core/Context.php';

class MagicTheGatheringTwoMakeContext
{
    public static function call(array $ctxmap, ?MagicTheGatheringTwoContext $basectx): MagicTheGatheringTwoContext
    {
        return new MagicTheGatheringTwoContext($ctxmap, $basectx);
    }
}
