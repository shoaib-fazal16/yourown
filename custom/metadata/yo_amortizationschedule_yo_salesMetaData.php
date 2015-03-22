<?php
// created: 2015-03-22 17:52:16
$dictionary["yo_amortizationschedule_yo_sales"] = array (
  'true_relationship_type' => 'one-to-many',
  'relationships' => 
  array (
    'yo_amortizationschedule_yo_sales' => 
    array (
      'lhs_module' => 'yo_Sales',
      'lhs_table' => 'yo_sales',
      'lhs_key' => 'id',
      'rhs_module' => 'yo_AmortizationSchedule',
      'rhs_table' => 'yo_amortizationschedule',
      'rhs_key' => 'id',
      'relationship_type' => 'many-to-many',
      'join_table' => 'yo_amortizationschedule_yo_sales_c',
      'join_key_lhs' => 'yo_amortizationschedule_yo_salesyo_sales_ida',
      'join_key_rhs' => 'yo_amortizationschedule_yo_salesyo_amortizationschedule_idb',
    ),
  ),
  'table' => 'yo_amortizationschedule_yo_sales_c',
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
      'name' => 'yo_amortizationschedule_yo_salesyo_sales_ida',
      'type' => 'varchar',
      'len' => 36,
    ),
    4 => 
    array (
      'name' => 'yo_amortizationschedule_yo_salesyo_amortizationschedule_idb',
      'type' => 'varchar',
      'len' => 36,
    ),
  ),
  'indices' => 
  array (
    0 => 
    array (
      'name' => 'yo_amortizationschedule_yo_salesspk',
      'type' => 'primary',
      'fields' => 
      array (
        0 => 'id',
      ),
    ),
    1 => 
    array (
      'name' => 'yo_amortizationschedule_yo_sales_ida1',
      'type' => 'index',
      'fields' => 
      array (
        0 => 'yo_amortizationschedule_yo_salesyo_sales_ida',
      ),
    ),
    2 => 
    array (
      'name' => 'yo_amortizationschedule_yo_sales_alt',
      'type' => 'alternate_key',
      'fields' => 
      array (
        0 => 'yo_amortizationschedule_yo_salesyo_amortizationschedule_idb',
      ),
    ),
  ),
);