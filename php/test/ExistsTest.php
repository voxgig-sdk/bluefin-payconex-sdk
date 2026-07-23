<?php
declare(strict_types=1);

// BluefinPayconex SDK exists test

require_once __DIR__ . '/../bluefinpayconex_sdk.php';

use PHPUnit\Framework\TestCase;

class ExistsTest extends TestCase
{
    public function test_create_test_sdk(): void
    {
        $testsdk = BluefinPayconexSDK::test(null, null);
        $this->assertNotNull($testsdk);
    }
}
