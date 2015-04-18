<?php

class MarketingPhaseChanges{
	
	function execute(&$bean, $event, $arguments){
		$property_id = '';
		global $db;	
		if((empty($bean->fetched_row['sold']) || !empty($bean->fetched_row['sold'])) && !empty($bean->sold)){
			if(is_object($bean->yo_marketing_aos_productsaos_products_ida)){
				$property_id = $bean->yo_marketing_aos_productsaos_products_ida->focus->id;
			}else{
				$property_id = $bean->yo_marketing_aos_productsaos_products_ida;
			}
			if(!empty($property_id)){
				$property = BeanFactory::getBean('AOS_Products', $property_id);
				$property->phase = 'Sold';
				$property->save();
			}
		}
		
		if((empty($bean->fetched_row['available_for_sale']) || !empty($bean->fetched_row['available_for_sale']) )&& !empty($bean->available_for_sale)){
			$bean->status = 'Active' ;
		}
	}


}