<?php
// created: 2015-03-22 15:32:01
$dictionary["yo_sales_aos_products"] = array (
  'true_relationship_type' => 'one-to-many',
  'relationships' => 
  array (
    'yo_sales_aos_products' => 
    array (
	  'lhs_module' => 'AOS_Products',
      'lhs_table' => 'aos_products',
      'lhs_key' => 'id',
      'rhs_module' => 'yo_Sales',
      'rhs_table' => 'yo_sales',
      'rhs_key' => 'id',
      'relationship_type' => 'many-to-many',
      'join_table' => 'yo_sales_aos_products_c',
	  'join_key_lhs' => 'yo_sales_aos_productsaos_products_idb',
      'join_key_rhs' => 'yo_sales_aos_productsyo_sales_ida',    
    ),
  ),
  'table' => 'yo_sales_aos_products_c',
  'fields' => 
  array (
    0 => 
    array (
      'name' => 'id',
      'type' => 'varchar',
      'len' => 36,
    ),
    1 => 
    array (
      'name' => 'date_modified',
      'type' => 'datetime',
    ),
    2 => 
    array (
      'name' => 'deleted',
      'type' => 'bool',
      'len' => '1',
      'default' => '0',
      'required' => true,
    ),
    3 => 
    array (
      'name' => 'yo_sales_aos_productsyo_sales_ida',
      'type' => 'varchar',
      'len' => 36,
    ),
    4 => 
    array (
      'name' => 'yo_sales_aos_productsaos_products_idb',
      'type' => 'varchar',
      'len' => 36,
    ),
  ),
  'indices' => 
  array (
    0 => 
    array (
      'name' => 'yo_sales_aos_productsspk',
      'type' => 'primary',
      'fields' => 
      array (
        0 => 'id',
      ),
    ),
    1 => 
    array (
      'name' => 'yo_sales_aos_products_ida1',
      'type' => 'index',
      'fields' => 
      array (
        0 => 'yo_sales_aos_productsyo_sales_ida',
      ),
    ),
    2 => 
    array (
      'name' => 'yo_sales_aos_products_idb2',
      'type' => 'index',
      'fields' => 
      array (
        0 => 'yo_sales_aos_productsaos_products_idb',
      ),
    ),
  ),
);