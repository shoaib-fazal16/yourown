<?php

//error_reporting(E_ALL);
//ini_set('display_errors', 1);

echo '<h3>Amortization schedule:</h3>';

global $timedate;
require_once('modules/yo_Sales/yo_Sales.php');
require_once('modules/yo_AmortizationSchedule/yo_AmortizationSchedule.php');

if( isset($_REQUEST['record'])&&!empty($_REQUEST['record']) ){
	$purchase = new yo_Sales();
	$purchase->retrieve($_REQUEST['record']);
	if(!empty($purchase->id)){
		$rel_name = 'yo_amortizationschedule_yo_sales';
		$payments_list = $purchase->get_linked_beans($rel_name, 'yo_AmortizationSchedule');
		$cnt = count($payments_list);
		if(!empty($cnt)){
			echo 'Seems its already have Amortization Schedule....';//Please confirm to proceed recalculation by this <a href="">link
			die;
		}
		//-------------
		//$purchase->purchase_date_c = '';
		//$purchase->automatic_payments_c = '';
		$monthly_tax = 0;
		if($purchase->property_taxes > 0){
			$monthly_tax = $purchase->property_taxes / 12;
		}
		echo '<br/>Monthly Tax: '.formatMoney($monthly_tax);
		
		$monthly_interest_rate = 0;
		if($purchase->interest_rate > 0){
			$monthly_interest_rate = ($purchase->interest_rate / 12) / 100;
		}
		echo '<br/>Monthly Interest Rate: '.$monthly_interest_rate;
		
		$db_pay_date = $timedate->to_db_date($purchase->payment_date);
		$year = substr($db_pay_date, 0, 4);
		$month = substr($db_pay_date, 5, 2);
		$day = substr($db_pay_date, 8, 2);
		$out = '';
		$_paydate = array('y' => $year, 'm' => $month, 'd' => $day);
		$cinterest = 0;
		$cprincipal = 0;
		$balance = $purchase->purchase_price - $purchase->down_payment;
		echo '<br/>Loan Amount:'.formatMoney($balance);
		$iteration = 0;
		while($balance > 0){
			$iteration++;
			if($iteration > 1000){break;echo 'Break! - maximum limit';}
			$payment = new yo_AmortizationSchedule();
			$payment->yo_amortizationschedule_yo_salesyo_sales_ida = $purchase->id;
			$payment->pay_num = $iteration;
			$payment->name = $payment->pay_num;
			$payment->paydate = $_paydate['y'].'-'.$_paydate['m'].'-'.$_paydate['d'];
			$payment->tax_amnt = $monthly_tax;
			
			$payment->payment = $purchase->monthly_payment_c;
			$payment->bbalance = $balance;
			$payment->interest = $balance * $monthly_interest_rate;
			
			$cinterest += $payment->interest;
			$payment->cinterest = $cinterest;//comulative!

			//last payment
			if($balance < $purchase->monthly_payment_c){
				$payment->payment = $balance + $payment->interest;// + $payment->tax_amnt;
			}
			$payment->principal = $payment->payment - $payment->interest;// + $payment->tax_amnt);
			
			$cprincipal += $payment->principal;
			$payment->cprincipal = $cprincipal;//comulative!

			$payment->ebalance = $balance - $payment->principal;
			$balance = $payment->ebalance;
			$payment->received = false;
			//$payment->description = '';
			$payment->save(false);
			
			$_paydate = getNextDate( $_paydate['y'], $_paydate['m'], $_paydate['d'] );
			
			$out .= '<tr>
				<td>'.$iteration.'</td>
				<td>'.$payment->paydate.'</td>
				<td>'.formatMoney($payment->bbalance).'</td>				
				<td>'.formatMoney($payment->payment).'</td>
				<td>'.formatMoney($payment->interest).'</td>
				<td>'.formatMoney($payment->principal).'</td>
				<td>'.formatMoney($payment->cinterest).'</td>
				<td>'.formatMoney($payment->cprincipal).'</td>
				<td>'.formatMoney($payment->ebalance).'</td>
				<td>'.formatMoney($payment->tax_amnt).'</td>
			</tr>';
			/*if($payment->bbalance < 0){
				echo '*';
				break;
			}*/
		}
		echo '<br/>Number of payments '.$iteration;
		
		$tbl = '<br/><table class="list">';
		$tbl .= '<tr>
			<td>#</td>
			<td>paydate</td>
			<td>begining balance</td>
			<td>payment</td>
			<td>interest</td>
			<td>principal</td>
			<td>cumulative interest</td>
			<td>cumulative principal</td>
			<td>ending balance</td>
			<td>tax amnt</td>
		</tr>';
		$tbl .= $out;
		echo $tbl .= '</table>';

		echo '<br/>---<a href="index.php?action=DetailView&module=yo_Sales&record='.$purchase->id.'">BACK</a>';
	}	
}else{
	echo 'Not enough parameters';
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

function formatMoney($m){
	return number_format($m, 2);
}