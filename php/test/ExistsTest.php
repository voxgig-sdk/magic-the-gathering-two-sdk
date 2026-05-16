<?php
declare(strict_types=1);

// MagicTheGatheringTwo SDK exists test

require_once __DIR__ . '/../magicthegatheringtwo_sdk.php';

use PHPUnit\Framework\TestCase;

class ExistsTest extends TestCase
{
    public function test_create_test_sdk(): void
    {
        $testsdk = MagicTheGatheringTwoSDK::test(null, null);
        $this->assertNotNull($testsdk);
    }
}
