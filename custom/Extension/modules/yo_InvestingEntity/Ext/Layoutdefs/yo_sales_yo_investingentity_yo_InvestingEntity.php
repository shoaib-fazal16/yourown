<?php
 // created: 2015-03-22 15:32:01
$layout_defs["yo_InvestingEntity"]["subpanel_setup"]['yo_sales_yo_investingentity'] = array (
  'order' => 100,
  'module' => 'yo_Sales',
  'subpanel_name' => 'default',
  'sort_order' => 'asc',
  'sort_by' => 'id',
  'title_key' => 'LBL_YO_SALES_YO_INVESTINGENTITY_FROM_YO_SALES_TITLE',
  'get_subpanel_data' => 'yo_sales_yo_investingentity',
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
