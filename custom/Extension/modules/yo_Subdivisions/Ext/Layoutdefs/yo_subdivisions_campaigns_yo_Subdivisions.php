<?php
 // created: 2015-03-22 13:19:17
$layout_defs["yo_Subdivisions"]["subpanel_setup"]['yo_subdivisions_campaigns'] = array (
  'order' => 100,
  'module' => 'Campaigns',
  'subpanel_name' => 'default',
  'sort_order' => 'asc',
  'sort_by' => 'id',
  'title_key' => 'LBL_YO_SUBDIVISIONS_CAMPAIGNS_FROM_CAMPAIGNS_TITLE',
  'get_subpanel_data' => 'yo_subdivisions_campaigns',
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
