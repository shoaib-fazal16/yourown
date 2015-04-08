<?php
if (!defined('sugarEntry') || !sugarEntry)
    die('Not A Valid Entry Point');
require_once('modules/yo_Sales/yo_Sales.php');
require_once('modules/yo_AmortizationSchedule/yo_AmortizationSchedule.php');
class calculateSchedule
{
	function calculate($bean, $event, $arguments)
	{
		//if save is not from calcschedule action then execute below code
		if(!$bean->from_calcschedule)
		{
			global $current_user, $db, $timedate;
			$rel_name = 'yo_amortizationschedule_yo_sales';
			$purchases = $bean->get_linked_beans($rel_name, 'yo_AmortizationSchedule');
			
			if(count($purchases) > 0)
			{			
				$purchase = $purchases[0];
				
				$total_paid = 0;
				$getTotalPaymentQuery = 'SELECT SUM(yo_amortizationschedule.payment) as "total_payment"
										FROM yo_amortizationschedule
										LEFT JOIN yo_amortizationschedule_yo_sales_c
										ON yo_amortizationschedule.id = yo_amortizationschedule_yo_salesyo_amortizationschedule_idb AND yo_amortizationschedule.deleted = 0
										WHERE yo_amortizationschedule_yo_sales_c.yo_amortizationschedule_yo_salesyo_sales_ida = "'.$purchase->id.'" AND yo_amortizationschedule.received = 1 AND yo_amortizationschedule_yo_sales_c.deleted = 0' ;
										
				$result = $db->query($getTotalPaymentQuery);
				while($totalPayment = $db->fetchByAssoc($result)){	
					$total_paid = $purchase->down_payment + $totalPayment['total_payment'];
				}
				$payments = $purchase->get_linked_beans($rel_name, 'yo_amortizationschedule');
				$sep='';
				$payment_ids='';
				foreach($payments as $payment)
				{
					if(!$payment->received)
					{
						$payment_ids .= $sep."'".$payment->id."'";
						$sep = ',';
					}
				}
				
				//get max pay_num and date paid
				$max_pay_num_paid = 0;
				$max_date_paid = 0;
				foreach($payments as $payment)
				{					
					if($payment->received)
					{			
						if($max_date_paid < strtotime($payment->paydate))
						{
							$max_date_paid = strtotime($payment->paydate);
						}
						if($max_pay_num_paid < $payment->pay_num){
							$max_pay_num_paid = $payment->pay_num;
						}
					}
				}
				//delete all non paid payments
				if(!empty($payment_ids))
				{
					$query = "delete from yo_amortizationschedule_yo_sales_c where yo_amortizationschedule_yo_salesyo_amortizationschedule_idb IN (".$payment_ids.")";
					$db->query($query);
					$query = "delete from yo_amortizationschedule where id IN (".$payment_ids.")";
					$db->query($query);
				}
				
				$balance = $purchase->purchase_price - $total_paid;
				$monthly_tax = 0;
				if($purchase->property_taxes > 0){
					$monthly_tax = $purchase->property_taxes / 12;
				}
				
				
				$monthly_interest_rate = 0;
				if($purchase->interest_rate > 0){
					$monthly_interest_rate = ($purchase->interest_rate / 12) / 100;
				}
				
				$db_pay_date = date("Y-m-d", strtotime("+1 month", $max_date_paid));

				//$db_pay_date = $timedate->to_db_date($payment_date);

				$year = substr($db_pay_date, 0, 4);
				$month = substr($db_pay_date, 5, 2);
				$day = substr($db_pay_date, 8, 2);
				$out = '';
				$_paydate = array('y' => $year, 'm' => $month, 'd' => $day);
				$cinterest = 0;
				$cprincipal = 0;
				$iteration = $max_pay_num_paid;
				while($balance > 0){
					$iteration++;
					if($iteration > 1000){break;}

					$pay_num = $iteration;
					$name = $pay_num;
					$paydate = $_paydate['y'].'-'.$_paydate['m'].'-'.$_paydate['d'];
					$tax_amnt = $monthly_tax;
					
					$_payment = $purchase->monthly_payment;
					$bbalance = $balance;
					$interest = $balance * $monthly_interest_rate;
					
					$cinterest += $interest;
					$cinterest = $cinterest;//comulative!

					//last payment
					if($balance < $purchase->monthly_payment){
						$_payment = $balance + $interest;// + $tax_amnt;
					}
					$principal = $_payment - $interest;// + $tax_amnt);
					
					$cprincipal += $principal;

					$ebalance = $balance - $principal;
					$balance = $ebalance;
					$received = false;

					$id = create_guid();
					$query = "INSERT INTO yo_amortizationschedule (id, name, pay_num, paydate, tax_amnt, payment, bbalance, interest, cinterest, principal, cprincipal, ebalance, received) VALUES ('".$id."', '".$name."', '".$pay_num."', '".$paydate."', ".$tax_amnt.", ".$_payment.", ".$bbalance.", ".$interest.", ".$cinterest.", ".$principal.", ".$cprincipal.", ".$ebalance.", 0)";
					$db->query($query);
					
					$rel_query = "INSERT INTO yo_amortizationschedule_yo_sales_c (id, yo_amortizationschedule_yo_salesyo_sales_ida, yo_amortizationschedule_yo_salesyo_amortizationschedule_idb, deleted, date_modified) VALUES ('".create_guid()."', '".$purchase->id."', '".$id."', 0, '".gmdate("Y-m-d H:i:s")."')";
					$db->query($rel_query);
					
					$_paydate = $this->getNextDate( $_paydate['y'], $_paydate['m'], $_paydate['d'] );

				}
			}
		}
	}
	
	function getNextDate($y, $m, $d){
		$new_m = (int)$m + 1;
		$new_y = (int)$y;
		if($new_m == 13){
			$new_m = '01';
			$new_y += 1;
		}elseif($new_m < 10){
			$new_m = '0'.$new_m;
		}
		return array( 'y' => $new_y, 'm' => $new_m, 'd' => $d );
	}
}

?>