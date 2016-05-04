<?php
chdir(dirname(__DIR__));
require 'vendor/autoload.php';

echo \Zend\Version\Version::VERSION;
