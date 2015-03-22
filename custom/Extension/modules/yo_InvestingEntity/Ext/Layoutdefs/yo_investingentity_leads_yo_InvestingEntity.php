<?php
 // created: 2015-03-22 15:31:58
$layout_defs["yo_InvestingEntity"]["subpanel_setup"]['yo_investingentity_leads'] = array (
  'order' => 100,
  'module' => 'Leads',
  'subpanel_name' => 'default',
  'sort_order' => 'asc',
  'sort_by' => 'id',
  'title_key' => 'LBL_YO_INVESTINGENTITY_LEADS_FROM_LEADS_TITLE',
  'get_subpanel_data' => 'yo_investingentity_leads',
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
