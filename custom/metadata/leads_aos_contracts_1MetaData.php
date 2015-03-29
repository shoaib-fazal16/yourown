<?php
// created: 2015-03-29 08:19:26
$dictionary["leads_aos_contracts_1"] = array (
  'true_relationship_type' => 'one-to-one',
  'from_studio' => true,
  'relationships' => 
  array (
    'leads_aos_contracts_1' => 
    array (
      'lhs_module' => 'Leads',
      'lhs_table' => 'leads',
      'lhs_key' => 'id',
      'rhs_module' => 'AOS_Contracts',
      'rhs_table' => 'aos_contracts',
      'rhs_key' => 'id',
      'relationship_type' => 'many-to-many',
      'join_table' => 'leads_aos_contracts_1_c',
      'join_key_lhs' => 'leads_aos_contracts_1leads_ida',
      'join_key_rhs' => 'leads_aos_contracts_1aos_contracts_idb',
    ),
  ),
  'table' => 'leads_aos_contracts_1_c',
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
      'name' => 'leads_aos_contracts_1leads_ida',
      'type' => 'varchar',
      'len' => 36,
    ),
    4 => 
    array (
      'name' => 'leads_aos_contracts_1aos_contracts_idb',
      'type' => 'varchar',
      'len' => 36,
    ),
  ),
  'indices' => 
  array (
    0 => 
    array (
      'name' => 'leads_aos_contracts_1spk',
      'type' => 'primary',
      'fields' => 
      array (
        0 => 'id',
      ),
    ),
    1 => 
    array (
      'name' => 'leads_aos_contracts_1_ida1',
      'type' => 'index',
      'fields' => 
      array (
        0 => 'leads_aos_contracts_1leads_ida',
      ),
    ),
    2 => 
    array (
      'name' => 'leads_aos_contracts_1_idb2',
      'type' => 'index',
      'fields' => 
      array (
        0 => 'leads_aos_contracts_1aos_contracts_idb',
      ),
    ),
  ),
);