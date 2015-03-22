<?php
 // created: 2015-03-22 17:52:16
$layout_defs["yo_Sales"]["subpanel_setup"]['yo_amortizationschedule_yo_sales'] = array (
  'order' => 100,
  'module' => 'yo_AmortizationSchedule',
  'subpanel_name' => 'default',
  'sort_order' => 'asc',
  'sort_by' => 'id',
  'title_key' => 'LBL_YO_AMORTIZATIONSCHEDULE_YO_SALES_FROM_YO_AMORTIZATIONSCHEDULE_TITLE',
  'get_subpanel_data' => 'yo_amortizationschedule_yo_sales',
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
