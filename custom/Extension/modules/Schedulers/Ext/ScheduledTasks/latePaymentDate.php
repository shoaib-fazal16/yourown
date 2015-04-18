<?php
if (!defined('sugarEntry') || !sugarEntry)
    die('Not A Valid Entry Point');

$job_strings[] = 'latePaymentDate';
// $GLOBALS['log']->fatal(print_r($job_strings,true));

	
	function latePaymentDate($bean, $event, $arguments)
	{
		global $current_user;
		$db = $GLOBALS['db'];
		
		$updateLatePaymentDate = 'UPDATE yo_sales
									SET late_payment_date = DATEDIFF(CURDATE(), payment_date)
									WHERE payment_date < CURDATE()';
								
		$result = $db->query($updateLatePaymentDate);
		
		$updateDOM = 'UPDATE yo_marketing
						SET yo_marketing.date_of_month = DATEDIFF(CURDATE(),yo_marketing.available_for_sale)
						WHERE yo_marketing.available_for_sale IS NOT NULL';
								
		$result = $db->query($updateDOM);
		
		return true;

	}