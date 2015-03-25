<?php
require_once( 'include/EditView/EditView2.php' );
class AOS_ProductsViewEdit extends SugarView {

	var $ev;
	var $type ='edit';
	var $useForSubpanel = true;
	var $useModuleQuickCreateTemplate = false;
	var $showTitle = true;

	function AOS_ProductsViewEdit() {
		parent::SugarView();
	}

	public function preDisplay() {
		$metadataFile = $this->getMetaDataFile();
		$this->ev = $this->getEditView();
		$this->ev->ss =& $this->ss;
		$this->ev->setup($this->module, $this->bean, $metadataFile, get_custom_file_if_exists('include/EditView/EditView.tpl'));
	}

	function display(){

		
		$js_var = <<<ss
		<script>
		$( document ).ready( function() {

		if($('#phase').val() =="Marketing" || $( '#phase').val() =="Sold")
				{

				$( '#detailpanel_2').hide();
				}
		$( "#phase" ).change(function() {

			if($('#phase').val() =="Marketing" || $( '#phase').val() =="Sold")
			{

				$( '#detailpanel_2').hide();
			}
			else
			{
				$( '#detailpanel_2').show();
			}

			});
		} );
		
	</script>
ss;
		$this->ev->process();
		echo $this->ev->display( $this->showTitle );
	    echo $js_var;
	}

	protected function getEditView() {
		return new EditView();
	}
}
?>
