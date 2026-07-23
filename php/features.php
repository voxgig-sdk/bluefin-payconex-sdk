<?php
declare(strict_types=1);

// BluefinPayconex SDK feature factory

require_once __DIR__ . '/feature/BaseFeature.php';
require_once __DIR__ . '/feature/TestFeature.php';


class BluefinPayconexFeatures
{
    public static function make_feature(string $name)
    {
        switch ($name) {
            case "base":
                return new BluefinPayconexBaseFeature();
            case "test":
                return new BluefinPayconexTestFeature();
            default:
                return new BluefinPayconexBaseFeature();
        }
    }
}
