<?php
$module_name = 'yo_AmortizationSchedule';
$listViewDefs [$module_name] = 
array (
  'YO_AMORTIZATIONSCHEDULE_YO_SALES_NAME' => 
  array (
    'type' => 'relate',
    'link' => true,
    'label' => 'LBL_YO_AMORTIZATIONSCHEDULE_YO_SALES_FROM_YO_SALES_TITLE',
    'id' => 'YO_AMORTIZATIONSCHEDULE_YO_SALESYO_SALES_IDA',
    'width' => '10%',
    'default' => true,
  ),
  'BBALANCE' => 
  array (
    'type' => 'currency',
    'label' => 'LBL_BBALANCE',
    'currency_format' => true,
    'width' => '10%',
    'default' => true,
  ),
  'NAME' => 
  array (
    'width' => '32%',
    'label' => 'LBL_NAME',
    'default' => true,
    'link' => true,
  ),
  'ASSIGNED_USER_NAME' => 
  array (
    'width' => '9%',
    'label' => 'LBL_ASSIGNED_TO_NAME',
    'module' => 'Employees',
    'id' => 'ASSIGNED_USER_ID',
    'default' => true,
  ),
);
?>
