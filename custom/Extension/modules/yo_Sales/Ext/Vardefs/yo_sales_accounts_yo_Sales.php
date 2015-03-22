<?php
// created: 2015-03-22 15:32:02
$dictionary["yo_Sales"]["fields"]["yo_sales_accounts"] = array (
  'name' => 'yo_sales_accounts',
  'type' => 'link',
  'relationship' => 'yo_sales_accounts',
  'source' => 'non-db',
  'module' => 'Accounts',
  'bean_name' => 'Account',
  'vname' => 'LBL_YO_SALES_ACCOUNTS_FROM_ACCOUNTS_TITLE',
  'id_name' => 'yo_sales_accountsaccounts_ida',
);
$dictionary["yo_Sales"]["fields"]["yo_sales_accounts_name"] = array (
  'name' => 'yo_sales_accounts_name',
  'type' => 'relate',
  'source' => 'non-db',
  'vname' => 'LBL_YO_SALES_ACCOUNTS_FROM_ACCOUNTS_TITLE',
  'save' => true,
  'id_name' => 'yo_sales_accountsaccounts_ida',
  'link' => 'yo_sales_accounts',
  'table' => 'accounts',
  'module' => 'Accounts',
  'rname' => 'name',
);
$dictionary["yo_Sales"]["fields"]["yo_sales_accountsaccounts_ida"] = array (
  'name' => 'yo_sales_accountsaccounts_ida',
  'type' => 'link',
  'relationship' => 'yo_sales_accounts',
  'source' => 'non-db',
  'reportable' => false,
  'side' => 'right',
  'vname' => 'LBL_YO_SALES_ACCOUNTS_FROM_YO_SALES_TITLE',
);
