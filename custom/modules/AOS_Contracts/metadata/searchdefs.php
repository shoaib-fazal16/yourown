<?php
$module_name = 'AOS_Contracts';
$searchdefs [$module_name] = 
array (
  'layout' => 
  array (
    'basic_search' => 
    array (
      'name' => 
      array (
        'type' => 'name',
        'label' => 'LBL_NAME',
        'width' => '10%',
        'default' => true,
        'name' => 'name',
      ),
      'current_user_only' => 
      array (
        'name' => 'current_user_only',
        'label' => 'LBL_CURRENT_USER_FILTER',
        'type' => 'bool',
        'default' => true,
        'width' => '10%',
      ),
    ),
    'advanced_search' => 
    array (
      'status' => 
      array (
        'name' => 'status',
        'default' => true,
        'width' => '10%',
      ),
      'recording_confirmed' => 
      array (
        'type' => 'date',
        'default' => true,
        'label' => 'LBL_RECORDING_CONFIRMED',
        'width' => '10%',
        'name' => 'recording_confirmed',
      ),
      'offer_rejected' => 
      array (
        'type' => 'date',
        'default' => true,
        'label' => 'LBL_OFFER_REJECTED',
        'width' => '10%',
        'name' => 'offer_rejected',
      ),
      'verbal_offer' => 
      array (
        'type' => 'bool',
        'default' => true,
        'label' => 'LBL_VERBAL_OFFER',
        'width' => '10%',
        'name' => 'verbal_offer',
      ),
      'verbally_accepted' => 
      array (
        'type' => 'date',
        'default' => true,
        'label' => 'LBL_VERBALLY_ACCEPTED',
        'width' => '10%',
        'name' => 'verbally_accepted',
      ),
      'expiration_date' => 
      array (
        'type' => 'date',
        'default' => true,
        'label' => 'LBL_EXPIRATION_DATE',
        'width' => '10%',
        'name' => 'expiration_date',
      ),
      'customer_signed_date' => 
      array (
        'type' => 'date',
        'label' => 'LBL_CUSTOMER_SIGNED_DATE',
        'width' => '10%',
        'default' => true,
        'name' => 'customer_signed_date',
      ),
    ),
  ),
  'templateMeta' => 
  array (
    'maxColumns' => '3',
    'maxColumnsBasic' => '4',
    'widths' => 
    array (
      'label' => '10',
      'field' => '30',
    ),
  ),
);
?>
