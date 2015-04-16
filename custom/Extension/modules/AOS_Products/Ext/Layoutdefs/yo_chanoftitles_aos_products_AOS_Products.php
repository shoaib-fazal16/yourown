<?php
 // created: 2015-04-16 18:16:56
$layout_defs["AOS_Products"]["subpanel_setup"]['yo_chanoftitles_aos_products'] = array (
  'order' => 100,
  'module' => 'yo_ChanOfTitles',
  'subpanel_name' => 'default',
  'sort_order' => 'asc',
  'sort_by' => 'id',
  'title_key' => 'LBL_YO_CHANOFTITLES_AOS_PRODUCTS_FROM_YO_CHANOFTITLES_TITLE',
  'get_subpanel_data' => 'yo_chanoftitles_aos_products',
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
