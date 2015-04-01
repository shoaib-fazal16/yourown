<?php
$module_name = 'yo_SiteActivity';
$listViewDefs [$module_name] = 
array (
  'YO_SITEACTIVITY_ACCOUNTS_NAME' => 
  array (
    'type' => 'relate',
    'link' => true,
    'label' => 'LBL_YO_SITEACTIVITY_ACCOUNTS_FROM_ACCOUNTS_TITLE',
    'id' => 'YO_SITEACTIVITY_ACCOUNTSACCOUNTS_IDA',
    'width' => '10%',
    'default' => true,
  ),
  'VISIT_DATE_TIME_C' => 
  array (
    'type' => 'datetimecombo',
    'label' => 'LBL_VISIT_DATE_TIME_C',
    'width' => '10%',
    'default' => true,
  ),
  'NAME' => 
  array (
    'width' => '32%',
    'label' => 'LBL_NAME',
    'default' => true,
    'link' => true,
  ),
  'ASSIGNED_USER_NAME' => 
  array (
    'width' => '9%',
    'label' => 'LBL_ASSIGNED_TO_NAME',
    'module' => 'Employees',
    'id' => 'ASSIGNED_USER_ID',
    'default' => true,
  ),
);
?>
