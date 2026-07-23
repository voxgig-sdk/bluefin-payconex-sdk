<?php
declare(strict_types=1);

// BluefinPayconex SDK utility: result_body

class BluefinPayconexResultBody
{
    public static function call(BluefinPayconexContext $ctx): ?BluefinPayconexResult
    {
        $response = $ctx->response;
        $result = $ctx->result;
        if ($result && $response && $response->json_func && $response->body) {
            $result->body = ($response->json_func)();
        }
        return $result;
    }
}
