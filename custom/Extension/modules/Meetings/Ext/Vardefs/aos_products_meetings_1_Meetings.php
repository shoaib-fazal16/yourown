<?php
// created: 2015-03-25 16:47:08
$dictionary["Meeting"]["fields"]["aos_products_meetings_1"] = array (
  'name' => 'aos_products_meetings_1',
  'type' => 'link',
  'relationship' => 'aos_products_meetings_1',
  'source' => 'non-db',
  'module' => 'AOS_Products',
  'bean_name' => 'AOS_Products',
  'vname' => 'LBL_AOS_PRODUCTS_MEETINGS_1_FROM_AOS_PRODUCTS_TITLE',
  'id_name' => 'aos_products_meetings_1aos_products_ida',
);
$dictionary["Meeting"]["fields"]["aos_products_meetings_1_name"] = array (
  'name' => 'aos_products_meetings_1_name',
  'type' => 'relate',
  'source' => 'non-db',
  'vname' => 'LBL_AOS_PRODUCTS_MEETINGS_1_FROM_AOS_PRODUCTS_TITLE',
  'save' => true,
  'id_name' => 'aos_products_meetings_1aos_products_ida',
  'link' => 'aos_products_meetings_1',
  'table' => 'aos_products',
  'module' => 'AOS_Products',
  'rname' => 'name',
);
$dictionary["Meeting"]["fields"]["aos_products_meetings_1aos_products_ida"] = array (
  'name' => 'aos_products_meetings_1aos_products_ida',
  'type' => 'link',
  'relationship' => 'aos_products_meetings_1',
  'source' => 'non-db',
  'reportable' => false,
  'side' => 'right',
  'vname' => 'LBL_AOS_PRODUCTS_MEETINGS_1_FROM_MEETINGS_TITLE',
);
