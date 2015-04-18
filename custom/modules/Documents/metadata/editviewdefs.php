<?php
$viewdefs ['Documents'] = 
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
          0 => '<input type="hidden" name="old_id" value="{$fields.document_revision_id.value}">',
          1 => '<input type="hidden" name="contract_id" value="{$smarty.request.contract_id}">',
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
              'onchangeSetFileNameTo' => 'document_name',
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
          0 => 'document_name',
          1 => 
          array (
            'name' => 'revision',
            'customCode' => '<input name="revision" type="text" value="{$fields.revision.value}" {$DISABLED}>',
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
          0 => 
          array (
            'name' => 'active_date',
          ),
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
          ),
        ),
        12 => 
        array (
          0 => 
          array (
            'name' => 'related_doc_name',
            'customCode' => '<input name="related_document_name" type="text" size="30" maxlength="255" value="{$RELATED_DOCUMENT_NAME}" readonly><input name="related_doc_id" type="hidden" value="{$fields.related_doc_id.value}"/>&nbsp;<input title="{$APP.LBL_SELECT_BUTTON_TITLE}" type="{$RELATED_DOCUMENT_BUTTON_AVAILABILITY}" class="button" value="{$APP.LBL_SELECT_BUTTON_LABEL}" name="btn2" onclick=\'open_popup("Documents", 600, 400, "", true, false, {$encoded_document_popup_request_data}, "single", true);\'/>',
          ),
          1 => 
          array (
            'name' => 'related_doc_rev_number',
            'customCode' => '<select name="related_doc_rev_id" id="related_doc_rev_id" {$RELATED_DOCUMENT_REVISION_DISABLED}>{$RELATED_DOCUMENT_REVISION_OPTIONS}</select>',
          ),
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
