<?php

class MarketingPhaseChanges{
	
	function execute(&$bean, $event, $arguments){
		$contract_id = '';
		$property_id = '';
		global $db;
		if(is_object($bean->yo_marketing_aos_productsaos_products_ida)){
			$property_id = $bean->yo_marketing_aos_productsaos_products_ida->focus->id;
		}else{
			$property_id = $bean->yo_marketing_aos_productsaos_products_ida;
		}
		if(!empty($property_id))
		{
			$property = BeanFactory::getBean('AOS_Products', $property_id);
			
			if(is_object($property->aos_contracts_aos_products_1aos_contracts_ida)){
				$contract_id = $property->aos_contracts_aos_products_1aos_contracts_ida->focus->id;
			}else{
				$contract_id = $property->aos_contracts_aos_products_1aos_contracts_ida;
			}
			if(!empty($contract_id))
			{
				$contract = BeanFactory::getBean('AOS_Contracts', $contract_id);
			}
			$result = $db->query('SELECT s.competion_of_forfeiture from yo_sales as s LEFT JOIN yo_sales_aos_products_c as sp ON s.id = sp.yo_sales_aos_productsyo_sales_ida AND sp.yo_sales_aos_productsaos_products_idb="'.$property_id.'" AND sp.deleted=0 WHERE s.deleted=0 ORDER BY s.date_entered DESC LIMIT 1');
			$row = $db->fetchByAssoc($result);
			if(!empty($row))
			{
				if(empty($bean->sold) && !empty($contract_id) && !empty($contract->recording_confirmed) && !empty($row['competion_of_forfeiture']))
				{
					if(empty($bean->fetched_row['available_for_sale']) && !empty($bean->available_for_sale))
					{
						$bean->status = 'Active';
					}
					if(empty($bean->fetched_row['sold']) && !empty($bean->sold))
					{
						$bean->status = 'Sold';
					}
					$result = $db->query("UPDATE aos_products set phase='Marketing' WHERE id='".$property->id."'");
				}
				else if(!empty($bean->sold) && !empty($contract_id) && empty($row['competion_of_forfeiture']))
				{
					$result = $db->query("UPDATE aos_products set phase='Sold' WHERE id='".$property->id."'");
				}				
			}

		}
		
		
	}


}