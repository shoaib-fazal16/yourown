<?php
// created: 2015-03-23 15:31:08
$dictionary["yo_marketing_tasks"] = array (
  'true_relationship_type' => 'one-to-many',
  'relationships' => 
  array (
    'yo_marketing_tasks' => 
    array (
      'lhs_module' => 'yo_Marketing',
      'lhs_table' => 'yo_marketing',
      'lhs_key' => 'id',
      'rhs_module' => 'Tasks',
      'rhs_table' => 'tasks',
      'rhs_key' => 'id',
      'relationship_type' => 'many-to-many',
      'join_table' => 'yo_marketing_tasks_c',
      'join_key_lhs' => 'yo_marketing_tasksyo_marketing_ida',
      'join_key_rhs' => 'yo_marketing_taskstasks_idb',
    ),
  ),
  'table' => 'yo_marketing_tasks_c',
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
      'name' => 'yo_marketing_tasksyo_marketing_ida',
      'type' => 'varchar',
      'len' => 36,
    ),
    4 => 
    array (
      'name' => 'yo_marketing_taskstasks_idb',
      'type' => 'varchar',
      'len' => 36,
    ),
  ),
  'indices' => 
  array (
    0 => 
    array (
      'name' => 'yo_marketing_tasksspk',
      'type' => 'primary',
      'fields' => 
      array (
        0 => 'id',
      ),
    ),
    1 => 
    array (
      'name' => 'yo_marketing_tasks_ida1',
      'type' => 'index',
      'fields' => 
      array (
        0 => 'yo_marketing_tasksyo_marketing_ida',
      ),
    ),
    2 => 
    array (
      'name' => 'yo_marketing_tasks_alt',
      'type' => 'alternate_key',
      'fields' => 
      array (
        0 => 'yo_marketing_taskstasks_idb',
      ),
    ),
  ),
);