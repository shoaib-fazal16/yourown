<?php
$module_name = 'AOS_Products';
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
      'form' => 
      array (
        'enctype' => 'multipart/form-data',
        'headerTpl' => 'modules/AOS_Products/tpls/EditViewHeader.tpl',
      ),
      'includes' => 
      array (
        0 => 
        array (
          'file' => 'modules/AOS_Products/js/products.js',
        ),
		1 => 
        array (
          'file' => 'custom/calc.js',
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
        'LBL_EDITVIEW_PANEL1' => 
        array (
          'newTab' => false,
          'panelDefault' => 'expanded',
        ),
        'LBL_EDITVIEW_PANEL2' => 
        array (
          'newTab' => false,
          'panelDefault' => 'expanded',
        ),
        'LBL_EDITVIEW_PANEL3' => 
        array (
          'newTab' => false,
          'panelDefault' => 'expanded',
        ),
        'LBL_EDITVIEW_PANEL4' => 
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
          0 => 
          array (
            'name' => 'name',
            'label' => 'LBL_NAME',
          ),
          1 => 
          array (
            'name' => 'rank',
            'studio' => 'visible',
            'label' => 'LBL_RANK',
          ),
        ),
        1 => 
        array (
          0 => 
          array (
            'name' => 'phase',
            'studio' => 'visible',
            'label' => 'LBL_PHASE',
          ),
          1 => 
          array (
            'name' => 'yo_investingentity_aos_products_name',
          ),
        ),
        2 => 
        array (
          0 => 
          array (
            'name' => 'leads_aos_products_1_name',
          ),
          1 => '',
        ),
        3 => 
        array (
          0 => 
          array (
            'name' => 'yo_county_aos_products_name',
          ),
          1 => 
          array (
            'name' => 'yo_sales_aos_products_name',
          ),
        ),
        4 => 
        array (
          0 => 
          array (
            'name' => 'cost',
            'label' => 'LBL_COST',
          ),
          1 => 
          array (
            'name' => 'price',
            'label' => 'LBL_PRICE',
          ),
        ),
        5 => 
        array (
          0 => 
          array (
            'name' => 'contact',
            'label' => 'LBL_CONTACT',
          ),
          1 => 
          array (
            'name' => 'url',
            'label' => 'LBL_URL',
          ),
        ),
        6 => 
        array (
          0 => 
          array (
            'name' => 'description',
            'label' => 'LBL_DESCRIPTION',
          ),
        ),
        7 => 
        array (
          0 => 
          array (
            'name' => 'product_image',
            'customCode' => '{$PRODUCT_IMAGE}',
          ),
        ),
        8 => 
        array (
          0 => 
          array (
            'name' => 'currency_id',
            'studio' => 'visible',
            'label' => 'LBL_CURRENCY',
          ),
          1 => '',
        ),
      ),
      'lbl_editview_panel1' => 
      array (
        0 => 
        array (
          0 => 
          array (
            'name' => 'property_address',
            'label' => 'LBL_PROPERTY_ADDRESS',
          ),
          1 => 
          array (
            'name' => 'property_address_city',
            'label' => 'LBL_PROPERTY_ADDRESS_CITY',
          ),
        ),
        1 => 
        array (
          0 => 
          array (
            'name' => 'situs_state',
            'studio' => 'visible',
            'label' => 'LBL_SITUS_STATE',
          ),
          1 => 
          array (
            'name' => 'property_address_postalcode',
            'label' => 'LBL_PROPERTY_ADDRESS_POSTALCODE',
          ),
        ),
        2 => 
        array (
          0 => 
          array (
            'name' => 'legal_description',
            'studio' => 'visible',
            'label' => 'LBL_LEGAL_DESCRIPTION',
          ),
          1 => '',
        ),
        3 => 
        array (
          0 => 
          array (
            'name' => 'search_location',
            'studio' => 'visible',
            'label' => 'LBL_SEARCH_LOCATION',
          ),
          1 => 
          array (
            'name' => 'state_region',
            'studio' => 'visible',
            'label' => 'LBL_STATE_REGION',
          ),
        ),
        4 => 
        array (
          0 => 
          array (
            'name' => 'yo_subdivisions_aos_products_name',
          ),
          1 => 
          array (
            'name' => 'township_range_section',
            'label' => 'LBL_TOWNSHIP_RANGE_SECTION',
          ),
        ),
        5 => 
        array (
          0 => 
          array (
            'name' => 'location_latitude',
            'label' => 'LBL_LATITUDE',
          ),
          1 => 
          array (
            'name' => 'loction_longitude',
            'label' => 'LBL_LONGITUDE',
          ),
        ),
        6 => 
        array (
          0 => 
          array (
            'name' => 'gis_map',
            'label' => 'LBL_GIS_MAP',
          ),
          1 => 
          array (
            'name' => 'gmap',
            'label' => 'LBL_GMAP',
			'customCode' => '<input type="text" readonly="readonly">',
          ),
        ),
      ),
      'lbl_editview_panel2' => 
      array (
        0 => 
        array (
          0 => 
          array (
            'name' => 'needs_offer',
            'label' => 'LBL_NEEDS_OFFER',
          ),
          1 => '',
        ),
        1 => 
        array (
          0 => 
          array (
            'name' => 'gross_offer',
            'studio' => 'visible',
            'label' => 'LBL_GROSS_OFFER',
          ),
          1 => '',
        ),
        2 => 
        array (
          0 => 
          array (
            'name' => 'delinquent_taxes',
            'studio' => 'visible',
            'label' => 'LBL_DELINQUENT_TAXES',
          ),
          1 => 
          array (
            'name' => 'delinquent_taxes_confirmed',
            'studio' => 'visible',
            'label' => 'LBL_DELINQUENT_TAXES_CONFIRMED',
          ),
        ),
        3 => 
        array (
          0 => 
          array (
            'name' => 'net_offer',
            'label' => 'LBL_NET_OFFER',
          ),
          1 => '',
        ),
        4 => 
        array (
          0 => 
          array (
            'name' => 'aos_contracts_aos_products_1_name',
          ),
          1 => '',
        ),
      ),
      'lbl_editview_panel3' => 
      array (
        0 => 
        array (
          0 => 
          array (
            'name' => 'time_to_build',
            'studio' => 'visible',
            'label' => 'LBL_TIME_TO_BUILD',
          ),
          1 => 
          array (
            'name' => 'restrictions',
            'studio' => 'visible',
            'label' => 'LBL_RESTRICTIONS',
          ),
        ),
        1 => 
        array (
          0 => 
          array (
            'name' => 'manufactured_homes',
            'studio' => 'visible',
            'label' => 'LBL_MANUFACTURED_HOMES',
          ),
          1 => 
          array (
            'name' => 'hoa',
            'studio' => 'visible',
            'label' => 'LBL_HOA',
          ),
        ),
        2 => 
        array (
          0 => 
          array (
            'name' => 'camping',
            'studio' => 'visible',
            'label' => 'LBL_CAMPING',
          ),
          1 => '',
        ),
      ),
      'lbl_editview_panel4' => 
      array (
        0 => 
        array (
          0 => 'property_category',
          1 => 'property_use_1',
        ),
		1 => 
        array (
          0 => 'property_category_2',
          1 => 'property_use_2',
        ),
		2 => 
        array (
          0 => 'property_category_3',
          1 => 'property_use_3',
        ),
		3 => 
        array (
          0 => 'property_use_4',
          1 => 'property_use_5',
        ),
		4 => 
        array (
          0 => 'property_use_6',
        ),
		5 => 
        array (
          0 => 'lot_acres',
          1 => 'lot_sq_ft',
        ),
		6 => 
        array (
          0 => 'power',
          1 => 'sewer',
        ),
		7 => 
        array (
          0 => 'water',
          1 => 'road_access',
        ),
		8 => 
        array (
          0 => 'legal_access',
          1 => 'elevation',
        ),
		9 => 
        array (
          0 => 'survey',
          1 => 'property_taxes',
        ),
		10 => 
        array (
          0 => 'poa_fee',
          1 => 'zoning',
        ),
		11 => 
        array (
          0 => 'disclosure_statement',
        ),
      ),
    ),
  ),
);
?>
