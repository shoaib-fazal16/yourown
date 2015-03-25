<?php

class hook{
	
	function addProperties(&$contract, $event, $arguments){
		if( isset($_REQUEST['module']) && ($_REQUEST['module'] == 'import') ){
			return true;
		}
		$seller_id = $contract->aos_contracts_leads_1leads_idb;
		$properties_arr = array();
		$c_properties_arr = array();//contract properties
		if(!empty($seller_id)){
			$seller = BeanFactory::getBean('Leads', $seller_id);
			$s_property_list = $seller->get_linked_beans('leads_acq2_property_information_1', 'ACQ2_Property_Information');
			foreach($s_property_list as $property){
				$properties_arr[] = $property->id;
			}
		}
		$rel_name = 'aos_contracts_acq2_property_information_1';
		$property_list = $contract->get_linked_beans($rel_name, 'ACQ2_Property_Information');
		foreach($property_list as $property){
			$c_properties_arr[] = $property->id;
			if(!in_array($property->id, $properties_arr)){
				$contract->$rel_name->delete($property->id);
			}
		}
		foreach($properties_arr as $p_id){
			if(!in_array($p_id, $c_properties_arr)){
				$contract->$rel_name->add($p_id);	
			}
		}	
	}
	
	function doContractRecalc(&$bean, $event, $arguments){
		$contract_id = '';
		if(is_object($bean->aos_contracts_acq2_property_information_1aos_contracts_ida)){
			$contract_id = $bean->aos_contracts_acq2_property_information_1aos_contracts_ida->focus->id;
		}else{
			$contract_id = $bean->aos_contracts_acq2_property_information_1aos_contracts_ida;
		}
		$this->DoRecalc($contract_id);
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
				$property_list = $contract->get_linked_beans('aos_contracts_acq2_property_information_1', 'ACQ2_Property_Information');
				foreach($property_list as $property){
					$gross_offer_c += $property->gross_offer_c;
					$delinquent_taxes_c += $property->delinquent_taxes_c;
					$net_offer_c += $property->net_offer_c;//just for lulz
				}
				$contract->gross_offer_c = $gross_offer_c;
				$contract->delinquent_taxes_c = $delinquent_taxes_c;
				$contract->net_offer_c = $contract->gross_offer_c - $contract->delinquent_taxes_c;
				$contract->status = 'Needs_Offer';
				$contract->save(false);
				
				$msg = $contract->net_offer_c.'='.$contract->gross_offer_c.' - '.$contract->delinquent_taxes_c;
				$GLOBALS['log']->fatal('HOOK'.$msg);
				
				return array('net_offer_c'=>$contract->net_offer_c, 'gross_offer_c' => $contract->gross_offer_c,'delinquent_taxes_c'=>$contract->delinquent_taxes_c);
			}
		}
	}
		
	public static function createTask(&$bean, $event, $arguments){
		if(!empty($bean->customer_signed_date) && isset($bean->customer_signed_date) && $bean->fetched_row['customer_signed_date'] != $bean->customer_signed_date ){
			$task = new Task();
			$property_list = $bean->get_linked_beans('aos_contracts_acq2_property_information_1', 'ACQ2_Property_Information');
			foreach($property_list as $property){
				$task->name = 'Start Title Work';
				$task->assigned_user_id = '2cfa6793-fb33-1643-af59-54eb4a2c83d9';
				$task->parent_type = 'ACQ2_Property_Information';
				$task->parent_id = $property->id ;
				$task->save();
			}
		}
	}


}