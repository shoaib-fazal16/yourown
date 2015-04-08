<?php
$module_name = 'yo_AmortizationSchedule';
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
	  'includes' => 
      array (
        0 => 
        array (
          'file' => 'custom/modules/yo_AmortizationSchedule/js/DetailView.js',
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
			'displayParams' => 
            array (
				'field'=> array(
					'onchange' => 'calculateEndingBalance()',
				),
            ),
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
            'name' => 'cinterest',
            'label' => 'LBL_CINTEREST',
          ),
          1 => 
          array (
            'name' => 'ebalance',
            'label' => 'LBL_EBALANCE',
          ),
        ),
        4 => 
        array (
          0 => 
          array (
            'name' => 'cprincipal',
            'label' => 'LBL_CPRINCIPAL',
          ),
          1 => 
          array (
            'name' => 'paydate',
            'label' => 'LBL_PAYDATE',
          ),
        ),
        5 => 
        array (
          0 => 
          array (
            'name' => 'received',
            'label' => 'LBL_RECEIVED',
          ),
          1 => 'assigned_user_name',
        ),
      ),
    ),
  ),
);
?>
