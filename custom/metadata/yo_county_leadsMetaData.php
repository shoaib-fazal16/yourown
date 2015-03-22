<?php
// created: 2015-03-22 13:19:14
$dictionary["yo_county_leads"] = array (
  'true_relationship_type' => 'one-to-many',
  'relationships' => 
  array (
    'yo_county_leads' => 
    array (
      'lhs_module' => 'yo_County',
      'lhs_table' => 'yo_county',
      'lhs_key' => 'id',
      'rhs_module' => 'Leads',
      'rhs_table' => 'leads',
      'rhs_key' => 'id',
      'relationship_type' => 'many-to-many',
      'join_table' => 'yo_county_leads_c',
      'join_key_lhs' => 'yo_county_leadsyo_county_ida',
      'join_key_rhs' => 'yo_county_leadsleads_idb',
    ),
  ),
  'table' => 'yo_county_leads_c',
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
      'name' => 'yo_county_leadsyo_county_ida',
      'type' => 'varchar',
      'len' => 36,
    ),
    4 => 
    array (
      'name' => 'yo_county_leadsleads_idb',
      'type' => 'varchar',
      'len' => 36,
    ),
  ),
  'indices' => 
  array (
    0 => 
    array (
      'name' => 'yo_county_leadsspk',
      'type' => 'primary',
      'fields' => 
      array (
        0 => 'id',
      ),
    ),
    1 => 
    array (
      'name' => 'yo_county_leads_ida1',
      'type' => 'index',
      'fields' => 
      array (
        0 => 'yo_county_leadsyo_county_ida',
      ),
    ),
    2 => 
    array (
      'name' => 'yo_county_leads_alt',
      'type' => 'alternate_key',
      'fields' => 
      array (
        0 => 'yo_county_leadsleads_idb',
      ),
    ),
  ),
);