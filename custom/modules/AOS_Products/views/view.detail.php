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
		 echo $js_var;
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

                //Dependent logic
                if ($this->bean->phase == 'Marketing' || $this->bean->phase == 'Sold' )
                {
                    //Subpanels to hide
                    $hideSubpanels=array(
                        'aos_products_documents_1',                       
                    );

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
