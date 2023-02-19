<?php

declare(strict_types=1);

$config = new PhpCsFixer\Config();

return $config
    ->setRiskyAllowed(true)
    ->setRules([
        'braces' => true,
        'blank_line_after_opening_tag' => true,
        'linebreak_after_opening_tag' => true,
        'declare_strict_types' => true,
        '@PSR1' => true,
        '@PSR2' => true,
    ]);