<?php
// created: 2015-03-22 13:19:15
$dictionary["Campaign"]["fields"]["yo_county_campaigns"] = array (
  'name' => 'yo_county_campaigns',
  'type' => 'link',
  'relationship' => 'yo_county_campaigns',
  'source' => 'non-db',
  'module' => 'yo_County',
  'bean_name' => false,
  'vname' => 'LBL_YO_COUNTY_CAMPAIGNS_FROM_YO_COUNTY_TITLE',
  'id_name' => 'yo_county_campaignsyo_county_ida',
);
$dictionary["Campaign"]["fields"]["yo_county_campaigns_name"] = array (
  'name' => 'yo_county_campaigns_name',
  'type' => 'relate',
  'source' => 'non-db',
  'vname' => 'LBL_YO_COUNTY_CAMPAIGNS_FROM_YO_COUNTY_TITLE',
  'save' => true,
  'id_name' => 'yo_county_campaignsyo_county_ida',
  'link' => 'yo_county_campaigns',
  'table' => 'yo_county',
  'module' => 'yo_County',
  'rname' => 'name',
);
$dictionary["Campaign"]["fields"]["yo_county_campaignsyo_county_ida"] = array (
  'name' => 'yo_county_campaignsyo_county_ida',
  'type' => 'link',
  'relationship' => 'yo_county_campaigns',
  'source' => 'non-db',
  'reportable' => false,
  'side' => 'right',
  'vname' => 'LBL_YO_COUNTY_CAMPAIGNS_FROM_CAMPAIGNS_TITLE',
);
