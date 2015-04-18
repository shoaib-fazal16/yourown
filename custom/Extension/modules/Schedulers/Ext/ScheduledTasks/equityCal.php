<?php
if (!defined('sugarEntry') || !sugarEntry)
    die('Not A Valid Entry Point');

$job_strings[] = 'equityCal';
// $GLOBALS['log']->fatal(print_r($job_strings,true));

	
	function equityCal($bean, $event, $arguments)
	{
		global $current_user;
		$db = $GLOBALS['db'];
		
		$selectAllpchPurchase = 'SELECT down_payment,purchase_price,id
								FROM yo_sales';
								
		$result = $db->query($selectAllpchPurchase);
		
		while($row = $db->fetchByAssoc($result)){
			$getTotalPaymentQuery = 'SELECT SUM(payment) as "total_payment"
								FROM yo_amortizationschedule
								LEFT JOIN yo_amortizationschedule_yo_sales_c
								ON yo_amortizationschedule.id = yo_amortizationschedule_yo_sales_c.yo_amortizationschedule_yo_salesyo_amortizationschedule_idb AND yo_amortizationschedule.deleted = 0
								WHERE yo_amortizationschedule_yo_sales_c.yo_amortizationschedule_yo_salesyo_sales_ida = "'.$row['id'].'" AND yo_amortizationschedule.received = 1 AND yo_amortizationschedule_yo_sales_c.deleted = 0' ;
			$result_ = $db->query($getTotalPaymentQuery);
			while($totalPayment = $db->fetchByAssoc($result_)){
				$equity = (($row['down_payment'] + $totalPayment['total_payment']) / $row['purchase_price']) * 100 ."%" ;
				$updateQuery = 'UPDATE yo_sales
							SET equity = "'.$equity.'"
							WHERE id = "'.$row['id'].'"';
				$db->query($updateQuery);
				
				$total_paid = $row['down_payment'] + $totalPayment['total_payment'];
				$updatetotal_paidQuery = 'UPDATE yo_sales
							SET total_paid = "'.$total_paid.'"
							WHERE id = "'.$row['id'].'"';
				$db->query($updatetotal_paidQuery);
				
			}
		}
		return true;

	}