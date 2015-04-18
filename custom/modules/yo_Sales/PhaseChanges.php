<?php

class yo_Sales_PhaseChanges{
	
	function execute(&$bean, $event, $arguments){
		global $db;
		global $current_user; 
		if((empty($bean->fetched_row['competion_of_forfeiture']) || !empty($bean->fetched_row['competion_of_forfeiture'])) && !empty($bean->competion_of_forfeiture)){
			if(is_object($bean->yo_sales_aos_productsaos_products_idb)){
				$property_id = $bean->yo_sales_aos_productsaos_products_idb->focus->id;
			}else{
				$property_id = $bean->yo_sales_aos_productsaos_products_idb;
			}
			if(!empty($property_id)){
				$property = BeanFactory::getBean('AOS_Products', $property_id);
				$property->phase = 'Marketing';
				$property->save();
			}
			$timestamp = date('Y-m-d G:i:s');
			$recordID = create_guid();
			$createMarketingRecord = 'INSERT INTO yo_Marketing (id, name, date_entered, date_modified, modified_user_id, created_by, deleted, assigned_user_id, status)
							VALUES ("'.$recordID.'", "'.CURDATE().'", "'.$timestamp.'", "'.$timestamp.'", "'.$current_user->id.'", "'.$current_user->id.'", "0", "'.$current_user->id.'", "Available")';
			$db->query($createMarketingRecord);
			
			$createRelationshipRecord = 'INSERT into yo_marketing_aos_products_c VALUES("'.create_guid().'", "'.$timestamp.'", "0", "'.$recordID.'", "'.$property->id.'" )';
			
			$db->query($createRelationshipRecord);
		}
	}


}