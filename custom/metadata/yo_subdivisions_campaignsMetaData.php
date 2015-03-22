<?php
// created: 2015-03-22 13:19:17
$dictionary["yo_subdivisions_campaigns"] = array (
  'true_relationship_type' => 'one-to-many',
  'relationships' => 
  array (
    'yo_subdivisions_campaigns' => 
    array (
      'lhs_module' => 'yo_Subdivisions',
      'lhs_table' => 'yo_subdivisions',
      'lhs_key' => 'id',
      'rhs_module' => 'Campaigns',
      'rhs_table' => 'campaigns',
      'rhs_key' => 'id',
      'relationship_type' => 'many-to-many',
      'join_table' => 'yo_subdivisions_campaigns_c',
      'join_key_lhs' => 'yo_subdivisions_campaignsyo_subdivisions_ida',
      'join_key_rhs' => 'yo_subdivisions_campaignscampaigns_idb',
    ),
  ),
  'table' => 'yo_subdivisions_campaigns_c',
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
      'name' => 'yo_subdivisions_campaignsyo_subdivisions_ida',
      'type' => 'varchar',
      'len' => 36,
    ),
    4 => 
    array (
      'name' => 'yo_subdivisions_campaignscampaigns_idb',
      'type' => 'varchar',
      'len' => 36,
    ),
  ),
  'indices' => 
  array (
    0 => 
    array (
      'name' => 'yo_subdivisions_campaignsspk',
      'type' => 'primary',
      'fields' => 
      array (
        0 => 'id',
      ),
    ),
    1 => 
    array (
      'name' => 'yo_subdivisions_campaigns_ida1',
      'type' => 'index',
      'fields' => 
      array (
        0 => 'yo_subdivisions_campaignsyo_subdivisions_ida',
      ),
    ),
    2 => 
    array (
      'name' => 'yo_subdivisions_campaigns_alt',
      'type' => 'alternate_key',
      'fields' => 
      array (
        0 => 'yo_subdivisions_campaignscampaigns_idb',
      ),
    ),
  ),
);