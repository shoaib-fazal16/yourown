<?php
$module_name = 'yo_Marketing';
$searchdefs [$module_name] = 
array (
  'layout' => 
  array (
    'basic_search' => 
    array (
      'name' => 
      array (
        'name' => 'name',
        'default' => true,
        'width' => '10%',
      ),
      'current_user_only' => 
      array (
        'name' => 'current_user_only',
        'label' => 'LBL_CURRENT_USER_FILTER',
        'type' => 'bool',
        'default' => true,
        'width' => '10%',
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
      'status' => 
      array (
        'type' => 'enum',
        'default' => true,
        'studio' => 'visible',
        'label' => 'LBL_STATUS',
        'width' => '10%',
        'name' => 'status',
      ),
      'yo_marketing_aos_products_name' => 
      array (
        'type' => 'relate',
        'link' => true,
        'label' => 'LBL_YO_MARKETING_AOS_PRODUCTS_FROM_AOS_PRODUCTS_TITLE',
        'width' => '10%',
        'default' => true,
        'id' => 'YO_MARKETING_AOS_PRODUCTSAOS_PRODUCTS_IDA',
        'name' => 'yo_marketing_aos_products_name',
      ),
      'date_of_month' => 
      array (
        'type' => 'varchar',
        'label' => 'LBL_DATE_OF_MONTH',
        'width' => '10%',
        'default' => true,
        'name' => 'date_of_month',
      ),
      'sold' => 
      array (
        'type' => 'date',
        'label' => 'LBL_SOLD',
        'width' => '10%',
        'default' => true,
        'name' => 'sold',
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
