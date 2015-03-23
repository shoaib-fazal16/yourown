<?php
// created: 2015-03-23 15:31:08
$dictionary["yo_Marketing"]["fields"]["yo_marketing_aos_products"] = array (
  'name' => 'yo_marketing_aos_products',
  'type' => 'link',
  'relationship' => 'yo_marketing_aos_products',
  'source' => 'non-db',
  'module' => 'AOS_Products',
  'bean_name' => 'AOS_Products',
  'vname' => 'LBL_YO_MARKETING_AOS_PRODUCTS_FROM_AOS_PRODUCTS_TITLE',
  'id_name' => 'yo_marketing_aos_productsaos_products_ida',
);
$dictionary["yo_Marketing"]["fields"]["yo_marketing_aos_products_name"] = array (
  'name' => 'yo_marketing_aos_products_name',
  'type' => 'relate',
  'source' => 'non-db',
  'vname' => 'LBL_YO_MARKETING_AOS_PRODUCTS_FROM_AOS_PRODUCTS_TITLE',
  'save' => true,
  'id_name' => 'yo_marketing_aos_productsaos_products_ida',
  'link' => 'yo_marketing_aos_products',
  'table' => 'aos_products',
  'module' => 'AOS_Products',
  'rname' => 'name',
);
$dictionary["yo_Marketing"]["fields"]["yo_marketing_aos_productsaos_products_ida"] = array (
  'name' => 'yo_marketing_aos_productsaos_products_ida',
  'type' => 'link',
  'relationship' => 'yo_marketing_aos_products',
  'source' => 'non-db',
  'reportable' => false,
  'side' => 'right',
  'vname' => 'LBL_YO_MARKETING_AOS_PRODUCTS_FROM_YO_MARKETING_TITLE',
);
