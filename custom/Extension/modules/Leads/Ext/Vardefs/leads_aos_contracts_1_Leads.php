<?php
// created: 2015-03-29 08:19:27
$dictionary["Lead"]["fields"]["leads_aos_contracts_1"] = array (
  'name' => 'leads_aos_contracts_1',
  'type' => 'link',
  'relationship' => 'leads_aos_contracts_1',
  'source' => 'non-db',
  'module' => 'AOS_Contracts',
  'bean_name' => 'AOS_Contracts',
  'vname' => 'LBL_LEADS_AOS_CONTRACTS_1_FROM_AOS_CONTRACTS_TITLE',
  'id_name' => 'leads_aos_contracts_1aos_contracts_idb',
);
$dictionary["Lead"]["fields"]["leads_aos_contracts_1_name"] = array (
  'name' => 'leads_aos_contracts_1_name',
  'type' => 'relate',
  'source' => 'non-db',
  'vname' => 'LBL_LEADS_AOS_CONTRACTS_1_FROM_AOS_CONTRACTS_TITLE',
  'save' => true,
  'id_name' => 'leads_aos_contracts_1aos_contracts_idb',
  'link' => 'leads_aos_contracts_1',
  'table' => 'aos_contracts',
  'module' => 'AOS_Contracts',
  'rname' => 'name',
);
$dictionary["Lead"]["fields"]["leads_aos_contracts_1aos_contracts_idb"] = array (
  'name' => 'leads_aos_contracts_1aos_contracts_idb',
  'type' => 'link',
  'relationship' => 'leads_aos_contracts_1',
  'source' => 'non-db',
  'reportable' => false,
  'side' => 'left',
  'vname' => 'LBL_LEADS_AOS_CONTRACTS_1_FROM_AOS_CONTRACTS_TITLE',
);
