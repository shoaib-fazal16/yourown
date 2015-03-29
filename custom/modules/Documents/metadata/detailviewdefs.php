<?php
$viewdefs ['Documents'] = 
array (
  'DetailView' => 
  array (
    'templateMeta' => 
    array (
      'maxColumns' => '2',
      'form' => 
      array (
        'hidden' => 
        array (
          0 => '<input type="hidden" name="old_id" value="{$fields.document_revision_id.value}">',
        ),
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
        'LBL_DOCUMENT_INFORMATION' => 
        array (
          'newTab' => false,
          'panelDefault' => 'expanded',
        ),
      ),
      'syncDetailEditViews' => true,
    ),
    'panels' => 
    array (
      'lbl_document_information' => 
      array (
        0 => 
        array (
          0 => 
          array (
            'name' => 'filename',
            'displayParams' => 
            array (
              'link' => 'filename',
              'id' => 'document_revision_id',
            ),
          ),
          1 => 
          array (
            'name' => 'status_id',
            'label' => 'LBL_DOC_STATUS',
          ),
        ),
        1 => 
        array (
          0 => 
          array (
            'name' => 'document_name',
            'label' => 'LBL_DOC_NAME',
          ),
          1 => 
          array (
            'name' => 'revision',
            'label' => 'LBL_DOC_VERSION',
          ),
        ),
        2 => 
        array (
          0 => 
          array (
            'name' => 'document_type',
            'studio' => 'visible',
            'label' => 'LBL_DOCUMENT_TYPE',
          ),
          1 => 'exp_date',
        ),
        3 => 
        array (
          0 => 'active_date',
          1 => '',
        ),
        4 => 
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
        5 => 
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
        6 => 
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
        7 => 
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
        8 => 
        array (
          0 => 
          array (
            'name' => 'typed',
            'label' => 'LBL_TYPED',
          ),
          1 => '',
        ),
        9 => 
        array (
          0 => 
          array (
            'name' => 'template_type',
            'label' => 'LBL_DET_TEMPLATE_TYPE',
          ),
          1 => 
          array (
            'name' => 'is_template',
            'label' => 'LBL_DET_IS_TEMPLATE',
          ),
        ),
        10 => 
        array (
          0 => 'category_id',
          1 => '',
        ),
        11 => 
        array (
          0 => 
          array (
            'name' => 'description',
            'comment' => 'Full text of the note',
            'label' => 'LBL_DESCRIPTION',
          ),
        ),
        12 => 
        array (
          0 => 'related_doc_name',
          1 => 'related_doc_rev_number',
        ),
        13 => 
        array (
          0 => 
          array (
            'name' => 'aos_products_documents_2_name',
          ),
          1 => '',
        ),
      ),
    ),
  ),
);
?>
