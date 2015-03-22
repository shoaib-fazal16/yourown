<?php
// created: 2015-03-22 15:31:59
$dictionary["Lead"]["fields"]["yo_investingentity_leads"] = array (
  'name' => 'yo_investingentity_leads',
  'type' => 'link',
  'relationship' => 'yo_investingentity_leads',
  'source' => 'non-db',
  'module' => 'yo_InvestingEntity',
  'bean_name' => false,
  'vname' => 'LBL_YO_INVESTINGENTITY_LEADS_FROM_YO_INVESTINGENTITY_TITLE',
  'id_name' => 'yo_investingentity_leadsyo_investingentity_ida',
);
$dictionary["Lead"]["fields"]["yo_investingentity_leads_name"] = array (
  'name' => 'yo_investingentity_leads_name',
  'type' => 'relate',
  'source' => 'non-db',
  'vname' => 'LBL_YO_INVESTINGENTITY_LEADS_FROM_YO_INVESTINGENTITY_TITLE',
  'save' => true,
  'id_name' => 'yo_investingentity_leadsyo_investingentity_ida',
  'link' => 'yo_investingentity_leads',
  'table' => 'yo_investingentity',
  'module' => 'yo_InvestingEntity',
  'rname' => 'name',
);
$dictionary["Lead"]["fields"]["yo_investingentity_leadsyo_investingentity_ida"] = array (
  'name' => 'yo_investingentity_leadsyo_investingentity_ida',
  'type' => 'link',
  'relationship' => 'yo_investingentity_leads',
  'source' => 'non-db',
  'reportable' => false,
  'side' => 'right',
  'vname' => 'LBL_YO_INVESTINGENTITY_LEADS_FROM_LEADS_TITLE',
);
