<?php
$module_name = 'AOS_Contracts';
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
          4 => 
          array (
            'customCode' => '<input type="button" class="button" onClick="showPopup(\'pdf\');" value="{$MOD.LBL_PRINT_AS_PDF}">',
          ),
          5 => 
          array (
            'customCode' => '<input type="button" class="button" onClick="showPopup(\'emailpdf\');" value="{$MOD.LBL_EMAIL_PDF}">',
          ),
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
      'syncDetailEditViews' => true,
      'tabDefs' => 
      array (
        'DEFAULT' => 
        array (
          'newTab' => false,
          'panelDefault' => 'expanded',
        ),
      ),
    ),
    'panels' => 
    array (
      'default' => 
      array (
        0 => 
        array (
          0 => 
          array (
            'name' => 'status',
            'studio' => 'visible',
            'label' => 'LBL_STATUS',
          ),
          1 => 'name',
        ),
        1 => 
        array (
          0 => 
          array (
            'name' => 'verbal_offer',
            'label' => 'LBL_VERBAL_OFFER',
          ),
          1 => 
          array (
            'name' => 'verbally_accepted',
            'label' => 'LBL_VERBALLY_ACCEPTED',
          ),
        ),
        2 => 
        array (
          0 => 
          array (
            'name' => 'gross_offer',
            'label' => 'LBL_GROSS_OFFER',
          ),
          1 => 
          array (
            'name' => 'start_date',
            'label' => 'LBL_START_DATE',
          ),
        ),
        3 => 
        array (
          0 => 
          array (
            'name' => 'delinquent_taxes',
            'label' => 'LBL_DELINQUENT_TAXES',
          ),
          1 => 
          array (
            'name' => 'expiration_date',
            'label' => 'LBL_EXPIRATION_DATE',
          ),
        ),
        4 => 
        array (
          0 => 
          array (
            'name' => 'net_offer',
            'label' => 'LBL_NET_OFFER',
          ),
          1 => 
          array (
            'name' => 'coe_date',
            'label' => 'LBL_COE_DATE',
          ),
        ),
        5 => 
        array (
          0 => 
          array (
            'name' => 'customer_signed_date',
            'label' => 'LBL_CUSTOMER_SIGNED_DATE',
          ),
          1 => 
          array (
            'name' => 'company_signed_date',
            'label' => 'LBL_COMPANY_SIGNED_DATE',
          ),
        ),
        6 => 
        array (
          0 => 
          array (
            'name' => 'offer_rejected',
            'label' => 'LBL_OFFER_REJECTED',
          ),
          1 => 
          array (
            'name' => 'renewal_reminder_date',
            'label' => 'LBL_RENEWAL_REMINDER_DATE',
          ),
        ),
        7 => 
        array (
          0 => 
          array (
            'name' => 'mailed_to_notary',
            'label' => 'LBL_MAILED_TO_NOTARY',
          ),
          1 => 
          array (
            'name' => 'confirmed_signing',
            'label' => 'LBL_CONFIRMED_SIGNING',
          ),
        ),
        8 => 
        array (
          0 => 
          array (
            'name' => 'actual_coe',
            'label' => 'LBL_ACTUAL_COE',
          ),
          1 => 
          array (
            'name' => 'leads_aos_contracts_1_name',
          ),
        ),
        9 => 
        array (
          0 => 
          array (
            'name' => 'recording_confirmed',
            'label' => 'LBL_RECORDING_CONFIRMED',
          ),
          1 => '',
        ),
        10 => 
        array (
          0 => 
          array (
            'name' => 'contract_notes',
            'studio' => 'visible',
            'label' => 'LBL_CONTRACT_NOTES',
          ),
          1 => '',
        ),
      ),
    ),
  ),
);
?>
