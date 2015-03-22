<?php
// created: 2015-03-22 13:19:15
$dictionary["Contact"]["fields"]["yo_county_contacts"] = array (
  'name' => 'yo_county_contacts',
  'type' => 'link',
  'relationship' => 'yo_county_contacts',
  'source' => 'non-db',
  'module' => 'yo_County',
  'bean_name' => false,
  'vname' => 'LBL_YO_COUNTY_CONTACTS_FROM_YO_COUNTY_TITLE',
  'id_name' => 'yo_county_contactsyo_county_ida',
);
$dictionary["Contact"]["fields"]["yo_county_contacts_name"] = array (
  'name' => 'yo_county_contacts_name',
  'type' => 'relate',
  'source' => 'non-db',
  'vname' => 'LBL_YO_COUNTY_CONTACTS_FROM_YO_COUNTY_TITLE',
  'save' => true,
  'id_name' => 'yo_county_contactsyo_county_ida',
  'link' => 'yo_county_contacts',
  'table' => 'yo_county',
  'module' => 'yo_County',
  'rname' => 'name',
);
$dictionary["Contact"]["fields"]["yo_county_contactsyo_county_ida"] = array (
  'name' => 'yo_county_contactsyo_county_ida',
  'type' => 'link',
  'relationship' => 'yo_county_contacts',
  'source' => 'non-db',
  'reportable' => false,
  'side' => 'right',
  'vname' => 'LBL_YO_COUNTY_CONTACTS_FROM_CONTACTS_TITLE',
);
