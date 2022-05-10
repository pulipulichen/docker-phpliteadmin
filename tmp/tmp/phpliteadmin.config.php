<?php
$password = getenv("PASSWORD") ?? 'admin';
$directory = getenv("LOCATION") ?? '/db';
$subdirectories = true;
$theme = 'phpliteadmin.css';
$language = 'en';
$rowsNum = 50;
$charsNum = 300;
$maxSavedQueries = 15;
$custom_functions = array(
	'md5', 'sha1', 'time', 'strtotime',
);
$cookie_name = 'pla3412';
$debug = false;
$allowed_extensions = array('db','db3','sqlite','sqlite3');
