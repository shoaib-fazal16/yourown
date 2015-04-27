<?php
	require_once('include/tcpdf/config/lang/eng.php');
	require_once('custom/modules/KReports/tcpdf/tcpdf.php');
	
	global $db, $current_user;
	
	$ss = new Sugar_Smarty();
	
	
	$getAllPropertiesPhaseCount = 'SELECT count(id) as "count", phase FROM aos_products WHERE deleted = 0 GROUP BY phase';
	
	$result_getAllPropertiesPhaseCount = $db->query($getAllPropertiesPhaseCount);
	$marketing_count = 0;
	$sold_count = 0;
	$escrow_count = 0;
	while($row  = $db->fetchByAssoc($result_getAllPropertiesPhaseCount))
	{
		if($row['phase'] == 'Marketing')
			$marketing_count = $row['count'];
		if($row['phase'] == 'Sold')
			$sold_count = $row['count'];
		if($row['phase'] == 'Escrow')
			$escrow_count = $row['count'];
	}
	$ss->assign('MARKETING_COUNT', $marketing_count);
	$ss->assign('SOLD_COUNT', $sold_count);
	$ss->assign('ESCROW_COUNT', $escrow_count);
	
	$getPropertiesAddedToday = 'SELECT count(id) as "count", phase FROM aos_products WHERE date_entered = CURDATE() AND deleted = 0 GROUP BY phase';
	
	$result_getPropertiesAddedToday = $db->query($getPropertiesAddedToday);
	$marketing_added = 0;
	$sold_added = 0;
	$escrow_added = 0;
	while($row  = $db->fetchByAssoc($result_getPropertiesAddedToday))
	{
		if($row['phase'] == 'Marketing')
			$marketing_added = $row['count'];
		if($row['phase'] == 'Sold')
			$sold_added = $row['count'];
		if($row['phase'] == 'Escrow')
			$escrow_added = $row['count'];
	}
	$ss->assign('MARKETING_ADDED', $marketing_added);
	$ss->assign('SOLD_ADDED', $sold_added);
	$ss->assign('ESCROW_ADDED', $escrow_added);
	
	$getCountOffersMade = 'SELECT count(id) as "count" FROM aos_contracts WHERE offer_mailed_date = CURDATE() AND deleted = 0';
	$offer_made = 0;
	$result_getCountOffersMade = $db->query($getCountOffersMade);
	$row  = $db->fetchByAssoc($result_getCountOffersMade);
	$offer_made = $row['count'];
	
	$ss->assign('OFFER_MADE', $offer_made);
	
	//$getSellersContactedToday = 'SELECT count(id) FROM aos_contracts WHERE customer_signed_date = CURDATE() AND deleted = 0';
	
	//$result_getSellersContactedToday = $db->query($getSellersContactedToday);
	
	$getTasksCompletedToday = "SELECT * 
FROM tasks
WHERE tasks.status = 'Completed' AND tasks.deleted = 0 AND tasks.assigned_user_id IN ('2cfa6793-fb33-1643-af59-54eb4a2c83d9','73290ce7-b771-0068-429b-54e24445b8d0')
GROUP BY tasks.assigned_user_id";
	$diedre_tasks = array();
	$shanna_tasks = array();
	$result_getTasksCompletedToday = $db->query($getTasksCompletedToday);
	while($row  = $db->fetchByAssoc($result_getTasksCompletedToday))
	{

		if($row['assigned_user_id'] == '2cfa6793-fb33-1643-af59-54eb4a2c83d9'){
			$diedre_tasks[] = $row;
		}
		else if($row['assigned_user_id'] == '73290ce7-b771-0068-429b-54e24445b8d0')
		{
			$shanna_tasks[] = $row;
		}
	}	
//	echo "<pre>";
//	print_r($diedre_tasks);
//	die();
	$ss->assign('DIEDRE_TASKS', $diedre_tasks);
	$ss->assign('SHANNA_TASKS', $shanna_tasks);
	
/* 	$getTasksNotCompletedToday = "SELECT count(tasks.id) 
FROM `tasks`
WHERE tasks.status != 'Completed' AND tasks.date_due = CURDATE() AND tasks.deleted = 0 AND tasks.assigned_user_id IN ('2cfa6793-fb33-1643-af59-54eb4a2c83d9','73290ce7-b771-0068-429b-54e24445b8d0')
GROUP BY tasks.assigned_user_id";
	
	$result_getTasksNotCompletedToday = $db->query($getTasksNotCompletedToday); */
	$html = $ss->fetch("custom/modules/KReports/tpls/customActivityReport.tpl");
	if(get_magic_quotes_gpc())
	{
		$html = stripslashes($html);
	}
//echo $html;
	$pdf = new TCPDF(PDF_PAGE_ORIENTATION, PDF_UNIT, PDF_PAGE_FORMAT, true, 'UTF-8', false);

	$pdf->setDefaultMonospacedFont(PDF_FONT_MONOSPACED);

	$pdf->setMargins(PDF_MARGIN_LEFT, PDF_MARGIN_TOP, PDF_MARGIN_RIGHT);
	$pdf->setHeaderMargin(PDF_MARGIN_HEADER);
	$pdf->setFooterMargin(PDF_MARGIN_FOOTER);
	$pdf->setAutoPageBreak(TRUE, PDF_MARGIN_BOTTOM);
	$pdf->setFontSubsetting(true);
	$pdf->setFont('helvetica', '', 10, '', true);
	$pdf->setDisplayMode('fullpage', 'SinglePage', 'UseNone');
	$pdf->AddPage('L', 'A4');
	//$pdf->Cell(0, 0, 'A4 LANDSCAPE', 1, 1, 'C');

	$pdf->setTextShadow(array('enabled'=>true, 'depth_w'=>0.2, 'depth_h'=>0.2, 'color'=>array(196,196,196), 'opacity'=>1, 'blend_mode'=>'Normal'));

	$pdf->writeHTML($html, true, false, true, false, '');
	// ---------------------------------------------------------
	ob_clean();
	$pdf->Output('ActivityReport.pdf', 'D');
	die();
?>