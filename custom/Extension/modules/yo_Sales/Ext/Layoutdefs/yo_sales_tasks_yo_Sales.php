<?php
 // created: 2015-03-22 15:32:01
$layout_defs["yo_Sales"]["subpanel_setup"]['yo_sales_tasks'] = array (
  'order' => 100,
  'module' => 'Tasks',
  'subpanel_name' => 'default',
  'sort_order' => 'asc',
  'sort_by' => 'id',
  'title_key' => 'LBL_YO_SALES_TASKS_FROM_TASKS_TITLE',
  'get_subpanel_data' => 'yo_sales_tasks',
  'top_buttons' => 
  array (
    0 => 
    array (
      'widget_class' => 'SubPanelTopButtonQuickCreate',
    ),
    1 => 
    array (
      'widget_class' => 'SubPanelTopSelectButton',
      'mode' => 'MultiSelect',
    ),
  ),
);
