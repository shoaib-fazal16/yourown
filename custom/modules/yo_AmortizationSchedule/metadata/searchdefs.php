<?php
$module_name = 'yo_AmortizationSchedule';
$searchdefs [$module_name] = 
array (
  'layout' => 
  array (
    'basic_search' => 
    array (
      0 => 'name',
      1 => 
      array (
        'name' => 'current_user_only',
        'label' => 'LBL_CURRENT_USER_FILTER',
        'type' => 'bool',
      ),
    ),
    'advanced_search' => 
    array (
      'name' => 
      array (
        'name' => 'name',
        'default' => true,
        'width' => '10%',
      ),
      'yo_amortizationschedule_yo_sales_name' => 
      array (
        'type' => 'relate',
        'link' => true,
        'label' => 'LBL_YO_AMORTIZATIONSCHEDULE_YO_SALES_FROM_YO_SALES_TITLE',
        'id' => 'YO_AMORTIZATIONSCHEDULE_YO_SALESYO_SALES_IDA',
        'width' => '10%',
        'default' => true,
        'name' => 'yo_amortizationschedule_yo_sales_name',
      ),
      'assigned_user_id' => 
      array (
        'name' => 'assigned_user_id',
        'label' => 'LBL_ASSIGNED_TO',
        'type' => 'enum',
        'function' => 
        array (
          'name' => 'get_user_array',
          'params' => 
          array (
            0 => false,
          ),
        ),
        'default' => true,
        'width' => '10%',
      ),
    ),
  ),
  'templateMeta' => 
  array (
    'maxColumns' => '3',
    'maxColumnsBasic' => '4',
    'widths' => 
    array (
      'label' => '10',
      'field' => '30',
    ),
  ),
);
?>
