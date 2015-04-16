<?php
$module_name = 'yo_ChanOfTitles';
$viewdefs [$module_name] = 
array (
  'EditView' => 
  array (
    'templateMeta' => 
    array (
      'form' => 
      array (
        'enctype' => 'multipart/form-data',
        'hidden' => 
        array (
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
      'javascript' => '{sugar_getscript file="include/javascript/popup_parent_helper.js"}
	{sugar_getscript file="cache/include/javascript/sugar_grp_jsolait.js"}
	{sugar_getscript file="modules/Documents/documents.js"}',
      'useTabs' => false,
      'tabDefs' => 
      array (
        'DEFAULT' => 
        array (
          'newTab' => false,
          'panelDefault' => 'expanded',
        ),
      ),
      'syncDetailEditViews' => true,
    ),
    'panels' => 
    array (
      'default' => 
      array (
        0 => 
        array (
          0 => 'document_name',
          1 => 'assigned_user_name',
        ),
        1 => 
        array (
          0 => 
          array (
            'name' => 'uploadfile',
            'displayParams' => 
            array (
              'onchangeSetFileNameTo' => 'document_name',
            ),
          ),
          1 => 'active_date',
        ),
        2 => 
        array (
          0 => 
          array (
            'name' => 'grantor',
            'label' => 'LBL_GRANTOR',
          ),
          1 => 
          array (
            'name' => 'grantee',
            'label' => 'LBL_GRANTEE',
          ),
        ),
        3 => 
        array (
          0 => 
          array (
            'name' => 'purchase_price',
            'label' => 'LBL_PURCHASE_PRICE',
          ),
          1 => 
          array (
            'name' => 'document_link',
            'label' => 'LBL_DOCUMENT_LINK',
          ),
        ),
        4 => 
        array (
          0 => 
          array (
            'name' => 'book',
            'label' => 'LBL_BOOK',
          ),
          1 => 
          array (
            'name' => 'page_number',
            'label' => 'LBL_PAGE_NUMBER',
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
            'name' => 'marital_status',
            'label' => 'LBL_MARITAL_STATUS',
          ),
        ),
        6 => 
        array (
          0 => 
          array (
            'name' => 'title_company',
            'label' => 'LBL_TITLE_COMPANY',
          ),
          1 => 
          array (
            'name' => 'typed',
            'label' => 'LBL_TYPED',
          ),
        ),
        7 => 
        array (
          0 => 
          array (
            'name' => 'description',
          ),
          1 => '',
        ),
        8 => 
        array (
          0 => 
          array (
            'name' => 'yo_chanoftitles_aos_products_name',
          ),
          1 => '',
        ),
      ),
    ),
  ),
);
?>
