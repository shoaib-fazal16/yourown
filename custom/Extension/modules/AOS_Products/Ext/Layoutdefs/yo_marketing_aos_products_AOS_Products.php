<?php
 // created: 2015-03-23 15:31:08
$layout_defs["AOS_Products"]["subpanel_setup"]['yo_marketing_aos_products'] = array (
  'order' => 100,
  'module' => 'yo_Marketing',
  'subpanel_name' => 'default',
  'sort_order' => 'asc',
  'sort_by' => 'id',
  'title_key' => 'LBL_YO_MARKETING_AOS_PRODUCTS_FROM_YO_MARKETING_TITLE',
  'get_subpanel_data' => 'yo_marketing_aos_products',
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
