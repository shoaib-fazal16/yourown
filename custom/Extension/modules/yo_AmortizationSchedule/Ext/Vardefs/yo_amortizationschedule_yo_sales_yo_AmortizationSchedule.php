<?php
// created: 2015-03-22 17:52:16
$dictionary["yo_AmortizationSchedule"]["fields"]["yo_amortizationschedule_yo_sales"] = array (
  'name' => 'yo_amortizationschedule_yo_sales',
  'type' => 'link',
  'relationship' => 'yo_amortizationschedule_yo_sales',
  'source' => 'non-db',
  'module' => 'yo_Sales',
  'bean_name' => 'yo_Sales',
  'vname' => 'LBL_YO_AMORTIZATIONSCHEDULE_YO_SALES_FROM_YO_SALES_TITLE',
  'id_name' => 'yo_amortizationschedule_yo_salesyo_sales_ida',
);
$dictionary["yo_AmortizationSchedule"]["fields"]["yo_amortizationschedule_yo_sales_name"] = array (
  'name' => 'yo_amortizationschedule_yo_sales_name',
  'type' => 'relate',
  'source' => 'non-db',
  'vname' => 'LBL_YO_AMORTIZATIONSCHEDULE_YO_SALES_FROM_YO_SALES_TITLE',
  'save' => true,
  'id_name' => 'yo_amortizationschedule_yo_salesyo_sales_ida',
  'link' => 'yo_amortizationschedule_yo_sales',
  'table' => 'yo_sales',
  'module' => 'yo_Sales',
  'rname' => 'name',
);
$dictionary["yo_AmortizationSchedule"]["fields"]["yo_amortizationschedule_yo_salesyo_sales_ida"] = array (
  'name' => 'yo_amortizationschedule_yo_salesyo_sales_ida',
  'type' => 'link',
  'relationship' => 'yo_amortizationschedule_yo_sales',
  'source' => 'non-db',
  'reportable' => false,
  'side' => 'right',
  'vname' => 'LBL_YO_AMORTIZATIONSCHEDULE_YO_SALES_FROM_YO_AMORTIZATIONSCHEDULE_TITLE',
);
