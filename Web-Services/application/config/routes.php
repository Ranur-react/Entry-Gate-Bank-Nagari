<?php
defined('BASEPATH') or exit('No direct script access allowed');
$route['default_controller'] = 'auth';
$route['404_override'] = '';
$route['translate_uri_dashes'] = FALSE;






$route['tiket'] = 'gate/Tiket';
$route['parkir'] = 'gate/Parkir';
$route['EntryMobil'] = 'socket/entry';



$route['logout'] = 'auth/logout';
$route['login'] = 'auth/validate';
$route['Usernamecek'] = 'auth/Usernamecek';
$route['Passwordcek'] = 'auth/Passwordcek';
