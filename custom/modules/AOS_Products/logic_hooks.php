<?php

$hook_version = 1; 
$hook_array = Array(); 
$hook_array['after_save'][] = Array(3, 'doContractRecalc', 'custom/hook_func.php','hook', 'doContractRecalc'); 
$hook_array['process_record'][] = Array(1, 'Other_Shows', 'custom/modules/AOS_Products/sync_logic_hooks.php','sync_logic_hooks', 'list_record_process');
$hook_array['before_save'][] = Array(1, 'createContract', 'custom/modules/AOS_Products/create_contract_logic_hook.php','create_contract_logic_hook', 'createContract');
$hook_array['before_save'][] = Array(12, '', 'custom/modules/AOS_Products/ProductPhaseChanges.php','ProductPhaseChanges', 'execute');
