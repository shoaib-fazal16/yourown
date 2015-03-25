<?php
$module_name = 'yo_Marketing';
$viewdefs [$module_name] = 
array (
  'EditView' => 
  array (
    'templateMeta' => 
    array (
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
          0 => 'name',
          1 => 
          array (
            'name' => 'status',
            'studio' => 'visible',
            'label' => 'LBL_STATUS',
          ),
        ),
        1 => 
        array (
          0 => 'assigned_user_name',
          1 => 
          array (
            'name' => 'available_for_sale',
            'label' => 'LBL_AVAILABLE_FOR_SALE',
          ),
        ),
        2 => 
        array (
          0 => 
          array (
            'name' => 'listing_url',
            'label' => 'LBL_LISTING_URL',
          ),
          1 => 
          array (
            'name' => 'pictures',
            'label' => 'LBL_PICTURES',
          ),
        ),
        3 => 
        array (
          0 => 
          array (
            'name' => 'list_price',
            'label' => 'LBL_LIST_PRICE',
          ),
          1 => 
          array (
            'name' => 'down_payment',
            'label' => 'LBL_DOWN_PAYMENT',
          ),
        ),
        4 => 
        array (
          0 => 
          array (
            'name' => 'monthly_payment',
            'label' => 'LBL_MONTHLY_PAYMENT',
          ),
          1 => 
          array (
            'name' => 'interest_rate',
            'label' => 'LBL_INTEREST_RATE',
          ),
        ),
        5 => 
        array (
          0 => 
          array (
            'name' => 'doc_prep_fee',
            'label' => 'LBL_DOC_PREP_FEE',
          ),
          1 => 
          array (
            'name' => 'pre_payment_penalty',
            'studio' => 'visible',
            'label' => 'LBL_PRE_PAYMENT_PENALTY',
          ),
        ),
        6 => 
        array (
          0 => 
          array (
            'name' => 'credit_check',
            'studio' => 'visible',
            'label' => 'LBL_CREDIT_CHECK',
          ),
        ),
        7 => 
        array (
          0 => 
          array (
            'name' => 'listing_title',
            'label' => 'LBL_LISTING_TITLE',
          ),
        ),
        8 => 
        array (
          0 => 'description',
        ),
        9 => 
        array (
          0 => 
          array (
            'name' => 'postlets',
            'label' => 'LBL_POSTLETS',
          ),
          1 => 
          array (
            'name' => 'zillow',
            'label' => 'LBL_ZILLOW',
          ),
        ),
        10 => 
        array (
          0 => 
          array (
            'name' => 'landwatch',
            'label' => 'LBL_LANDWATCH',
          ),
          1 => 
          array (
            'name' => 'featured',
            'label' => 'LBL_FEATURED',
          ),
        ),
        11 => 
        array (
          0 => 
          array (
            'name' => 'page_visits',
            'label' => 'LBL_PAGE_VISITS',
          ),
          1 => 
          array (
            'name' => 'sold',
            'label' => 'LBL_SOLD',
          ),
        ),
        12 => 
        array (
          0 => 
          array (
            'name' => 'google_analytics',
            'label' => 'LBL_GOOGLE_ANALYTICS',
          ),
          1 => 
          array (
            'name' => 'yo_marketing_yo_investingentity_name',
          ),
        ),
        13 => 
        array (
          0 => 
          array (
            'name' => 'date_of_month',
            'label' => 'LBL_DATE_OF_MONTH',
          ),
        ),
        14 => 
        array (
          0 => 
          array (
            'name' => 'yo_marketing_aos_products_name',
          ),
        ),
        15 => 
        array (
          0 => 
          array (
            'name' => 'aos_products_yo_marketing_1_name',
          ),
        ),
      ),
    ),
  ),
);
?>
