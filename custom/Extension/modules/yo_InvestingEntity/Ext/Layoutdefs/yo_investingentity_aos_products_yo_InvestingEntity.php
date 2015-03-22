<?php
 // created: 2015-03-22 15:31:58
$layout_defs["yo_InvestingEntity"]["subpanel_setup"]['yo_investingentity_aos_products'] = array (
  'order' => 100,
  'module' => 'AOS_Products',
  'subpanel_name' => 'default',
  'sort_order' => 'asc',
  'sort_by' => 'id',
  'title_key' => 'LBL_YO_INVESTINGENTITY_AOS_PRODUCTS_FROM_AOS_PRODUCTS_TITLE',
  'get_subpanel_data' => 'yo_investingentity_aos_products',
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
