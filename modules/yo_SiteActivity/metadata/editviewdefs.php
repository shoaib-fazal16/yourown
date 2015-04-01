<?php
$module_name = 'yo_SiteActivity';
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
          0 => 
          array (
            'name' => 'yo_siteactivity_accounts_name',
          ),
        ),
        1 => 
        array (
          0 => 'name',
          1 => 
          array (
            'name' => 'page_url_c',
            'label' => 'LBL_PAGE_URL_C',
          ),
        ),
        2 => 
        array (
          0 => 
          array (
            'name' => 'visit_date_time_c',
            'label' => 'LBL_VISIT_DATE_TIME_C',
          ),
        ),
      ),
    ),
  ),
);
?>
