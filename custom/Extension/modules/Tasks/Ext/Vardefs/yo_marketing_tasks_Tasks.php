<?php
// created: 2015-03-23 15:31:09
$dictionary["Task"]["fields"]["yo_marketing_tasks"] = array (
  'name' => 'yo_marketing_tasks',
  'type' => 'link',
  'relationship' => 'yo_marketing_tasks',
  'source' => 'non-db',
  'module' => 'yo_Marketing',
  'bean_name' => false,
  'vname' => 'LBL_YO_MARKETING_TASKS_FROM_YO_MARKETING_TITLE',
  'id_name' => 'yo_marketing_tasksyo_marketing_ida',
);
$dictionary["Task"]["fields"]["yo_marketing_tasks_name"] = array (
  'name' => 'yo_marketing_tasks_name',
  'type' => 'relate',
  'source' => 'non-db',
  'vname' => 'LBL_YO_MARKETING_TASKS_FROM_YO_MARKETING_TITLE',
  'save' => true,
  'id_name' => 'yo_marketing_tasksyo_marketing_ida',
  'link' => 'yo_marketing_tasks',
  'table' => 'yo_marketing',
  'module' => 'yo_Marketing',
  'rname' => 'name',
);
$dictionary["Task"]["fields"]["yo_marketing_tasksyo_marketing_ida"] = array (
  'name' => 'yo_marketing_tasksyo_marketing_ida',
  'type' => 'link',
  'relationship' => 'yo_marketing_tasks',
  'source' => 'non-db',
  'reportable' => false,
  'side' => 'right',
  'vname' => 'LBL_YO_MARKETING_TASKS_FROM_TASKS_TITLE',
);
