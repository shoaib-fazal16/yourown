<?php
// created: 2015-03-22 15:31:58
$dictionary["yo_investingentity_aos_products"] = array (
  'true_relationship_type' => 'one-to-many',
  'relationships' => 
  array (
    'yo_investingentity_aos_products' => 
    array (
      'lhs_module' => 'yo_InvestingEntity',
      'lhs_table' => 'yo_investingentity',
      'lhs_key' => 'id',
      'rhs_module' => 'AOS_Products',
      'rhs_table' => 'aos_products',
      'rhs_key' => 'id',
      'relationship_type' => 'many-to-many',
      'join_table' => 'yo_investingentity_aos_products_c',
      'join_key_lhs' => 'yo_investingentity_aos_productsyo_investingentity_ida',
      'join_key_rhs' => 'yo_investingentity_aos_productsaos_products_idb',
    ),
  ),
  'table' => 'yo_investingentity_aos_products_c',
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
      'name' => 'yo_investingentity_aos_productsyo_investingentity_ida',
      'type' => 'varchar',
      'len' => 36,
    ),
    4 => 
    array (
      'name' => 'yo_investingentity_aos_productsaos_products_idb',
      'type' => 'varchar',
      'len' => 36,
    ),
  ),
  'indices' => 
  array (
    0 => 
    array (
      'name' => 'yo_investingentity_aos_productsspk',
      'type' => 'primary',
      'fields' => 
      array (
        0 => 'id',
      ),
    ),
    1 => 
    array (
      'name' => 'yo_investingentity_aos_products_ida1',
      'type' => 'index',
      'fields' => 
      array (
        0 => 'yo_investingentity_aos_productsyo_investingentity_ida',
      ),
    ),
    2 => 
    array (
      'name' => 'yo_investingentity_aos_products_alt',
      'type' => 'alternate_key',
      'fields' => 
      array (
        0 => 'yo_investingentity_aos_productsaos_products_idb',
      ),
    ),
  ),
);