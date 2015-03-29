<?php


$dictionary["Document"]["fields"]['book'] = 
    array (
      'labelValue' => 'Book',
      'required' => false,
      'name' => 'book',
      'vname' => 'LBL_BOOK',
      'type' => 'varchar',
      'massupdate' => '0',
      'default' => '',
      'no_default' => false,
      'comments' => '',
      'help' => 'Book # of document',
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
    $dictionary["Document"]["fields"]['document_link'] = 
    array (
      'labelValue' => 'Document Link',
      'required' => false,
      'name' => 'document_link',
      'vname' => 'LBL_DOCUMENT_LINK',
      'type' => 'url',
      'massupdate' => '0',
      'default' => '',
      'no_default' => false,
      'comments' => '',
      'help' => 'Link to document',
      'importable' => 'true',
      'duplicate_merge' => 'disabled',
      'duplicate_merge_dom_value' => '0',
      'audited' => false,
      'reportable' => true,
      'unified_search' => false,
      'merge_filter' => 'disabled',
      'len' => '255',
      'size' => '20',
      'dbType' => 'varchar',
      'gen' => '0',
      'link_target' => '_blank',
    );
    $dictionary["Document"]["fields"]['document_number'] =
    array (
      'labelValue' => 'Document number',
      'required' => false,
      'name' => 'document_number',
      'vname' => 'LBL_DOCUMENT_NUMBER',
      'type' => 'varchar',
      'massupdate' => '0',
      'default' => '',
      'no_default' => false,
      'comments' => '',
      'help' => 'Document number',
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
    $dictionary["Document"]["fields"]['grantee'] = 
    array (
      'labelValue' => 'Grantee',
      'required' => true,
      'name' => 'grantee',
      'vname' => 'LBL_GRANTEE',
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
    $dictionary["Document"]["fields"]['grantor'] = 
    array (
      'labelValue' => 'Grantor',
      'required' => true,
      'name' => 'grantor',
      'vname' => 'LBL_GRANTOR',
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
    $dictionary["Document"]["fields"]['marital_status'] =
    array (
      'labelValue' => 'Marital status',
      'required' => false,
      'name' => 'marital_status',
      'vname' => 'LBL_MARITAL_STATUS',
      'type' => 'bool',
      'massupdate' => '0',
      'default' => '0',
      'no_default' => false,
      'comments' => '',
      'help' => 'Marital status of Grantee outlined?',
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
    $dictionary["Document"]["fields"]['notes'] = 
    array (
      'labelValue' => 'Notes',
      'required' => false,
      'name' => 'notes',
      'vname' => 'LBL_NOTES',
      'type' => 'text',
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
      'size' => '20',
      'studio' => 'visible',
      'rows' => '3',
      'cols' => '20',
    );
    $dictionary["Document"]["fields"]['page_number'] =
    array (
      'labelValue' => 'Page number',
      'required' => false,
      'name' => 'page_number',
      'vname' => 'LBL_PAGE_NUMBER',
      'type' => 'varchar',
      'massupdate' => '0',
      'default' => '',
      'no_default' => false,
      'comments' => '',
      'help' => 'Page number of document',
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
    $dictionary["Document"]["fields"]['purchase_price'] = 
    array (
      'options' => 'numeric_range_search_dom',
      'labelValue' => 'Purchase price',
      'enable_range_search' => '1',
      'required' => false,
      'name' => 'purchase_price',
      'vname' => 'LBL_PURCHASE_PRICE',
      'type' => 'currency',
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
      'len' => '26',
      'size' => '20',
      'precision' => 6,
    );
    $dictionary["Document"]["fields"]['title_company'] = 
    array (
      'labelValue' => 'Title company',
      'required' => false,
      'name' => 'title_company',
      'vname' => 'LBL_TITLE_COMPANY',
      'type' => 'bool',
      'massupdate' => '0',
      'default' => '0',
      'no_default' => false,
      'comments' => '',
      'help' => 'Was a title company used?',
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
    $dictionary["Document"]["fields"]['typed'] =
    array (
      'labelValue' => 'Typed',
      'required' => false,
      'name' => 'typed',
      'vname' => 'LBL_TYPED',
      'type' => 'bool',
      'massupdate' => '0',
      'default' => '0',
      'no_default' => false,
      'comments' => '',
      'help' => 'Was the instrument typed?',
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
    $dictionary["Document"]["fields"]['type_of_deed'] = 
    array (
      'labelValue' => 'Type of deed',
      'required' => false,
      'name' => 'type_of_deed',
      'vname' => 'LBL_TYPE_OF_DEED',
      'type' => 'enum',
      'massupdate' => '0',
      'default' => 'Quit_Claim',
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
      'options' => 'type_of_deed_list',
      'studio' => 'visible',
      'dependency' => false,
    );
    $dictionary["Document"]["fields"]['currency_id'] =
    array (
      'required' => false,
      'name' => 'currency_id',
      'vname' => 'LBL_CURRENCY',
      'type' => 'currency_id',
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
      'len' => '36',
      'size' => '20',
      'dbType' => 'id',
      'studio' => 'visible',
      'function' => 
      array (
        'name' => 'getCurrencyDropDown',
        'returns' => 'html',
      ),
    );
    $dictionary["Document"]["fields"]['document_type'] = 
    array (
      'labelValue' => 'Document type',
      'required' => false,
      'name' => 'document_type',
      'vname' => 'LBL_DOCUMENT_TYPE',
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
      'options' => 'document_type_list',
      'studio' => 'visible',
    );
    $dictionary["Document"]["fields"]['dropboxurl'] = 
    array (
      'labelValue' => 'DropBox URL',
      'required' => false,
      'name' => 'dropboxurl',
      'vname' => 'LBL_DROPBOXURL',
      'type' => 'url',
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
      'dbType' => 'varchar',
      'gen' => '',
      'link_target' => '_self',
    );
?>