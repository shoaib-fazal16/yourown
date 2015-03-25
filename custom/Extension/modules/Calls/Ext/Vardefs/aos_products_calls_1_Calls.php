<?php
// created: 2015-03-25 17:08:34
$dictionary["Call"]["fields"]["aos_products_calls_1"] = array (
  'name' => 'aos_products_calls_1',
  'type' => 'link',
  'relationship' => 'aos_products_calls_1',
  'source' => 'non-db',
  'module' => 'AOS_Products',
  'bean_name' => 'AOS_Products',
  'vname' => 'LBL_AOS_PRODUCTS_CALLS_1_FROM_AOS_PRODUCTS_TITLE',
  'id_name' => 'aos_products_calls_1aos_products_ida',
);
$dictionary["Call"]["fields"]["aos_products_calls_1_name"] = array (
  'name' => 'aos_products_calls_1_name',
  'type' => 'relate',
  'source' => 'non-db',
  'vname' => 'LBL_AOS_PRODUCTS_CALLS_1_FROM_AOS_PRODUCTS_TITLE',
  'save' => true,
  'id_name' => 'aos_products_calls_1aos_products_ida',
  'link' => 'aos_products_calls_1',
  'table' => 'aos_products',
  'module' => 'AOS_Products',
  'rname' => 'name',
);
$dictionary["Call"]["fields"]["aos_products_calls_1aos_products_ida"] = array (
  'name' => 'aos_products_calls_1aos_products_ida',
  'type' => 'link',
  'relationship' => 'aos_products_calls_1',
  'source' => 'non-db',
  'reportable' => false,
  'side' => 'right',
  'vname' => 'LBL_AOS_PRODUCTS_CALLS_1_FROM_CALLS_TITLE',
);
