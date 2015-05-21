<?php
$dictionary["Task"]["fields"]["escalatable"] = array (
  'name' => 'escalatable',
  'type' => 'bool',
  'default' => 0,
  'vname' => 'LBL_ESCALATABLE',
);

$dictionary["Task"]["fields"]["escalate_date"] = array (
  'name' => 'escalate_date',
  'type' => 'date',
  'dbType' => 'date',
  'vname' => 'LBL_ESCALATE_DATE',
);

$dictionary["Task"]["fields"]["needs_review"] = array (
  'name' => 'needs_review',
  'type' => 'bool',
  'default' => 0,
  'vname' => 'LBL_NEEDS_REVIEW',
);

$dictionary["Task"]["fields"]["escalated"] = array (
  'name' => 'escalated',
  'type' => 'bool',
  'default' => 0,
  'vname' => 'LBL_ESCALATED',
);

$dictionary["Task"]["fields"]["user"] =  array(
   'name'=>'user',
   'type' => 'enum',
   'function'=>'getUserDropDown',
   'vname' => 'LBL_USER',
   'reportable'=>false,
   'duplicate_merge' => 'disabled',
   'audited' =>true,
   'massupdate' => true,
);
