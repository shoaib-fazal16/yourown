<?php
// created: 2015-03-22 13:19:17
$dictionary["AOS_Products"]["fields"]["yo_subdivisions_aos_products"] = array (
  'name' => 'yo_subdivisions_aos_products',
  'type' => 'link',
  'relationship' => 'yo_subdivisions_aos_products',
  'source' => 'non-db',
  'module' => 'yo_Subdivisions',
  'bean_name' => false,
  'vname' => 'LBL_YO_SUBDIVISIONS_AOS_PRODUCTS_FROM_YO_SUBDIVISIONS_TITLE',
  'id_name' => 'yo_subdivisions_aos_productsyo_subdivisions_ida',
);
$dictionary["AOS_Products"]["fields"]["yo_subdivisions_aos_products_name"] = array (
  'name' => 'yo_subdivisions_aos_products_name',
  'type' => 'relate',
  'source' => 'non-db',
  'vname' => 'LBL_YO_SUBDIVISIONS_AOS_PRODUCTS_FROM_YO_SUBDIVISIONS_TITLE',
  'save' => true,
  'id_name' => 'yo_subdivisions_aos_productsyo_subdivisions_ida',
  'link' => 'yo_subdivisions_aos_products',
  'table' => 'yo_subdivisions',
  'module' => 'yo_Subdivisions',
  'rname' => 'name',
);
$dictionary["AOS_Products"]["fields"]["yo_subdivisions_aos_productsyo_subdivisions_ida"] = array (
  'name' => 'yo_subdivisions_aos_productsyo_subdivisions_ida',
  'type' => 'link',
  'relationship' => 'yo_subdivisions_aos_products',
  'source' => 'non-db',
  'reportable' => false,
  'side' => 'right',
  'vname' => 'LBL_YO_SUBDIVISIONS_AOS_PRODUCTS_FROM_AOS_PRODUCTS_TITLE',
);
