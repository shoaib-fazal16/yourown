<?php
$module_name = 'yo_Marketing';
$listViewDefs [$module_name] = 
array (
  'NAME' => 
  array (
    'width' => '32%',
    'label' => 'LBL_NAME',
    'default' => true,
    'link' => true,
  ),
  'STATUS' => 
  array (
    'type' => 'enum',
    'default' => true,
    'studio' => 'visible',
    'label' => 'LBL_STATUS',
    'width' => '10%',
  ),
  'YO_MARKETING_AOS_PRODUCTS_NAME' => 
  array (
    'type' => 'relate',
    'link' => true,
    'label' => 'LBL_YO_MARKETING_AOS_PRODUCTS_FROM_AOS_PRODUCTS_TITLE',
    'id' => 'YO_MARKETING_AOS_PRODUCTSAOS_PRODUCTS_IDA',
    'width' => '10%',
    'default' => true,
  ),
  'DATE_OF_MONTH' => 
  array (
    'type' => 'varchar',
    'label' => 'LBL_DATE_OF_MONTH',
    'width' => '10%',
    'default' => true,
  ),
  'LISTING_TITLE' => 
  array (
    'type' => 'varchar',
    'label' => 'LBL_LISTING_TITLE',
    'width' => '10%',
    'default' => true,
  ),
  'AVAILABLE_FOR_SALE' => 
  array (
    'type' => 'date',
    'label' => 'LBL_AVAILABLE_FOR_SALE',
    'width' => '10%',
    'default' => true,
  ),
  'LISTING_URL' => 
  array (
    'type' => 'url',
    'label' => 'LBL_LISTING_URL',
    'width' => '10%',
    'default' => true,
  ),
);
?>
