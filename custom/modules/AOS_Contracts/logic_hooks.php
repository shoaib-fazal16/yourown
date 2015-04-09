<?php
//AOS_Contracts logic hook
$hook_version = 1;
$hook_array = Array();

$hook_array['after_save'] = Array(); 
$hook_array['before_save'] = Array(); 
$hook_array['before_save'][] = Array(12, '', 'custom/modules/AOS_Contracts/PhaseChanges.php','PhaseChanges', 'execute');
$hook_array['after_save'][] = Array(10, '', 'custom/hook_func.php','hook', 'addProperties');
$hook_array['after_save'][] = Array(134, '', 'custom/hook_func.php','hook', 'createTask');
