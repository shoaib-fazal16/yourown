<?php
 // created: 2015-04-01 22:16:58
$layout_defs["Accounts"]["subpanel_setup"]['yo_siteactivity_accounts'] = array (
  'order' => 100,
  'module' => 'yo_SiteActivity',
  'subpanel_name' => 'default',
  'sort_order' => 'asc',
  'sort_by' => 'id',
  'title_key' => 'LBL_YO_SITEACTIVITY_ACCOUNTS_FROM_YO_SITEACTIVITY_TITLE',
  'get_subpanel_data' => 'yo_siteactivity_accounts',
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
