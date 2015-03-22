<?php
if (!defined('sugarEntry') || !sugarEntry)
    die('Not A Valid Entry Point');
class EquityCalculator
{
	function equityCalculator($bean, $event, $arguments)
	{
		global $current_user;
		$db = $GLOBALS['db'];
		
		$getTotalPaymentQuery = 'SELECT SUM(yo_amortizationschedule.payment) as "total_payment"
								FROM yo_amortizationschedule
								LEFT JOIN yo_amortizationschedule_yo_sales_c
								ON yo_amortizationschedule.id = yo_amortizationschedule_yo_salesyo_amortizationschedule_idb AND yo_amortizationschedule.deleted = 0
								WHERE yo_amortizationschedule_yo_sales_c.yo_amortizationschedule_yo_salesyo_sales_ida = "'.$bean->id.'" AND yo_amortizationschedule.received = 1 AND yo_amortizationschedule_yo_sales_c.deleted = 0' ;
		$result = $db->query($getTotalPaymentQuery);
		while($totalPayment = $db->fetchByAssoc($result)){
			$bean->equity = (($bean->down_payment + $totalPayment['total_payment']) / $bean->purchase_price) * 100 ."%" ;
			
			$bean->total_paid = $bean->down_payment + $totalPayment['total_payment'];
		}
		
	}
}

?>