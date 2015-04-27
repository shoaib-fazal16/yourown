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
?>