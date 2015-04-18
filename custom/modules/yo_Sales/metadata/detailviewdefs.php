<?php
$module_name = 'yo_Sales';
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
          'AOS_GENLET' => 
          array (
            'customCode' => '<input type="button" class="button" onClick="showPopup();" value="{$APP.LBL_GENERATE_LETTER}">',
          ),
          4 => 
          array (
            'customCode' => '{if $bean->aclAccess("edit")}<input type="button" class="button" onClick="document.location=\'index.php?module=yo_AmortizationSchedule&action=calcschedule&record={$fields.id.value}\'" name="convert" value="Create Amortization Schedule">{/if}',
            'sugar_html' => 
            array (
              'type' => 'button',
              'value' => 'Create Amortization Schedule',
              'htmlOptions' => 
              array (
                'class' => 'button',
                'onClick' => 'document.location=\'index.php?module=yo_AmortizationSchedule&action=calcschedule&record={$fields.id.value}\'',
                'name' => 'convert',
                'id' => 'convert_lead_button',
              ),
              'template' => '{if $bean->aclAccess("edit")}[CONTENT]{/if}',
            ),
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
            'name' => 'name',
            'label' => 'LBL_NAME',
          ),
          1 => '',
        ),
        1 => 
        array (
          0 => 'assigned_user_name',
          1 => 
          array (
            'name' => 'purchase_date',
            'label' => 'LBL_PURCHASE_DATE',
          ),
        ),
        2 => 
        array (
          0 => 
          array (
            'name' => 'contract_name',
            'label' => 'LBL_CONTRACT_NAME',
          ),
          1 => 
          array (
            'name' => 'cash_terms',
            'studio' => 'visible',
            'label' => 'LBL_CASH_TERMS',
          ),
        ),
        3 => 
        array (
          0 => 
          array (
            'name' => 'purchase_price',
            'label' => 'LBL_PURCHASE_PRICE',
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
            'name' => 'interest_rate',
            'label' => 'LBL_INTEREST_RATE',
          ),
          1 => 
          array (
            'name' => 'monthly_payment',
            'label' => 'LBL_MONTHLY_PAYMENT',
          ),
        ),
        5 => 
        array (
          0 => 
          array (
            'name' => 'property_taxes',
            'label' => 'LBL_PROPERTY_TAXES',
          ),
          1 => 
          array (
            'name' => 'payment_date',
            'label' => 'LBL_PAYMENT_DATE',
          ),
        ),
        6 => 
        array (
          0 => 
          array (
            'name' => 'automatic_payments',
            'label' => 'LBL_AUTOMATIC_PAYMENTS',
          ),
          1 => 
          array (
            'name' => 'living_on_property',
            'label' => 'LBL_LIVING_ON_PROPERTY',
          ),
        ),
        7 => 
        array (
          0 => 'description',
          1 => 
          array (
            'name' => 'yo_sales_accounts_name',
          ),
        ),
        8 => 
        array (
          0 => 
          array (
            'name' => 'yo_sales_yo_investingentity_name',
          ),
          1 => 
          array (
            'name' => 'paid_off',
            'label' => 'LBL_PAID_OFF',
          ),
        ),
        9 => 
        array (
          0 => 
          array (
            'name' => 'notice_of_forfeiture_mailed',
            'label' => 'LBL_NOTICE_OF_FORFEITURE_MAILED',
          ),
          1 => 
          array (
            'name' => 'competion_of_forfeiture',
            'label' => 'LBL_COMPETION_OF_FORFEITURE',
          ),
        ),
        10 => 
        array (
          0 => 
          array (
            'name' => 'yo_sales_aos_products_name',
          ),
          1 => '',
        ),
        11 => 
        array (
          0 => 
          array (
            'name' => 'equity',
            'label' => 'LBL_EQUITY',
          ),
          1 => 
          array (
            'name' => 'total_paid',
            'label' => 'LBL_TOTAL_PAID',
          ),
        ),
        12 => 
        array (
          0 => 
          array (
            'name' => 'late_payment_date',
            'label' => 'LBL_LATE_PAYMENT_DATE',
          ),
          1 => '',
        ),
      ),
    ),
  ),
);
?>
