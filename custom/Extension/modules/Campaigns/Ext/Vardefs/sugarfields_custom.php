<?php
    $dictionary["Campaign"]["fields"]['access_id'] = 
    array (
      'labelValue' => 'Access ID',
      'required' => false,
      'name' => 'access_id',
      'vname' => 'LBL_ACCESS_ID',
      'type' => 'varchar',
      'massupdate' => '0',
      'default' => '',
      'no_default' => false,
      'comments' => '',
      'help' => '',
      'importable' => 'true',
      'duplicate_merge' => 'disabled',
      'duplicate_merge_dom_value' => '0',
      'audited' => false,
      'reportable' => true,
      'unified_search' => false,
      'merge_filter' => 'disabled',
      'len' => '255',
      'size' => '20',
    );
    $dictionary["Campaign"]["fields"]['target_state'] = 
    array (
      'labelValue' => 'Target State',
      'required' => false,
      'name' => 'target_state',
      'vname' => 'LBL_TARGET_STATE',
      'type' => 'enum',
      'massupdate' => '0',
      'default' => NULL,
      'no_default' => false,
      'comments' => '',
      'help' => '',
      'importable' => 'true',
      'duplicate_merge' => 'disabled',
      'duplicate_merge_dom_value' => '0',
      'audited' => false,
      'reportable' => true,
      'unified_search' => false,
      'merge_filter' => 'disabled',
      'len' => 100,
      'size' => '20',
      'options' => 'UnitedStates_States_list',
      'studio' => 'visible',
      'dependency' => NULL,
    );
    $dictionary["Campaign"]["fields"]['tax_delinquent'] =
    array (
      'labelValue' => 'Tax Delinquent Mailing',
      'required' => false,
      'name' => 'tax_delinquent',
      'vname' => 'LBL_TAX_DELINQUENT',
      'type' => 'bool',
      'massupdate' => '0',
      'default' => '0',
      'no_default' => false,
      'comments' => '',
      'help' => 'Check if mail campaign was targeted to tax delinquent owners',
      'importable' => 'true',
      'duplicate_merge' => 'disabled',
      'duplicate_merge_dom_value' => '0',
      'audited' => false,
      'reportable' => true,
      'unified_search' => false,
      'merge_filter' => 'disabled',
      'len' => '255',
      'size' => '20',
    );


?>