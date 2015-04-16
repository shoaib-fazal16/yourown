<?php
// created: 2015-04-16 18:16:56
$dictionary["yo_chanoftitles_aos_products"] = array (
  'true_relationship_type' => 'one-to-many',
  'relationships' => 
  array (
    'yo_chanoftitles_aos_products' => 
    array (
      'lhs_module' => 'AOS_Products',
      'lhs_table' => 'aos_products',
      'lhs_key' => 'id',
      'rhs_module' => 'yo_ChanOfTitles',
      'rhs_table' => 'yo_chanoftitles',
      'rhs_key' => 'id',
      'relationship_type' => 'many-to-many',
      'join_table' => 'yo_chanoftitles_aos_products_c',
      'join_key_lhs' => 'yo_chanoftitles_aos_productsaos_products_ida',
      'join_key_rhs' => 'yo_chanoftitles_aos_productsyo_chanoftitles_idb',
    ),
  ),
  'table' => 'yo_chanoftitles_aos_products_c',
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
      'name' => 'yo_chanoftitles_aos_productsaos_products_ida',
      'type' => 'varchar',
      'len' => 36,
    ),
    4 => 
    array (
      'name' => 'yo_chanoftitles_aos_productsyo_chanoftitles_idb',
      'type' => 'varchar',
      'len' => 36,
    ),
  ),
  'indices' => 
  array (
    0 => 
    array (
      'name' => 'yo_chanoftitles_aos_productsspk',
      'type' => 'primary',
      'fields' => 
      array (
        0 => 'id',
      ),
    ),
    1 => 
    array (
      'name' => 'yo_chanoftitles_aos_products_ida1',
      'type' => 'index',
      'fields' => 
      array (
        0 => 'yo_chanoftitles_aos_productsaos_products_ida',
      ),
    ),
    2 => 
    array (
      'name' => 'yo_chanoftitles_aos_products_alt',
      'type' => 'alternate_key',
      'fields' => 
      array (
        0 => 'yo_chanoftitles_aos_productsyo_chanoftitles_idb',
      ),
    ),
  ),
);