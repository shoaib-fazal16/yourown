<?php
$module_name = 'yo_County';
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
        'LBL_EDITVIEW_PANEL5' => 
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
            'name' => 'state',
            'studio' => 'visible',
            'label' => 'LBL_STATE',
          ),
          1 => 'name',
        ),
      ),
      'lbl_editview_panel1' => 
      array (
        0 => 
        array (
          0 => 
          array (
            'name' => 'treasurer_website',
            'label' => 'LBL_TREASURER_WEBSITE',
          ),
          1 => '',
        ),
        1 => 
        array (
          0 => 
          array (
            'name' => 'treasurer_address',
            'label' => 'LBL_TREASURER_ADDRESS',
          ),
          1 => 
          array (
            'name' => 'treasurer_address_city',
            'label' => 'LBL_TREASURER_ADDRESS_CITY',
          ),
        ),
        2 => 
        array (
          0 => 
          array (
            'name' => 'treasurer_address_state',
            'label' => 'LBL_TREASURER_ADDRESS_STATE',
          ),
          1 => 
          array (
            'name' => 'treasurer_address_postalcode',
            'label' => 'LBL_TREASURER_ADDRESS_POSTALCODE',
          ),
        ),
        3 => 
        array (
          0 => 
          array (
            'name' => 'treasurer_phone',
            'label' => 'LBL_TREASURER_PHONE',
          ),
          1 => 
          array (
            'name' => 'treasurer_hours',
            'label' => 'LBL_TREASURER_HOURS',
          ),
        ),
      ),
      'lbl_editview_panel2' => 
      array (
        0 => 
        array (
          0 => 
          array (
            'name' => 'recorders_url',
            'label' => 'LBL_RECORDERS_URL',
          ),
          1 => '',
        ),
        1 => 
        array (
          0 => 
          array (
            'name' => 'recorders_address',
            'label' => 'LBL_RECORDERS_ADDRESS',
          ),
          1 => 
          array (
            'name' => 'recorders_address_city',
            'label' => 'LBL_RECORDERS_ADDRESS_CITY',
          ),
        ),
        2 => 
        array (
          0 => 
          array (
            'name' => 'recorders_address_state',
            'label' => 'LBL_RECORDERS_ADDRESS_STATE',
          ),
          1 => 
          array (
            'name' => 'recorders_address_postalcode',
            'label' => 'LBL_RECORDERS_ADDRESS_POSTALCODE',
          ),
        ),
        3 => 
        array (
          0 => 
          array (
            'name' => 'recorders_phone',
            'label' => 'LBL_RECORDERS_PHONE',
          ),
          1 => 
          array (
            'name' => 'recorders_hours',
            'label' => 'LBL_RECORDERS_HOURS',
          ),
        ),
      ),
      'lbl_editview_panel3' => 
      array (
        0 => 
        array (
          0 => 
          array (
            'name' => 'assessors_office_url',
            'label' => 'LBL_ASSESSORS_OFFICE_URL',
          ),
          1 => '',
        ),
        1 => 
        array (
          0 => 
          array (
            'name' => 'assessors_address',
            'label' => 'LBL_ASSESSORS_ADDRESS',
          ),
          1 => 
          array (
            'name' => 'assessors_address_city',
            'label' => 'LBL_ASSESSORS_ADDRESS_CITY',
          ),
        ),
        2 => 
        array (
          0 => 
          array (
            'name' => 'assessors_address_state_c',
            'label' => 'LBL_ASSESSORS_ADDRESS_STATE_C',
          ),
          1 => 
          array (
            'name' => 'assessors_address_postalcode',
            'label' => 'LBL_ASSESSORS_ADDRESS_POSTALCODE',
          ),
        ),
        3 => 
        array (
          0 => 
          array (
            'name' => 'assessors_office_phone',
            'label' => 'LBL_ASSESSORS_OFFICE_PHONE',
          ),
          1 => 
          array (
            'name' => 'assessors_hours',
            'label' => 'LBL_ASSESSORS_HOURS',
          ),
        ),
      ),
      'lbl_editview_panel5' => 
      array (
        0 => 
        array (
          0 => 
          array (
            'name' => 'gismap',
            'label' => 'LBL_GISMAP',
          ),
          1 => 
          array (
            'name' => 'gis_phone',
            'label' => 'LBL_GIS_PHONE',
          ),
        ),
      ),
      'lbl_editview_panel4' => 
      array (
        0 => 
        array (
          0 => 
          array (
            'name' => 'community_development_url',
            'label' => 'LBL_COMMUNITY_DEVELOPMENT_URL',
          ),
          1 => 
          array (
            'name' => 'community_development_phone',
            'label' => 'LBL_COMMUNITY_DEVELOPMENT_PHONE',
          ),
        ),
      ),
    ),
  ),
);
?>
