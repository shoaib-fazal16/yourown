<?php
// created: 2015-04-16 18:16:56
$dictionary["yo_ChanOfTitles"]["fields"]["yo_chanoftitles_aos_products"] = array (
  'name' => 'yo_chanoftitles_aos_products',
  'type' => 'link',
  'relationship' => 'yo_chanoftitles_aos_products',
  'source' => 'non-db',
  'module' => 'AOS_Products',
  'bean_name' => 'AOS_Products',
  'vname' => 'LBL_YO_CHANOFTITLES_AOS_PRODUCTS_FROM_AOS_PRODUCTS_TITLE',
  'id_name' => 'yo_chanoftitles_aos_productsaos_products_ida',
);
$dictionary["yo_ChanOfTitles"]["fields"]["yo_chanoftitles_aos_products_name"] = array (
  'name' => 'yo_chanoftitles_aos_products_name',
  'type' => 'relate',
  'source' => 'non-db',
  'vname' => 'LBL_YO_CHANOFTITLES_AOS_PRODUCTS_FROM_AOS_PRODUCTS_TITLE',
  'save' => true,
  'id_name' => 'yo_chanoftitles_aos_productsaos_products_ida',
  'link' => 'yo_chanoftitles_aos_products',
  'table' => 'aos_products',
  'module' => 'AOS_Products',
  'rname' => 'name',
);
$dictionary["yo_ChanOfTitles"]["fields"]["yo_chanoftitles_aos_productsaos_products_ida"] = array (
  'name' => 'yo_chanoftitles_aos_productsaos_products_ida',
  'type' => 'link',
  'relationship' => 'yo_chanoftitles_aos_products',
  'source' => 'non-db',
  'reportable' => false,
  'side' => 'right',
  'vname' => 'LBL_YO_CHANOFTITLES_AOS_PRODUCTS_FROM_YO_CHANOFTITLES_TITLE',
);
