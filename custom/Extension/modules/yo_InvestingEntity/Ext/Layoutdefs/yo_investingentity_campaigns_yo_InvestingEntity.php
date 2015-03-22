<?php
 // created: 2015-03-22 15:31:58
$layout_defs["yo_InvestingEntity"]["subpanel_setup"]['yo_investingentity_campaigns'] = array (
  'order' => 100,
  'module' => 'Campaigns',
  'subpanel_name' => 'default',
  'sort_order' => 'asc',
  'sort_by' => 'id',
  'title_key' => 'LBL_YO_INVESTINGENTITY_CAMPAIGNS_FROM_CAMPAIGNS_TITLE',
  'get_subpanel_data' => 'yo_investingentity_campaigns',
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
