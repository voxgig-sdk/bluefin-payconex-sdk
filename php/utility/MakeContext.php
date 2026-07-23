<?php
declare(strict_types=1);

// BluefinPayconex SDK utility: make_context

require_once __DIR__ . '/../core/Context.php';

class BluefinPayconexMakeContext
{
    public static function call(array $ctxmap, ?BluefinPayconexContext $basectx): BluefinPayconexContext
    {
        return new BluefinPayconexContext($ctxmap, $basectx);
    }
}
