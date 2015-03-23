<?php
// created: 2015-03-23 15:31:08
$dictionary["yo_marketing_yo_investingentity"] = array (
  'true_relationship_type' => 'one-to-many',
  'relationships' => 
  array (
    'yo_marketing_yo_investingentity' => 
    array (
      'lhs_module' => 'yo_InvestingEntity',
      'lhs_table' => 'yo_investingentity',
      'lhs_key' => 'id',
      'rhs_module' => 'yo_Marketing',
      'rhs_table' => 'yo_marketing',
      'rhs_key' => 'id',
      'relationship_type' => 'many-to-many',
      'join_table' => 'yo_marketing_yo_investingentity_c',
      'join_key_lhs' => 'yo_marketing_yo_investingentityyo_investingentity_ida',
      'join_key_rhs' => 'yo_marketing_yo_investingentityyo_marketing_idb',
    ),
  ),
  'table' => 'yo_marketing_yo_investingentity_c',
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
      'name' => 'yo_marketing_yo_investingentityyo_investingentity_ida',
      'type' => 'varchar',
      'len' => 36,
    ),
    4 => 
    array (
      'name' => 'yo_marketing_yo_investingentityyo_marketing_idb',
      'type' => 'varchar',
      'len' => 36,
    ),
  ),
  'indices' => 
  array (
    0 => 
    array (
      'name' => 'yo_marketing_yo_investingentityspk',
      'type' => 'primary',
      'fields' => 
      array (
        0 => 'id',
      ),
    ),
    1 => 
    array (
      'name' => 'yo_marketing_yo_investingentity_ida1',
      'type' => 'index',
      'fields' => 
      array (
        0 => 'yo_marketing_yo_investingentityyo_investingentity_ida',
      ),
    ),
    2 => 
    array (
      'name' => 'yo_marketing_yo_investingentity_alt',
      'type' => 'alternate_key',
      'fields' => 
      array (
        0 => 'yo_marketing_yo_investingentityyo_marketing_idb',
      ),
    ),
  ),
);