<?php
// created: 2015-03-22 15:32:02
$dictionary["yo_Sales"]["fields"]["yo_sales_aos_products"] = array (
  'name' => 'yo_sales_aos_products',
  'type' => 'link',
  'relationship' => 'yo_sales_aos_products',
  'source' => 'non-db',
  'module' => 'AOS_Products',
  'bean_name' => 'AOS_Products',
  'vname' => 'LBL_YO_SALES_AOS_PRODUCTS_FROM_AOS_PRODUCTS_TITLE',
  'id_name' => 'yo_sales_aos_productsaos_products_idb',
);
$dictionary["yo_Sales"]["fields"]["yo_sales_aos_products_name"] = array (
  'name' => 'yo_sales_aos_products_name',
  'type' => 'relate',
  'source' => 'non-db',
  'vname' => 'LBL_YO_SALES_AOS_PRODUCTS_FROM_AOS_PRODUCTS_TITLE',
  'save' => true,
  'id_name' => 'yo_sales_aos_productsaos_products_idb',
  'link' => 'yo_sales_aos_products',
  'table' => 'aos_products',
  'module' => 'AOS_Products',
  'rname' => 'name',
);
$dictionary["yo_Sales"]["fields"]["yo_sales_aos_productsaos_products_idb"] = array (
  'name' => 'yo_sales_aos_productsaos_products_idb',
  'type' => 'link',
  'relationship' => 'yo_sales_aos_products',
  'source' => 'non-db',
  'reportable' => false,
  'side' => 'left',
  'vname' => 'LBL_YO_SALES_AOS_PRODUCTS_FROM_AOS_PRODUCTS_TITLE',
);
