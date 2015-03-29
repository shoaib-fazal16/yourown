<?php
$listViewDefs ['AOS_Contracts'] = 
array (
  'LEADS_AOS_CONTRACTS_1_NAME' => 
  array (
    'type' => 'relate',
    'link' => true,
    'label' => 'LBL_LEADS_AOS_CONTRACTS_1_FROM_LEADS_TITLE',
    'id' => 'LEADS_AOS_CONTRACTS_1LEADS_IDA',
    'width' => '10%',
    'default' => true,
  ),
  'NAME' => 
  array (
    'width' => '15%',
    'label' => 'LBL_NAME',
    'default' => true,
    'link' => true,
  ),
  'STATUS' => 
  array (
    'type' => 'enum',
    'default' => true,
    'studio' => 'visible',
    'label' => 'LBL_STATUS',
    'sortable' => false,
    'width' => '10%',
  ),
  'VERBALLY_ACCEPTED' => 
  array (
    'type' => 'date',
    'default' => true,
    'label' => 'LBL_VERBALLY_ACCEPTED',
    'width' => '10%',
  ),
  'OFFER_MAILED_DATE' => 
  array (
    'type' => 'date',
    'default' => true,
    'label' => 'LBL_OFFER_MAILED_DATE',
    'width' => '10%',
  ),
  'EXPIRATION_DATE' => 
  array (
    'type' => 'date',
    'default' => true,
    'label' => 'LBL_EXPIRATION_DATE',
    'width' => '10%',
  ),
  'COE_DATE' => 
  array (
    'type' => 'date',
    'default' => true,
    'label' => 'LBL_COE_DATE',
    'width' => '10%',
  ),
  'ACTUAL_COE' => 
  array (
    'type' => 'date',
    'default' => true,
    'label' => 'LBL_ACTUAL_COE',
    'width' => '10%',
  ),
  'RECORDING_CONFIRMED' => 
  array (
    'type' => 'date',
    'default' => true,
    'label' => 'LBL_RECORDING_CONFIRMED',
    'width' => '10%',
  ),
  'OFFER_REJECTED' => 
  array (
    'type' => 'date',
    'default' => true,
    'label' => 'LBL_OFFER_REJECTED',
    'width' => '10%',
  ),
  'DATE_ENTERED' => 
  array (
    'width' => '5%',
    'label' => 'LBL_DATE_ENTERED',
    'default' => true,
  ),
);
?>
