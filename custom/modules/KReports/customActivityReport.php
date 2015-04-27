<?php
	global $db, $current_user;
	
	$getAllPropertiesPhaseCount = 'SELECT count(id) as "count", phase FROM aos_products WHERE deleted = 0 GROUP BY phase;';
	
	$result_getAllPropertiesPhaseCount = $db->query($getAllPropertiesPhaseCount);
	
	$getPropertiesAddedToday = 'SELECT count(id) as "count", phase FROM aos_products WHERE date_entered = CURDATE() AND deleted = 0 GROUP BY phase';
	
	$result_getPropertiesAddedToday = $db->query($getPropertiesAddedToday);
	
	$getCountOffersMade = 'SELECT count(id) as "count" FROM aos_contracts WHERE offer_mailed_date = CURDATE() AND deleted = 0';
	
	$result_getCountOffersMade = $db->query($getCountOffersMade);
	
	$getSellersContactedToday = 'SELECT count(id) FROM aos_contracts WHERE customer_signed_date = CURDATE() AND deleted = 0';
	
	$result_getSellersContactedToday = $db->query($getSellersContactedToday);
	
	$getTasksCompletedToday = "SELECT count(tasks.id) 
FROM `tasks`
WHERE tasks.status = 'Completed' AND tasks.date_modified = CURDATE() AND tasks.deleted = 0 AND tasks.assigned_user_id IN ('2cfa6793-fb33-1643-af59-54eb4a2c83d9','73290ce7-b771-0068-429b-54e24445b8d0')
GROUP BY tasks.assigned_user_id";
	
	$result_getTasksCompletedToday = $db->query($getTasksCompletedToday);
	
	$getTasksNotCompletedToday = "SELECT count(tasks.id) 
FROM `tasks`
WHERE tasks.status != 'Completed' AND tasks.date_due = CURDATE() AND tasks.deleted = 0 AND tasks.assigned_user_id IN ('2cfa6793-fb33-1643-af59-54eb4a2c83d9','73290ce7-b771-0068-429b-54e24445b8d0')
GROUP BY tasks.assigned_user_id";
	
	 $result_getTasksNotCompletedToday = $db->query($getTasksNotCompletedToday);
	
	
	
?>