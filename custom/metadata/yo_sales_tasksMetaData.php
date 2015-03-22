<?php
// created: 2015-03-22 15:32:01
$dictionary["yo_sales_tasks"] = array (
  'true_relationship_type' => 'many-to-many',
  'relationships' => 
  array (
    'yo_sales_tasks' => 
    array (
      'lhs_module' => 'yo_Sales',
      'lhs_table' => 'yo_sales',
      'lhs_key' => 'id',
      'rhs_module' => 'Tasks',
      'rhs_table' => 'tasks',
      'rhs_key' => 'id',
      'relationship_type' => 'many-to-many',
      'join_table' => 'yo_sales_tasks_c',
      'join_key_lhs' => 'yo_sales_tasksyo_sales_ida',
      'join_key_rhs' => 'yo_sales_taskstasks_idb',
    ),
  ),
  'table' => 'yo_sales_tasks_c',
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
      'name' => 'yo_sales_tasksyo_sales_ida',
      'type' => 'varchar',
      'len' => 36,
    ),
    4 => 
    array (
      'name' => 'yo_sales_taskstasks_idb',
      'type' => 'varchar',
      'len' => 36,
    ),
  ),
  'indices' => 
  array (
    0 => 
    array (
      'name' => 'yo_sales_tasksspk',
      'type' => 'primary',
      'fields' => 
      array (
        0 => 'id',
      ),
    ),
    1 => 
    array (
      'name' => 'yo_sales_tasks_alt',
      'type' => 'alternate_key',
      'fields' => 
      array (
        0 => 'yo_sales_tasksyo_sales_ida',
        1 => 'yo_sales_taskstasks_idb',
      ),
    ),
  ),
);