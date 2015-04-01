<?php
class create_contract_logic_hook{
	public function createContract($bean, $event, $arguments){
		global $db;
		$contract_id = '';
		if(is_object($bean->aos_contracts_aos_products_1aos_contracts_ida)){
			$contract_id = $bean->aos_contracts_aos_products_1aos_contracts_ida->focus->id;
		}else{
			$contract_id = $bean->aos_contracts_aos_products_1aos_contracts_ida;
		}
		
		if(empty($contract_id)){
			$contract = new AOS_Contracts();
			$contract->name = 'Purchase Contract';
			$contract->gross_offer = $bean->gross_offer;
			$contract->status = 'Needs_Offer';
			if(!empty($bean->delinquent_taxes)){
				$contract->delinquent_taxes = $bean->delinquent_taxes;
			}else{
				$contract->delinquent_taxes = 0;
			}
			$contract->net_offer = $contract->gross_offer - $contract->delinquent_taxes;
			$contract->save();
			$contract->load_relationship('aos_contracts_aos_products_1');
			if(!empty($bean->id)){
				$contract->aos_contracts_aos_products_1->add($bean->id);
			}
			
			$contract->load_relationship('leads_aos_contracts_1');
			if((isset($_REQUEST['relate_id']) && !empty($_REQUEST['relate_id'])) && $_REQUEST['relate_to'] == 'leads_aos_products_1' ){
				$contract->leads_aos_contracts_1->add($_REQUEST['relate_id']);
			}
			else if(!empty($bean->leads_aos_products_1leads_ida)){
				$contract->leads_aos_contracts_1->add($bean->leads_aos_products_1leads_ida);
			}
		}
		else{
			$this->DoRecalc($contract_id);
		} 
	}
	
	public static function DoRecalc($contract_id){
		if(!empty($contract_id)){
			require_once('modules/AOS_Contracts/AOS_Contracts.php');
			$contract = new AOS_Contracts();
			$contract->retrieve($contract_id);
			if(!empty($contract->id)){
				$gross_offer_c = 0;
				$delinquent_taxes_c = 0;
				$net_offer_c = 0;
				$property_list = $contract->get_linked_beans('aos_contracts_aos_products_1', 'AOS_Products');
				foreach($property_list as $property){
					$gross_offer_c += $property->gross_offer;
					$delinquent_taxes_c += $property->delinquent_taxes;
					$net_offer_c += $property->net_offer;//just for lulz
				}
				$contract->gross_offer = $gross_offer_c;
				$contract->delinquent_taxes = $delinquent_taxes_c;
				$contract->net_offer = $contract->gross_offer - $contract->delinquent_taxes;
				$contract->status = 'Needs_Offer';
				$contract->save(false);
				
				$msg = $contract->net_offer.'='.$contract->gross_offer.' - '.$contract->delinquent_taxes;
				
				return array('net_offer'=>$contract->net_offer, 'gross_offer' => $contract->gross_offer,'delinquent_taxes'=>$contract->delinquent_taxes);
			}
		}
	}
}