<?php
// created: 2015-04-08 18:14:12
$subpanel_layout['list_fields'] = array (
  'phase' => 
  array (
    'type' => 'enum',
    'default' => true,
    'studio' => 'visible',
    'vname' => 'LBL_PHASE',
    'width' => '10%',
  ),
  'name' => 
  array (
    'vname' => 'LBL_NAME',
    'widget_class' => 'SubPanelDetailViewLink',
    'width' => '10%',
    'default' => true,
  ),
  'yo_subdivisions_aos_products_name' => 
  array (
    'type' => 'relate',
    'link' => true,
    'vname' => 'LBL_YO_SUBDIVISIONS_AOS_PRODUCTS_FROM_YO_SUBDIVISIONS_TITLE',
    'id' => 'YO_SUBDIVISIONS_AOS_PRODUCTSYO_SUBDIVISIONS_IDA',
    'width' => '10%',
    'default' => true,
    'widget_class' => 'SubPanelDetailViewLink',
    'target_module' => 'yo_Subdivisions',
    'target_record_key' => 'yo_subdivisions_aos_productsyo_subdivisions_ida',
  ),
  'legal_description' => 
  array (
    'type' => 'text',
    'default' => true,
    'studio' => 'visible',
    'vname' => 'LBL_LEGAL_DESCRIPTION',
    'sortable' => false,
    'width' => '10%',
  ),
  'lot_acres' => 
  array (
    'type' => 'varchar',
    'default' => true,
    'vname' => 'LBL_LOT_ACRES',
    'width' => '10%',
  ),
  'date_modified' => 
  array (
    'vname' => 'LBL_DATE_MODIFIED',
    'width' => '10%',
    'default' => true,
  ),
  'edit_button' => 
  array (
    'widget_class' => 'SubPanelEditButton',
    'module' => 'AOS_Products',
    'width' => '4%',
    'default' => true,
  ),
  'remove_button' => 
  array (
    'widget_class' => 'SubPanelRemoveButton',
    'module' => 'AOS_Products',
    'width' => '5%',
    'default' => true,
  ),
);