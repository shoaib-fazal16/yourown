<?php
$module_name = 'AOS_Products';
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
      'leads_aos_products_1_name' => 
      array (
        'type' => 'relate',
        'link' => true,
        'label' => 'LBL_LEADS_AOS_PRODUCTS_1_FROM_LEADS_TITLE',
        'id' => 'LEADS_AOS_PRODUCTS_1LEADS_IDA',
        'width' => '10%',
        'default' => true,
        'name' => 'leads_aos_products_1_name',
      ),
      'situs_state' => 
      array (
        'type' => 'enum',
        'default' => true,
        'studio' => 'visible',
        'label' => 'LBL_SITUS_STATE',
        'width' => '10%',
        'name' => 'situs_state',
      ),
      'lot_acres' => 
      array (
        'type' => 'varchar',
        'default' => true,
        'label' => 'LBL_LOT_ACRES',
        'width' => '10%',
        'name' => 'lot_acres',
      ),
      'yo_county_aos_products_name' => 
      array (
        'type' => 'relate',
        'link' => true,
        'label' => 'LBL_YO_COUNTY_AOS_PRODUCTS_FROM_YO_COUNTY_TITLE',
        'id' => 'YO_COUNTY_AOS_PRODUCTSYO_COUNTY_IDA',
        'width' => '10%',
        'default' => true,
        'name' => 'yo_county_aos_products_name',
      ),
      'phase' => 
      array (
        'type' => 'enum',
        'default' => true,
        'studio' => 'visible',
        'label' => 'LBL_PHASE',
        'width' => '10%',
        'name' => 'phase',
      ),
      'sync_property' => 
      array (
        'type' => 'varchar',
        'label' => 'LBL_SYNC_PROPERTY',
        'width' => '10%',
        'default' => true,
        'name' => 'sync_property',
      ),
      'created_by' => 
      array (
        'name' => 'created_by',
        'label' => 'LBL_CREATED',
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
    'widths' => 
    array (
      'label' => '10',
      'field' => '30',
    ),
  ),
);
?>
