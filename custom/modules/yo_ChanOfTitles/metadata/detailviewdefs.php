<?php
$module_name = 'yo_ChanOfTitles';
$_object_name = 'yo_chanoftitles';
$viewdefs [$module_name] = 
array (
  'DetailView' => 
  array (
    'templateMeta' => 
    array (
      'maxColumns' => '2',
      'form' => 
      array (
      ),
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
          0 => 'uploadfile',
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
          0 => 'description',
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
