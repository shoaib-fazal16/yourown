<?php
// created: 2015-03-23 15:31:09
$dictionary["yo_Marketing"]["fields"]["yo_marketing_yo_investingentity"] = array (
  'name' => 'yo_marketing_yo_investingentity',
  'type' => 'link',
  'relationship' => 'yo_marketing_yo_investingentity',
  'source' => 'non-db',
  'module' => 'yo_InvestingEntity',
  'bean_name' => 'yo_InvestingEntity',
  'vname' => 'LBL_YO_MARKETING_YO_INVESTINGENTITY_FROM_YO_INVESTINGENTITY_TITLE',
  'id_name' => 'yo_marketing_yo_investingentityyo_investingentity_ida',
);
$dictionary["yo_Marketing"]["fields"]["yo_marketing_yo_investingentity_name"] = array (
  'name' => 'yo_marketing_yo_investingentity_name',
  'type' => 'relate',
  'source' => 'non-db',
  'vname' => 'LBL_YO_MARKETING_YO_INVESTINGENTITY_FROM_YO_INVESTINGENTITY_TITLE',
  'save' => true,
  'id_name' => 'yo_marketing_yo_investingentityyo_investingentity_ida',
  'link' => 'yo_marketing_yo_investingentity',
  'table' => 'yo_investingentity',
  'module' => 'yo_InvestingEntity',
  'rname' => 'name',
);
$dictionary["yo_Marketing"]["fields"]["yo_marketing_yo_investingentityyo_investingentity_ida"] = array (
  'name' => 'yo_marketing_yo_investingentityyo_investingentity_ida',
  'type' => 'link',
  'relationship' => 'yo_marketing_yo_investingentity',
  'source' => 'non-db',
  'reportable' => false,
  'side' => 'right',
  'vname' => 'LBL_YO_MARKETING_YO_INVESTINGENTITY_FROM_YO_MARKETING_TITLE',
);
