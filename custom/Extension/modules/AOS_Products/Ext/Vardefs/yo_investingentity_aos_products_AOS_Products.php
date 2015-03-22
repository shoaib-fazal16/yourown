<?php
// created: 2015-03-22 15:31:58
$dictionary["AOS_Products"]["fields"]["yo_investingentity_aos_products"] = array (
  'name' => 'yo_investingentity_aos_products',
  'type' => 'link',
  'relationship' => 'yo_investingentity_aos_products',
  'source' => 'non-db',
  'module' => 'yo_InvestingEntity',
  'bean_name' => false,
  'vname' => 'LBL_YO_INVESTINGENTITY_AOS_PRODUCTS_FROM_YO_INVESTINGENTITY_TITLE',
  'id_name' => 'yo_investingentity_aos_productsyo_investingentity_ida',
);
$dictionary["AOS_Products"]["fields"]["yo_investingentity_aos_products_name"] = array (
  'name' => 'yo_investingentity_aos_products_name',
  'type' => 'relate',
  'source' => 'non-db',
  'vname' => 'LBL_YO_INVESTINGENTITY_AOS_PRODUCTS_FROM_YO_INVESTINGENTITY_TITLE',
  'save' => true,
  'id_name' => 'yo_investingentity_aos_productsyo_investingentity_ida',
  'link' => 'yo_investingentity_aos_products',
  'table' => 'yo_investingentity',
  'module' => 'yo_InvestingEntity',
  'rname' => 'name',
);
$dictionary["AOS_Products"]["fields"]["yo_investingentity_aos_productsyo_investingentity_ida"] = array (
  'name' => 'yo_investingentity_aos_productsyo_investingentity_ida',
  'type' => 'link',
  'relationship' => 'yo_investingentity_aos_products',
  'source' => 'non-db',
  'reportable' => false,
  'side' => 'right',
  'vname' => 'LBL_YO_INVESTINGENTITY_AOS_PRODUCTS_FROM_AOS_PRODUCTS_TITLE',
);
