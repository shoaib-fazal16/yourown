<?php
// created: 2015-03-25 17:16:06
$dictionary["AOS_Products"]["fields"]["aos_contracts_aos_products_1"] = array (
  'name' => 'aos_contracts_aos_products_1',
  'type' => 'link',
  'relationship' => 'aos_contracts_aos_products_1',
  'source' => 'non-db',
  'module' => 'AOS_Contracts',
  'bean_name' => 'AOS_Contracts',
  'vname' => 'LBL_AOS_CONTRACTS_AOS_PRODUCTS_1_FROM_AOS_CONTRACTS_TITLE',
  'id_name' => 'aos_contracts_aos_products_1aos_contracts_ida',
);
$dictionary["AOS_Products"]["fields"]["aos_contracts_aos_products_1_name"] = array (
  'name' => 'aos_contracts_aos_products_1_name',
  'type' => 'relate',
  'source' => 'non-db',
  'vname' => 'LBL_AOS_CONTRACTS_AOS_PRODUCTS_1_FROM_AOS_CONTRACTS_TITLE',
  'save' => true,
  'id_name' => 'aos_contracts_aos_products_1aos_contracts_ida',
  'link' => 'aos_contracts_aos_products_1',
  'table' => 'aos_contracts',
  'module' => 'AOS_Contracts',
  'rname' => 'name',
);
$dictionary["AOS_Products"]["fields"]["aos_contracts_aos_products_1aos_contracts_ida"] = array (
  'name' => 'aos_contracts_aos_products_1aos_contracts_ida',
  'type' => 'link',
  'relationship' => 'aos_contracts_aos_products_1',
  'source' => 'non-db',
  'reportable' => false,
  'side' => 'right',
  'vname' => 'LBL_AOS_CONTRACTS_AOS_PRODUCTS_1_FROM_AOS_PRODUCTS_TITLE',
);
