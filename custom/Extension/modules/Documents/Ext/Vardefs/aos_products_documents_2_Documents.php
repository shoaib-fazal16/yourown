<?php
// created: 2015-03-29 13:45:10
$dictionary["Document"]["fields"]["aos_products_documents_2"] = array (
  'name' => 'aos_products_documents_2',
  'type' => 'link',
  'relationship' => 'aos_products_documents_2',
  'source' => 'non-db',
  'module' => 'AOS_Products',
  'bean_name' => 'AOS_Products',
  'vname' => 'LBL_AOS_PRODUCTS_DOCUMENTS_2_FROM_AOS_PRODUCTS_TITLE',
  'id_name' => 'aos_products_documents_2aos_products_ida',
);
$dictionary["Document"]["fields"]["aos_products_documents_2_name"] = array (
  'name' => 'aos_products_documents_2_name',
  'type' => 'relate',
  'source' => 'non-db',
  'vname' => 'LBL_AOS_PRODUCTS_DOCUMENTS_2_FROM_AOS_PRODUCTS_TITLE',
  'save' => true,
  'id_name' => 'aos_products_documents_2aos_products_ida',
  'link' => 'aos_products_documents_2',
  'table' => 'aos_products',
  'module' => 'AOS_Products',
  'rname' => 'name',
);
$dictionary["Document"]["fields"]["aos_products_documents_2aos_products_ida"] = array (
  'name' => 'aos_products_documents_2aos_products_ida',
  'type' => 'link',
  'relationship' => 'aos_products_documents_2',
  'source' => 'non-db',
  'reportable' => false,
  'side' => 'right',
  'vname' => 'LBL_AOS_PRODUCTS_DOCUMENTS_2_FROM_DOCUMENTS_TITLE',
);
