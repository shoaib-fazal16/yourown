<?php

class PhaseChanges{
	
	function execute(&$bean, $event, $arguments){
		global $db;
		$seller_id = '';
		if(is_object($bean->leads_aos_contracts_1leads_ida)){
			$seller_id = $bean->leads_aos_contracts_1leads_ida->focus->id;
		}else{
			$seller_id = $bean->leads_aos_contracts_1leads_ida;
		}
		if(!empty($seller_id))
		{
			$seller = BeanFactory::getBean('Leads', $seller_id);
		}
		if(empty($bean->fetched_row['customer_signed_date']) && !empty($bean->customer_signed_date) && empty($bean->fetched_row['recording_confirmed']) && !empty($bean->recording_confirmed) && (!empty($seller_id) && $seller->status != 'Dead_Deal'))
		{
			$bean->status = 'Closed';
			$seller->status = 'closed';
			$seller->save();
			$rel_name = 'aos_contracts_aos_products_1';
			$property_list = $bean->get_linked_beans($rel_name, 'AOS_Products');
			foreach($property_list as $property){
				$result = $db->query("UPDATE aos_products set phase='Escrow' WHERE id='".$property->id."'");
			}
			$property_list = $seller->get_linked_beans('leads_aos_products_1', 'AOS_Products');
			foreach($property_list as $property){
				$result = $db->query("UPDATE aos_products set phase='Escrow' WHERE id='".$property->id."'");
			}
		}
	}


}