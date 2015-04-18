<?php
$module_name = 'yo_Subdivisions';
$viewdefs [$module_name] = 
array (
  'DetailView' => 
  array (
    'templateMeta' => 
    array (
      'form' => 
      array (
        'buttons' => 
        array (
          0 => 'EDIT',
          1 => 'DUPLICATE',
          2 => 'DELETE',
          3 => 'FIND_DUPLICATES',
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
        ),
        1 => 
        array (
          0 => 
          array (
            'name' => 'state',
            'studio' => 'visible',
            'label' => 'LBL_STATE',
          ),
          1 => 
          array (
            'name' => 'state_region',
            'studio' => 'visible',
            'label' => 'LBL_STATE_REGION',
          ),
        ),
        2 => 
        array (
          0 => 
          array (
            'name' => 'county',
            'studio' => 'visible',
            'label' => 'LBL_COUNTY',
          ),
          1 => 
          array (
            'name' => 'subdivision_power',
            'studio' => 'visible',
            'label' => 'LBL_SUBDIVISION_POWER',
          ),
        ),
        3 => 
        array (
          0 => 
          array (
            'name' => 'subdivision_sewer',
            'studio' => 'visible',
            'label' => 'LBL_SUBDIVISION_SEWER',
          ),
          1 => 
          array (
            'name' => 'subdivision_water',
            'studio' => 'visible',
            'label' => 'LBL_SUBDIVISION_WATER',
          ),
        ),
        4 => 
        array (
          0 => 
          array (
            'name' => 'subdivision_camping',
            'studio' => 'visible',
            'label' => 'LBL_SUBDIVISION_CAMPING',
          ),
          1 => 
          array (
            'name' => 'elevation',
            'label' => 'LBL_ELEVATION',
          ),
        ),
        5 => 
        array (
          0 => 
          array (
            'name' => 'zip_code',
            'label' => 'LBL_ZIP_CODE',
          ),
          1 => 
          array (
            'name' => 'zoning',
            'studio' => 'visible',
            'label' => 'LBL_ZONING',
          ),
        ),
        6 => 
        array (
          0 => 
          array (
            'name' => 'manufactured_homes',
            'label' => 'LBL_MANUFACTURED_HOMES',
          ),
          1 => '',
        ),
        7 => 
        array (
          0 => 
          array (
            'name' => 'property_use_1',
            'studio' => 'visible',
            'label' => 'LBL_PROPERTY_USE_1',
          ),
          1 => 
          array (
            'name' => 'property_use_2',
            'studio' => 'visible',
            'label' => 'LBL_PROPERTY_USE_2',
          ),
        ),
        8 => 
        array (
          0 => 
          array (
            'name' => 'property_use_3_c',
            'studio' => 'visible',
            'label' => 'LBL_PROPERTY_USE_3_C',
          ),
          1 => 
          array (
            'name' => 'property_use_4',
            'studio' => 'visible',
            'label' => 'LBL_PROPERTY_USE_4',
          ),
        ),
        9 => 
        array (
          0 => 'description',
        ),
        10 => 
        array (
          0 => '',
        ),
      ),
    ),
  ),
);
?>
