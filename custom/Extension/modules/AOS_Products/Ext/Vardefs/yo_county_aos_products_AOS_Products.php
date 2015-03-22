<?php
// created: 2015-03-22 13:19:16
$dictionary["AOS_Products"]["fields"]["yo_county_aos_products"] = array (
  'name' => 'yo_county_aos_products',
  'type' => 'link',
  'relationship' => 'yo_county_aos_products',
  'source' => 'non-db',
  'module' => 'yo_County',
  'bean_name' => false,
  'vname' => 'LBL_YO_COUNTY_AOS_PRODUCTS_FROM_YO_COUNTY_TITLE',
  'id_name' => 'yo_county_aos_productsyo_county_ida',
);
$dictionary["AOS_Products"]["fields"]["yo_county_aos_products_name"] = array (
  'name' => 'yo_county_aos_products_name',
  'type' => 'relate',
  'source' => 'non-db',
  'vname' => 'LBL_YO_COUNTY_AOS_PRODUCTS_FROM_YO_COUNTY_TITLE',
  'save' => true,
  'id_name' => 'yo_county_aos_productsyo_county_ida',
  'link' => 'yo_county_aos_products',
  'table' => 'yo_county',
  'module' => 'yo_County',
  'rname' => 'name',
);
$dictionary["AOS_Products"]["fields"]["yo_county_aos_productsyo_county_ida"] = array (
  'name' => 'yo_county_aos_productsyo_county_ida',
  'type' => 'link',
  'relationship' => 'yo_county_aos_products',
  'source' => 'non-db',
  'reportable' => false,
  'side' => 'right',
  'vname' => 'LBL_YO_COUNTY_AOS_PRODUCTS_FROM_AOS_PRODUCTS_TITLE',
);
