<?php
// created: 2015-03-22 18:17:46
$subpanel_layout['list_fields'] = array (
  'name' => 
  array (
    'vname' => 'LBL_NAME',
    'widget_class' => 'SubPanelDetailViewLink',
    'width' => '45%',
    'default' => true,
  ),
  'paydate' => 
  array (
    'type' => 'date',
    'vname' => 'LBL_PAYDATE',
    'width' => '10%',
    'default' => true,
  ),
  'bbalance' => 
  array (
    'type' => 'currency',
    'vname' => 'LBL_BBALANCE',
    'currency_format' => true,
    'width' => '10%',
    'default' => true,
  ),
  'payment' => 
  array (
    'type' => 'currency',
    'vname' => 'LBL_PAYMENT',
    'currency_format' => true,
    'width' => '10%',
    'default' => true,
  ),
  'interest' => 
  array (
    'type' => 'currency',
    'vname' => 'LBL_INTEREST',
    'currency_format' => true,
    'width' => '10%',
    'default' => true,
  ),
  'principal' => 
  array (
    'type' => 'currency',
    'vname' => 'LBL_PRINCIPAL',
    'currency_format' => true,
    'width' => '10%',
    'default' => true,
  ),
  'cinterest' => 
  array (
    'type' => 'currency',
    'vname' => 'LBL_CINTEREST',
    'currency_format' => true,
    'width' => '10%',
    'default' => true,
  ),
  'cprincipal' => 
  array (
    'type' => 'currency',
    'vname' => 'LBL_CPRINCIPAL',
    'currency_format' => true,
    'width' => '10%',
    'default' => true,
  ),
  'ebalance' => 
  array (
    'type' => 'currency',
    'vname' => 'LBL_EBALANCE',
    'currency_format' => true,
    'width' => '10%',
    'default' => true,
  ),
  'tax_amnt' => 
  array (
    'type' => 'currency',
    'vname' => 'LBL_TAX_AMNT',
    'currency_format' => true,
    'width' => '10%',
    'default' => true,
  ),
  'received' => 
  array (
    'type' => 'bool',
    'default' => true,
    'vname' => 'LBL_RECEIVED',
    'width' => '10%',
  ),
  'edit_button' => 
  array (
    'vname' => 'LBL_EDIT_BUTTON',
    'widget_class' => 'SubPanelEditButton',
    'module' => 'yo_AmortizationSchedule',
    'width' => '4%',
    'default' => true,
  ),
);