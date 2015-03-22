<?php
// created: 2015-03-22 13:19:17
$dictionary["Campaign"]["fields"]["yo_subdivisions_campaigns"] = array (
  'name' => 'yo_subdivisions_campaigns',
  'type' => 'link',
  'relationship' => 'yo_subdivisions_campaigns',
  'source' => 'non-db',
  'module' => 'yo_Subdivisions',
  'bean_name' => false,
  'vname' => 'LBL_YO_SUBDIVISIONS_CAMPAIGNS_FROM_YO_SUBDIVISIONS_TITLE',
  'id_name' => 'yo_subdivisions_campaignsyo_subdivisions_ida',
);
$dictionary["Campaign"]["fields"]["yo_subdivisions_campaigns_name"] = array (
  'name' => 'yo_subdivisions_campaigns_name',
  'type' => 'relate',
  'source' => 'non-db',
  'vname' => 'LBL_YO_SUBDIVISIONS_CAMPAIGNS_FROM_YO_SUBDIVISIONS_TITLE',
  'save' => true,
  'id_name' => 'yo_subdivisions_campaignsyo_subdivisions_ida',
  'link' => 'yo_subdivisions_campaigns',
  'table' => 'yo_subdivisions',
  'module' => 'yo_Subdivisions',
  'rname' => 'name',
);
$dictionary["Campaign"]["fields"]["yo_subdivisions_campaignsyo_subdivisions_ida"] = array (
  'name' => 'yo_subdivisions_campaignsyo_subdivisions_ida',
  'type' => 'link',
  'relationship' => 'yo_subdivisions_campaigns',
  'source' => 'non-db',
  'reportable' => false,
  'side' => 'right',
  'vname' => 'LBL_YO_SUBDIVISIONS_CAMPAIGNS_FROM_CAMPAIGNS_TITLE',
);
