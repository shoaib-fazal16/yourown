<?php
class create_contract_logic_hook{
	public function createContract($bean, $event, $arguments){
		global $db;
		$contract_id = '';
		if(is_object($bean->aos_contracts_acq2_property_information_1aos_contracts_ida)){
			$contract_id = $bean->aos_contracts_acq2_property_information_1aos_contracts_ida->focus->id;
		}else{
			$contract_id = $bean->aos_contracts_acq2_property_information_1aos_contracts_ida;
		}
		
		if(empty($contract_id)){
			$contract = new AOS_Contracts();
			$contract->name = 'Purchase Contract';
			$contract->gross_offer = $bean->gross_offer;
			$contract->status = 'Needs_Offer';
			$contract->delinquent_taxes = $bean->delinquent_taxes;
			$contract->net_offer = $contract->gross_offer - $contract->delinquent_taxes;
			$contract->save();
			$contract->load_relationship('aos_contracts_acq2_property_information_1');
			if(!empty($bean->id)){
				$contract->aos_contracts_acq2_property_information_1->add($bean->id);
			}
			
			$contract->load_relationship('aos_contracts_leads_1');
			if(!empty($bean->leads_acq2_property_information_1leads_ida)){
				$contract->aos_contracts_leads_1->add($bean->leads_acq2_property_information_1leads_ida);
			}
		} 
	}
}