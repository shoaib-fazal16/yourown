<?php

    if(!defined('sugarEntry') || !sugarEntry) die('Not A Valid Entry Point');
   
    require_once('include/MVC/View/views/view.detail.php');
   
    class AOS_ProductsViewDetail extends ViewDetail
    {
   
        function AOS_ProductsViewDetail()
        {
            parent::ViewDetail();
        }
   
		function display()
		{
			$js_var = <<<ss
			<script>

			$( document ).ready( function() {


				if($('#phase').val() =="Marketing" || $( '#phase').val() =="Sold")
				{

				$( '#detailpanel_2').hide();
				}
				
			} );

			
		</script>
ss;
			//echo $js_var;
			echo "<div id='county_detail_loading' style='display:none;width:5%;position: absolute;border:1px solid grey;border-radius:2px;top: 25%;left: 30%;margin-top: -30px;margin-left: 200px;background:white;z-index:9999;padding: 5px;text-align: center;'>Loading...</div>";
			echo "<div id='county_detail' style='display:none;width:60%;position: absolute;border:1px solid grey;border-radius:2px;top: 25%;left: 30%;margin-top: -30px;margin-left: -180px;background:white;z-index:9999;'></div>";
			echo '<script src="http://maps.googleapis.com/maps/api/js?key=AIzaSyCWpFlFGYoGQr6Z0jRLnpmYWlMBh5FJjcE"></script>';
			parent::display();	
		}
        /**
         * Override - Called from process(). This method will display subpanels.
         */
        protected function _displaySubPanels()
        {		
            if (isset($this->bean) && !empty($this->bean->id) && (file_exists('modules/' . $this->module . '/metadata/subpaneldefs.php') || file_exists('custom/modules/' . $this->module . '/metadata/subpaneldefs.php') || file_exists('custom/modules/' . $this->module . '/Ext/Layoutdefs/layoutdefs.ext.php'))) 
			{
                $GLOBALS['focus'] = $this->bean;
                require_once ('include/SubPanel/SubPanelTiles.php');
                $subpanel = new SubPanelTiles($this->bean, $this->module);
				$hideSubpanels=array(
					'yo_sales_aos_products',                       
				);
                //Dependent logic
                if ($this->bean->phase == 'Marketing' || $this->bean->phase == 'Sold' )
                {
                    //Subpanels to hide
                    $hideSubpanels[]='aos_products_documents_1';
					unset($hideSubpanels[0]); //remove yo_sales_aos_products
				}
				/* elseif($this->bean->phase_c == 'Acquisitions')
				{

					//Subpanels to hide
					$hideSubpanels=array(
						'leads_aos_products_1',						
					);
				} */	

				foreach ($hideSubpanels as $subpanelKey)
				{
					//Remove subpanel if set
					if (isset($subpanel->subpanel_definitions->layout_defs['subpanel_setup'][$subpanelKey]))
					{
						unset($subpanel->subpanel_definitions->layout_defs['subpanel_setup'][$subpanelKey]);
					}
				}
                echo $subpanel->display();
            }
        }
    }

?>
