<?php
$listViewDefs ['AOS_Products'] = 
array (
  'LEADS_AOS_PRODUCTS_1_NAME' => 
  array (
    'type' => 'relate',
    'link' => true,
    'label' => 'LBL_LEADS_AOS_PRODUCTS_1_FROM_LEADS_TITLE',
    'id' => 'LEADS_AOS_PRODUCTS_1LEADS_IDA',
    'width' => '10%',
    'default' => true,
  ),
  'DATE_ENTERED' => 
  array (
    'width' => '5%',
    'label' => 'LBL_DATE_ENTERED',
    'default' => true,
  ),
  'NAME' => 
  array (
    'width' => '15%',
    'label' => 'LBL_NAME',
    'default' => true,
    'link' => true,
  ),
  'SITUS_STATE' => 
  array (
    'type' => 'enum',
    'default' => true,
    'studio' => 'visible',
    'label' => 'LBL_SITUS_STATE',
    'width' => '10%',
  ),
  'YO_SUBDIVISIONS_AOS_PRODUCTS_NAME' => 
  array (
    'type' => 'relate',
    'link' => true,
    'label' => 'LBL_YO_SUBDIVISIONS_AOS_PRODUCTS_FROM_YO_SUBDIVISIONS_TITLE',
    'id' => 'YO_SUBDIVISIONS_AOS_PRODUCTSYO_SUBDIVISIONS_IDA',
    'width' => '10%',
    'default' => true,
  ),
  'LEGAL_DESCRIPTION' => 
  array (
    'type' => 'text',
    'default' => true,
    'studio' => 'visible',
    'label' => 'LBL_LEGAL_DESCRIPTION',
    'sortable' => false,
    'width' => '10%',
  ),
  'YO_COUNTY_AOS_PRODUCTS_NAME' => 
  array (
    'type' => 'relate',
    'link' => true,
    'label' => 'LBL_YO_COUNTY_AOS_PRODUCTS_FROM_YO_COUNTY_TITLE',
    'id' => 'YO_COUNTY_AOS_PRODUCTSYO_COUNTY_IDA',
    'width' => '10%',
    'default' => true,
  ),
  'DATE_MODIFIED' => 
  array (
    'type' => 'datetime',
    'label' => 'LBL_DATE_MODIFIED',
    'width' => '10%',
    'default' => true,
  ),
  'YO_SALES_AOS_PRODUCTS_NAME' => 
  array (
    'type' => 'relate',
    'link' => true,
    'label' => 'LBL_YO_SALES_AOS_PRODUCTS_FROM_YO_SALES_TITLE',
    'id' => 'YO_SALES_AOS_PRODUCTSYO_SALES_IDA',
    'width' => '10%',
    'default' => true,
  ),
  'SYNC_PROPERTY' => 
  array (
    'type' => 'varchar',
    'label' => 'LBL_SYNC_PROPERTY',
    'width' => '10%',
    'default' => true,
  ),
);
?>
