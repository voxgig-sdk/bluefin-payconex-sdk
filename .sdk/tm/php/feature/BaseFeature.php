<?php
declare(strict_types=1);

// BluefinPayconex SDK base feature

class BluefinPayconexBaseFeature
{
    public string $version;
    public string $name;
    public bool $active;

    // Positions this feature when added via the client `extend` option:
    // "__before__" / "__after__" / "__replace__" name an already-added
    // feature (mirrors the ts feature `_options`). Declared so setting it
    // on an extension instance avoids the dynamic-property deprecation.
    public ?array $_options = null;

    public function __construct()
    {
        $this->version = '0.0.1';
        $this->name = 'base';
        $this->active = true;
    }

    public function get_version(): string { return $this->version; }
    public function get_name(): string { return $this->name; }
    public function get_active(): bool { return $this->active; }

    public function init(BluefinPayconexContext $ctx, array $options): void {}
    public function PostConstruct(BluefinPayconexContext $ctx): void {}
    public function PostConstructEntity(BluefinPayconexContext $ctx): void {}
    public function SetData(BluefinPayconexContext $ctx): void {}
    public function GetData(BluefinPayconexContext $ctx): void {}
    public function GetMatch(BluefinPayconexContext $ctx): void {}
    public function SetMatch(BluefinPayconexContext $ctx): void {}
    public function PrePoint(BluefinPayconexContext $ctx): void {}
    public function PreSpec(BluefinPayconexContext $ctx): void {}
    public function PreRequest(BluefinPayconexContext $ctx): void {}
    public function PreResponse(BluefinPayconexContext $ctx): void {}
    public function PreResult(BluefinPayconexContext $ctx): void {}
    public function PreDone(BluefinPayconexContext $ctx): void {}
    public function PreUnexpected(BluefinPayconexContext $ctx): void {}
}
