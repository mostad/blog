<?php
return [
    'modules' => [
        'Application',
        'ZendDeveloperTools',
    ],

    'module_listener_options' => [
        'config_glob_paths' => [
            'config/autoload/{{,*.}global,{,*.}local}.php',
        ],

        'config_cache_enabled' => true,
        'cache_dir' => './data/cache',
    ],
];
