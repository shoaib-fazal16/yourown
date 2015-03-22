<?php
// created: 2015-03-22 15:32:02
$dictionary["AOS_Products"]["fields"]["yo_sales_aos_products"] = array (
  'name' => 'yo_sales_aos_products',
  'type' => 'link',
  'relationship' => 'yo_sales_aos_products',
  'source' => 'non-db',
  'module' => 'yo_Sales',
  'bean_name' => false,
  'vname' => 'LBL_YO_SALES_AOS_PRODUCTS_FROM_YO_SALES_TITLE',
  'id_name' => 'yo_sales_aos_productsyo_sales_ida',
);
$dictionary["AOS_Products"]["fields"]["yo_sales_aos_products_name"] = array (
  'name' => 'yo_sales_aos_products_name',
  'type' => 'relate',
  'source' => 'non-db',
  'vname' => 'LBL_YO_SALES_AOS_PRODUCTS_FROM_YO_SALES_TITLE',
  'save' => true,
  'id_name' => 'yo_sales_aos_productsyo_sales_ida',
  'link' => 'yo_sales_aos_products',
  'table' => 'yo_sales',
  'module' => 'yo_Sales',
  'rname' => 'name',
);
$dictionary["AOS_Products"]["fields"]["yo_sales_aos_productsyo_sales_ida"] = array (
  'name' => 'yo_sales_aos_productsyo_sales_ida',
  'type' => 'link',
  'relationship' => 'yo_sales_aos_products',
  'source' => 'non-db',
  'reportable' => false,
  'side' => 'left',
  'vname' => 'LBL_YO_SALES_AOS_PRODUCTS_FROM_YO_SALES_TITLE',
);
