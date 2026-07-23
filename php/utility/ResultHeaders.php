<?php
declare(strict_types=1);

// BluefinPayconex SDK utility: result_headers

class BluefinPayconexResultHeaders
{
    public static function call(BluefinPayconexContext $ctx): ?BluefinPayconexResult
    {
        $response = $ctx->response;
        $result = $ctx->result;
        if ($result) {
            if ($response && is_array($response->headers)) {
                $result->headers = $response->headers;
            } else {
                $result->headers = [];
            }
        }
        return $result;
    }
}
