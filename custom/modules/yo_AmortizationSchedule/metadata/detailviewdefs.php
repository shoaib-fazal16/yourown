<?php
$module_name = 'yo_AmortizationSchedule';
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
          1 => 
          array (
            'name' => 'yo_amortizationschedule_yo_sales_name',
          ),
        ),
        1 => 
        array (
          0 => 
          array (
            'name' => 'payment',
            'label' => 'LBL_PAYMENT',
          ),
          1 => 
          array (
            'name' => 'interest',
            'label' => 'LBL_INTEREST',
          ),
        ),
        2 => 
        array (
          0 => 
          array (
            'name' => 'principal',
            'label' => 'LBL_PRINCIPAL',
          ),
          1 => 
          array (
            'name' => 'bbalance',
            'label' => 'LBL_BBALANCE',
          ),
        ),
        3 => 
        array (
          0 => 
          array (
            'name' => 'tax_amnt',
            'label' => 'LBL_TAX_AMNT',
          ),
          1 => 
          array (
            'name' => 'cinterest',
            'label' => 'LBL_CINTEREST',
          ),
        ),
        4 => 
        array (
          0 => 
          array (
            'name' => 'ebalance',
            'label' => 'LBL_EBALANCE',
          ),
          1 => 
          array (
            'name' => 'cprincipal',
            'label' => 'LBL_CPRINCIPAL',
          ),
        ),
        5 => 
        array (
          0 => 
          array (
            'name' => 'paydate',
            'label' => 'LBL_PAYDATE',
          ),
          1 => 
          array (
            'name' => 'received',
            'label' => 'LBL_RECEIVED',
          ),
        ),
        6 => 
        array (
          0 => 'assigned_user_name',
        ),
      ),
    ),
  ),
);
?>
