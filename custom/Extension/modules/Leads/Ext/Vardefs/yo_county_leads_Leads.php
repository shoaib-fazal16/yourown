<?php
// created: 2015-03-22 13:19:15
$dictionary["Lead"]["fields"]["yo_county_leads"] = array (
  'name' => 'yo_county_leads',
  'type' => 'link',
  'relationship' => 'yo_county_leads',
  'source' => 'non-db',
  'module' => 'yo_County',
  'bean_name' => false,
  'vname' => 'LBL_YO_COUNTY_LEADS_FROM_YO_COUNTY_TITLE',
  'id_name' => 'yo_county_leadsyo_county_ida',
);
$dictionary["Lead"]["fields"]["yo_county_leads_name"] = array (
  'name' => 'yo_county_leads_name',
  'type' => 'relate',
  'source' => 'non-db',
  'vname' => 'LBL_YO_COUNTY_LEADS_FROM_YO_COUNTY_TITLE',
  'save' => true,
  'id_name' => 'yo_county_leadsyo_county_ida',
  'link' => 'yo_county_leads',
  'table' => 'yo_county',
  'module' => 'yo_County',
  'rname' => 'name',
);
$dictionary["Lead"]["fields"]["yo_county_leadsyo_county_ida"] = array (
  'name' => 'yo_county_leadsyo_county_ida',
  'type' => 'link',
  'relationship' => 'yo_county_leads',
  'source' => 'non-db',
  'reportable' => false,
  'side' => 'right',
  'vname' => 'LBL_YO_COUNTY_LEADS_FROM_LEADS_TITLE',
);
