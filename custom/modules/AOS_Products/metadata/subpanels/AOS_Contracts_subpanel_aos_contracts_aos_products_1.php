<?php
// created: 2015-04-13 15:25:03
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
  'gross_offer' => 
  array (
    'type' => 'currency',
    'studio' => 'visible',
    'vname' => 'LBL_GROSS_OFFER',
    'currency_format' => true,
    'width' => '10%',
    'default' => true,
  ),
  'delinquent_taxes' => 
  array (
    'type' => 'currency',
    'studio' => 'visible',
    'vname' => 'LBL_DELINQUENT_TAXES',
    'currency_format' => true,
    'width' => '10%',
    'default' => true,
  ),
  'net_offer' => 
  array (
    'type' => 'currency',
    'default' => true,
    'vname' => 'LBL_NET_OFFER',
    'currency_format' => true,
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