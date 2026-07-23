<?php
declare(strict_types=1);

// BluefinPayconex SDK utility: prepare_body

class BluefinPayconexPrepareBody
{
    public static function call(BluefinPayconexContext $ctx): mixed
    {
        if ($ctx->op->input === 'data') {
            return ($ctx->utility->transform_request)($ctx);
        }
        return null;
    }
}
