<?php
// created: 2015-03-22 15:31:59
$dictionary["Campaign"]["fields"]["yo_investingentity_campaigns"] = array (
  'name' => 'yo_investingentity_campaigns',
  'type' => 'link',
  'relationship' => 'yo_investingentity_campaigns',
  'source' => 'non-db',
  'module' => 'yo_InvestingEntity',
  'bean_name' => false,
  'vname' => 'LBL_YO_INVESTINGENTITY_CAMPAIGNS_FROM_YO_INVESTINGENTITY_TITLE',
  'id_name' => 'yo_investingentity_campaignsyo_investingentity_ida',
);
$dictionary["Campaign"]["fields"]["yo_investingentity_campaigns_name"] = array (
  'name' => 'yo_investingentity_campaigns_name',
  'type' => 'relate',
  'source' => 'non-db',
  'vname' => 'LBL_YO_INVESTINGENTITY_CAMPAIGNS_FROM_YO_INVESTINGENTITY_TITLE',
  'save' => true,
  'id_name' => 'yo_investingentity_campaignsyo_investingentity_ida',
  'link' => 'yo_investingentity_campaigns',
  'table' => 'yo_investingentity',
  'module' => 'yo_InvestingEntity',
  'rname' => 'name',
);
$dictionary["Campaign"]["fields"]["yo_investingentity_campaignsyo_investingentity_ida"] = array (
  'name' => 'yo_investingentity_campaignsyo_investingentity_ida',
  'type' => 'link',
  'relationship' => 'yo_investingentity_campaigns',
  'source' => 'non-db',
  'reportable' => false,
  'side' => 'right',
  'vname' => 'LBL_YO_INVESTINGENTITY_CAMPAIGNS_FROM_CAMPAIGNS_TITLE',
);
