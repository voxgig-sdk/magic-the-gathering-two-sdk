<?php
declare(strict_types=1);

// MagicTheGatheringTwo SDK base feature

class MagicTheGatheringTwoBaseFeature
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

    public function init(MagicTheGatheringTwoContext $ctx, array $options): void {}
    public function PostConstruct(MagicTheGatheringTwoContext $ctx): void {}
    public function PostConstructEntity(MagicTheGatheringTwoContext $ctx): void {}
    public function SetData(MagicTheGatheringTwoContext $ctx): void {}
    public function GetData(MagicTheGatheringTwoContext $ctx): void {}
    public function GetMatch(MagicTheGatheringTwoContext $ctx): void {}
    public function SetMatch(MagicTheGatheringTwoContext $ctx): void {}
    public function PrePoint(MagicTheGatheringTwoContext $ctx): void {}
    public function PreSpec(MagicTheGatheringTwoContext $ctx): void {}
    public function PreRequest(MagicTheGatheringTwoContext $ctx): void {}
    public function PreResponse(MagicTheGatheringTwoContext $ctx): void {}
    public function PreResult(MagicTheGatheringTwoContext $ctx): void {}
    public function PreDone(MagicTheGatheringTwoContext $ctx): void {}
    public function PreUnexpected(MagicTheGatheringTwoContext $ctx): void {}
}
