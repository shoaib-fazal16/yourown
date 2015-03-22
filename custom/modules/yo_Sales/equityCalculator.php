<?php
if (!defined('sugarEntry') || !sugarEntry)
    die('Not A Valid Entry Point');
class EquityCalculator
{
	
	/* the fucntion will assign all the cases to the user: System */
	function equityCalculator($bean, $event, $arguments)
	{
		global $current_user;
		$db = $GLOBALS['db'];
		
		$getTotalPaymentQuery = 'SELECT SUM(ax_aspayment.payment) as "total_payment"
								FROM ax_aspayment
								LEFT JOIN ax_aspayment_pch_purchase_c
								ON ax_aspayment.id = ax_aspayment_pch_purchaseax_aspayment_idb AND ax_aspayment.deleted = 0
								WHERE ax_aspayment_pch_purchase_c.ax_aspayment_pch_purchasepch_purchase_ida = "'.$bean->id.'" AND ax_aspayment.received = 1 AND ax_aspayment_pch_purchase_c.deleted = 0' ;
		$result = $db->query($getTotalPaymentQuery);
		while($totalPayment = $db->fetchByAssoc($result)){
			$bean->equity = (($bean->down_payment + $totalPayment['total_payment']) / $bean->purchase_price) * 100 ."%" ;
			
			$bean->total_paid = $bean->down_payment + $totalPayment['total_payment'];
		}
		
	}
}

?>