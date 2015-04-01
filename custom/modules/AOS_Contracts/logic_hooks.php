<?php
//AOS_Contracts logic hook
$hook_version = 1;
$hook_array = Array();

$hook_array['after_save'] = Array(); 
$hook_array['after_save'][] = Array(10, '', 'custom/hook_func.php','hook', 'addProperties');
$hook_array['after_save'][] = Array(10, '', 'custom/hook_func.php','hook', 'createTask');
