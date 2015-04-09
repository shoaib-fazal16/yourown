<?php

class ProductPhaseChanges{
	
	function execute(&$bean, $event, $arguments){
		$seller_id = '';
		$contract_id = '';
		if(is_object($bean->leads_aos_products_1leads_ida)){
			$seller_id = $bean->leads_aos_products_1leads_ida->focus->id;
		}else{
			$seller_id = $bean->leads_aos_products_1leads_ida;
		}
		if(!empty($seller_id))
		{
			$seller = BeanFactory::getBean('Leads', $seller_id);
		}
		if(is_object($bean->aos_contracts_aos_products_1aos_contracts_ida)){
			$contract_id = $bean->aos_contracts_aos_products_1aos_contracts_ida->focus->id;
		}else{
			$contract_id = $bean->aos_contracts_aos_products_1aos_contracts_ida;
		}
		if(!empty($contract_id))
		{
			$contract = BeanFactory::getBean('AOS_Contracts', $contract_id);
		}
		if((!empty($contract_id) && !empty($contract->customer_signed_date) && !empty($contract->recording_confirmed)) && (!empty($seller_id) && $seller->status != 'Dead_Deal'))
		{
			$contract->status = 'Closed';
			$contract->save();
			$seller->status = 'closed';
			$seller->save();
			$bean->phase = 'Escrow';
		}
	}


}