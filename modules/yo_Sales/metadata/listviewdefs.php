<?php
$module_name = 'yo_Sales';
$listViewDefs [$module_name] = 
array (
  'NAME' => 
  array (
    'width' => '32%',
    'label' => 'LBL_NAME',
    'default' => true,
    'link' => true,
  ),
  'LATE_PAYMENT_DATE' => 
  array (
    'type' => 'varchar',
    'label' => 'LBL_LATE_PAYMENT_DATE',
    'width' => '10%',
    'default' => true,
  ),
  'YO_SALES_AOS_PRODUCTS_NAME' => 
  array (
    'type' => 'relate',
    'link' => true,
    'label' => 'LBL_YO_SALES_AOS_PRODUCTS_FROM_AOS_PRODUCTS_TITLE',
    'id' => 'YO_SALES_AOS_PRODUCTSAOS_PRODUCTS_IDB',
    'width' => '10%',
    'default' => true,
  ),
  'CONTRACT_NAME' => 
  array (
    'type' => 'varchar',
    'label' => 'LBL_CONTRACT_NAME',
    'width' => '10%',
    'default' => true,
  ),
  'PURCHASE_PRICE' => 
  array (
    'type' => 'currency',
    'label' => 'LBL_PURCHASE_PRICE',
    'currency_format' => true,
    'width' => '10%',
    'default' => true,
  ),
  'PURCHASE_DATE' => 
  array (
    'type' => 'date',
    'label' => 'LBL_PURCHASE_DATE',
    'width' => '10%',
    'default' => true,
  ),
  'PAYMENT_DATE' => 
  array (
    'type' => 'date',
    'label' => 'LBL_PAYMENT_DATE',
    'width' => '10%',
    'default' => true,
  ),
  'MONTHLY_PAYMENT' => 
  array (
    'type' => 'currency',
    'label' => 'LBL_MONTHLY_PAYMENT',
    'currency_format' => true,
    'width' => '10%',
    'default' => true,
  ),
  'INTEREST_RATE' => 
  array (
    'type' => 'varchar',
    'label' => 'LBL_INTEREST_RATE',
    'width' => '10%',
    'default' => true,
  ),
  'YO_SALES_YO_INVESTINGENTITY_NAME' => 
  array (
    'type' => 'relate',
    'link' => true,
    'label' => 'LBL_YO_SALES_YO_INVESTINGENTITY_FROM_YO_INVESTINGENTITY_TITLE',
    'id' => 'YO_SALES_YO_INVESTINGENTITYYO_INVESTINGENTITY_IDA',
    'width' => '10%',
    'default' => true,
  ),
);
?>
