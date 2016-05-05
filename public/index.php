<?php
chdir(dirname(__DIR__));
require './vendor/autoload.php';
$config = require './config/application.config.php';

Zend\Mvc\Application::init($config)->run();
