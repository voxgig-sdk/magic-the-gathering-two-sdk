<?php
declare(strict_types=1);

// MagicTheGatheringTwo SDK feature factory

require_once __DIR__ . '/feature/BaseFeature.php';
require_once __DIR__ . '/feature/TestFeature.php';


class MagicTheGatheringTwoFeatures
{
    public static function make_feature(string $name)
    {
        switch ($name) {
            case "base":
                return new MagicTheGatheringTwoBaseFeature();
            case "test":
                return new MagicTheGatheringTwoTestFeature();
            default:
                return new MagicTheGatheringTwoBaseFeature();
        }
    }
}
