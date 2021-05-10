<?php
defined('BASEPATH') or exit('No direct script access allowed');
$route['default_controller'] = 'auth';
$route['404_override'] = '';
$route['translate_uri_dashes'] = FALSE;






$route['tiket'] = 'gate/Tiket';
$route['parkir'] = 'gate/Parkir';
$route['MobilStreming'] = 'gate/Parkir/MobilStreming';
$route['cekkarcis'] = 'gate/Parkir/cekkarcis';
$route['EntryMobil'] = 'socket/entry';
$route['EntryMotor'] = 'socket/EntryMotor';


$route['kasir'] = 'gate/Parkir';
$route['Laporan'] = 'gate/Parkir';


$route['logout'] = 'auth/logout';
$route['login'] = 'auth/validate';
$route['Usernamecek'] = 'auth/Usernamecek';
$route['Passwordcek'] = 'auth/Passwordcek';
