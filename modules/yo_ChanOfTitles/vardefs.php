<?php
/*********************************************************************************
 * SugarCRM Community Edition is a customer relationship management program developed by
 * SugarCRM, Inc. Copyright (C) 2004-2013 SugarCRM Inc.

 * SuiteCRM is an extension to SugarCRM Community Edition developed by Salesagility Ltd.
 * Copyright (C) 2011 - 2014 Salesagility Ltd.
 *
 * This program is free software; you can redistribute it and/or modify it under
 * the terms of the GNU Affero General Public License version 3 as published by the
 * Free Software Foundation with the addition of the following permission added
 * to Section 15 as permitted in Section 7(a): FOR ANY PART OF THE COVERED WORK
 * IN WHICH THE COPYRIGHT IS OWNED BY SUGARCRM, SUGARCRM DISCLAIMS THE WARRANTY
 * OF NON INFRINGEMENT OF THIRD PARTY RIGHTS.
 *
 * This program is distributed in the hope that it will be useful, but WITHOUT
 * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
 * FOR A PARTICULAR PURPOSE.  See the GNU Affero General Public License for more
 * details.
 *
 * You should have received a copy of the GNU Affero General Public License along with
 * this program; if not, see http://www.gnu.org/licenses or write to the Free
 * Software Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA
 * 02110-1301 USA.
 *
 * You can contact SugarCRM, Inc. headquarters at 10050 North Wolfe Road,
 * SW2-130, Cupertino, CA 95014, USA. or at email address contact@sugarcrm.com.
 *
 * The interactive user interfaces in modified source and object code versions
 * of this program must display Appropriate Legal Notices, as required under
 * Section 5 of the GNU Affero General Public License version 3.
 *
 * In accordance with Section 7(b) of the GNU Affero General Public License version 3,
 * these Appropriate Legal Notices must retain the display of the "Powered by
 * SugarCRM" logo and "Supercharged by SuiteCRM" logo. If the display of the logos is not
 * reasonably feasible for  technical reasons, the Appropriate Legal Notices must
 * display the words  "Powered by SugarCRM" and "Supercharged by SuiteCRM".
 ********************************************************************************/

$dictionary['yo_ChanOfTitles'] = array(
	'table'=>'yo_chanoftitles',
	'audited'=>true,
		'fields'=>array (
	'book' => 
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
    ),
    'document_link' => 
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
    ),
    'document_number' => 
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
    ),
    'grantee' => 
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
    ),
    'grantor' => 
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
    ),
    'marital_status' => 
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
    ),
    'notes' => 
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
    ),
    'page_number' => 
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
    ),
    'purchase_price' => 
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
    ),
    'title_company' => 
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
    ),
    'typed' => 
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
    ),
    'type_of_deed' => 
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
    ),
    'currency_id' => 
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
    ),
    'document_type' => 
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
    ),
    'dropboxurl' => 
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
    ),
),
	'relationships'=>array (
),
	'optimistic_locking'=>true,
		'unified_search'=>true,
	);
if (!class_exists('VardefManager')){
        require_once('include/SugarObjects/VardefManager.php');
}
VardefManager::createVardef('yo_ChanOfTitles','yo_ChanOfTitles', array('basic','assignable','file'));