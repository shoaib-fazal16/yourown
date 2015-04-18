<?php
$viewdefs ['Documents'] = 
array (
  'QuickCreate' => 
  array (
    'templateMeta' => 
    array (
      'form' => 
      array (
        'enctype' => 'multipart/form-data',
        'hidden' => 
        array (
          0 => '<input type="hidden" name="old_id" value="{$fields.document_revision_id.value}">',
          1 => '<input type="hidden" name="parent_id" value="{$smarty.request.parent_id}">',
          2 => '<input type="hidden" name="parent_type" value="{$smarty.request.parent_type}">',
        ),
      ),
      'maxColumns' => '2',
      'widths' => 
      array (
        0 => 
        array (
          'label' => '10',
          'field' => '30',
        ),
        1 => 
        array (
          'label' => '10',
          'field' => '30',
        ),
      ),
      'includes' => 
      array (
        0 => 
        array (
          'file' => 'include/javascript/popup_parent_helper.js',
        ),
        1 => 
        array (
          'file' => 'cache/include/javascript/sugar_grp_jsolait.js',
        ),
        2 => 
        array (
          'file' => 'modules/Documents/documents.js',
        ),
      ),
      'useTabs' => false,
      'tabDefs' => 
      array (
        'DEFAULT' => 
        array (
          'newTab' => false,
          'panelDefault' => 'expanded',
        ),
      ),
    ),
    'panels' => 
    array (
      'default' => 
      array (
        0 => 
        array (
          0 => 'status_id',
          1 => 
          array (
            'name' => 'filename',
            'displayParams' => 
            array (
              'required' => true,
              'onchangeSetFileNameTo' => 'document_name',
            ),
          ),
        ),
        1 => 
        array (
          0 => 'document_name',
          1 => 
          array (
            'name' => 'dropboxurl',
            'label' => 'LBL_DROPBOXURL',
          ),
        ),
        2 => 
        array (
          0 => 
          array (
            'name' => 'grantee',
            'label' => 'LBL_GRANTEE',
          ),
          1 => 
          array (
            'name' => 'grantor',
            'label' => 'LBL_GRANTOR',
          ),
        ),
        3 => 
        array (
          0 => 
          array (
            'name' => 'document_type',
            'studio' => 'visible',
            'label' => 'LBL_DOCUMENT_TYPE',
          ),
          1 => 
          array (
            'name' => 'book',
            'label' => 'LBL_BOOK',
          ),
        ),
        4 => 
        array (
          0 => 
          array (
            'name' => 'page_number',
            'label' => 'LBL_PAGE_NUMBER',
          ),
          1 => 
          array (
            'name' => 'type_of_deed',
            'studio' => 'visible',
            'label' => 'LBL_TYPE_OF_DEED',
          ),
        ),
        5 => 
        array (
          0 => 
          array (
            'name' => 'document_number',
            'label' => 'LBL_DOCUMENT_NUMBER',
          ),
          1 => 
          array (
            'name' => 'title_company',
            'label' => 'LBL_TITLE_COMPANY',
          ),
        ),
        6 => 
        array (
          0 => 
          array (
            'name' => 'typed',
            'label' => 'LBL_TYPED',
          ),
          1 => 
          array (
            'name' => 'marital_status',
            'label' => 'LBL_MARITAL_STATUS',
          ),
        ),
        7 => 
        array (
          0 => 
          array (
            'name' => 'purchase_price',
            'label' => 'LBL_PURCHASE_PRICE',
          ),
          1 => 
          array (
            'name' => 'revision',
            'customCode' => '<input name="revision" type="text" value="{$fields.revision.value}" {$DISABLED}>',
          ),
        ),
        8 => 
        array (
          0 => 
          array (
            'name' => 'active_date',
            'displayParams' => 
            array (
              'required' => true,
            ),
          ),
          1 => 'category_id',
        ),
        9 => 
        array (
          0 => 
          array (
            'name' => 'description',
            'displayParams' => 
            array (
              'rows' => 10,
              'cols' => 120,
            ),
          ),
        ),
      ),
    ),
  ),
);
?>
