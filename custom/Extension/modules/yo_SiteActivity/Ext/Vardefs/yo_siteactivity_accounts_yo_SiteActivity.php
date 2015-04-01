<?php
// created: 2015-04-01 22:16:58
$dictionary["yo_SiteActivity"]["fields"]["yo_siteactivity_accounts"] = array (
  'name' => 'yo_siteactivity_accounts',
  'type' => 'link',
  'relationship' => 'yo_siteactivity_accounts',
  'source' => 'non-db',
  'module' => 'Accounts',
  'bean_name' => 'Account',
  'vname' => 'LBL_YO_SITEACTIVITY_ACCOUNTS_FROM_ACCOUNTS_TITLE',
  'id_name' => 'yo_siteactivity_accountsaccounts_ida',
);
$dictionary["yo_SiteActivity"]["fields"]["yo_siteactivity_accounts_name"] = array (
  'name' => 'yo_siteactivity_accounts_name',
  'type' => 'relate',
  'source' => 'non-db',
  'vname' => 'LBL_YO_SITEACTIVITY_ACCOUNTS_FROM_ACCOUNTS_TITLE',
  'save' => true,
  'id_name' => 'yo_siteactivity_accountsaccounts_ida',
  'link' => 'yo_siteactivity_accounts',
  'table' => 'accounts',
  'module' => 'Accounts',
  'rname' => 'name',
);
$dictionary["yo_SiteActivity"]["fields"]["yo_siteactivity_accountsaccounts_ida"] = array (
  'name' => 'yo_siteactivity_accountsaccounts_ida',
  'type' => 'link',
  'relationship' => 'yo_siteactivity_accounts',
  'source' => 'non-db',
  'reportable' => false,
  'side' => 'right',
  'vname' => 'LBL_YO_SITEACTIVITY_ACCOUNTS_FROM_YO_SITEACTIVITY_TITLE',
);
