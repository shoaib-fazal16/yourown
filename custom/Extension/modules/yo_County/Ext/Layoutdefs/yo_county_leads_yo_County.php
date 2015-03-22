<?php
 // created: 2015-03-22 13:19:14
$layout_defs["yo_County"]["subpanel_setup"]['yo_county_leads'] = array (
  'order' => 100,
  'module' => 'Leads',
  'subpanel_name' => 'default',
  'sort_order' => 'asc',
  'sort_by' => 'id',
  'title_key' => 'LBL_YO_COUNTY_LEADS_FROM_LEADS_TITLE',
  'get_subpanel_data' => 'yo_county_leads',
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
