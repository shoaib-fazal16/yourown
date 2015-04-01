<?php
// created: 2015-04-01 22:16:58
$dictionary["yo_siteactivity_accounts"] = array (
  'true_relationship_type' => 'one-to-many',
  'relationships' => 
  array (
    'yo_siteactivity_accounts' => 
    array (
      'lhs_module' => 'Accounts',
      'lhs_table' => 'accounts',
      'lhs_key' => 'id',
      'rhs_module' => 'yo_SiteActivity',
      'rhs_table' => 'yo_siteactivity',
      'rhs_key' => 'id',
      'relationship_type' => 'many-to-many',
      'join_table' => 'yo_siteactivity_accounts_c',
      'join_key_lhs' => 'yo_siteactivity_accountsaccounts_ida',
      'join_key_rhs' => 'yo_siteactivity_accountsyo_siteactivity_idb',
    ),
  ),
  'table' => 'yo_siteactivity_accounts_c',
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
      'name' => 'yo_siteactivity_accountsaccounts_ida',
      'type' => 'varchar',
      'len' => 36,
    ),
    4 => 
    array (
      'name' => 'yo_siteactivity_accountsyo_siteactivity_idb',
      'type' => 'varchar',
      'len' => 36,
    ),
  ),
  'indices' => 
  array (
    0 => 
    array (
      'name' => 'yo_siteactivity_accountsspk',
      'type' => 'primary',
      'fields' => 
      array (
        0 => 'id',
      ),
    ),
    1 => 
    array (
      'name' => 'yo_siteactivity_accounts_ida1',
      'type' => 'index',
      'fields' => 
      array (
        0 => 'yo_siteactivity_accountsaccounts_ida',
      ),
    ),
    2 => 
    array (
      'name' => 'yo_siteactivity_accounts_alt',
      'type' => 'alternate_key',
      'fields' => 
      array (
        0 => 'yo_siteactivity_accountsyo_siteactivity_idb',
      ),
    ),
  ),
);