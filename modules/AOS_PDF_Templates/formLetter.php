<?php
/**
 * Products, Quotations & Invoices modules.
 * Extensions to SugarCRM
 * @package Advanced OpenSales for SugarCRM
 * @subpackage Products
 * @copyright SalesAgility Ltd http://www.salesagility.com
 * 
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU AFFERO GENERAL PUBLIC LICENSE as published by
 * the Free Software Foundation; either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU AFFERO GENERAL PUBLIC LICENSE
 * along with this program; if not, see http://www.gnu.org/licenses
 * or write to the Free Software Foundation,Inc., 51 Franklin Street,
 * Fifth Floor, Boston, MA 02110-1301  USA
 *
 * @author Salesagility Ltd <support@salesagility.com>
 */

class formLetter{

	static function LVSmarty(){
		global $app_strings, $sugar_config;
		if (preg_match('/^6\./', $sugar_config['sugar_version'])) {
			$script = '<a href="#" style="width: 150px" class="menuItem" onmouseover="hiliteItem(this,\'yes\');" onmouseout="unhiliteItem(this);" onclick="showPopup()">'.$app_strings['LBL_GENERATE_LETTER'].'</a>';
		}
		else{
			$script = ' <input class="button" type="button" value="'.$app_strings['LBL_GENERATE_LETTER'].'" ' .'onClick="showPopup();">';
    		}

		return $script;
        }

    static function getModuleTemplates($module){
        global $db;
        $templates = array();

        $sql = "SELECT id,name FROM aos_pdf_templates WHERE type = '".$module."' AND deleted = 0  AND active = 1";
        $result = $db->query($sql);
        while ($row = $db->fetchByAssoc($result)) {
            $templates[$row['id']] = $row['name'];
        }

        return $templates;
    }

	static function LVPopupHtml($module){
		global $app_strings;

        $templates = formLetter::getModuleTemplates($module);
		
		if(!empty($templates)){
		echo '	<div id="popupDiv_ara" style="display:none;position:fixed;top: 39%; left: 41%;opacity:1;z-index:9999;background:#FFFFFF;">
 				<table style="border: #000 solid 2px;padding-left:40px;padding-right:40px;padding-top:10px;padding-bottom:10px;font-size:110%;" >
					<tr height="20">
						<td colspan="2">
						<b>'.$app_strings['LBL_SELECT_TEMPLATE'].':-</b>
						</td>
					</tr>';
			foreach ($templates as $templateid => $template ) {
				$js = "document.getElementById('popupDivBack_ara').style.display='none';document.getElementById('popupDiv_ara').style.display='none';";
				echo '<tr height="20">
					<td width="17" valign="center"><a href="#" onclick="document.getElementById(\'popupDiv_ara\').style.display=\'none\';sListView.send_form(true, \''.$_REQUEST['module'].
                                '\', \'index.php?templateID='.$templateid.'&entryPoint=formLetter\',\''.$app_strings['LBL_LISTVIEW_NO_SELECTED'].'\');document.getElementById(\'popupDivBack_ara\').style.display=\'none\';"><img src="themes/default/images/txt_image_inline.gif" width="16" height="16" /></a></td>
					<td scope="row" align="left"><b><a href="#" onclick="document.getElementById(\'popupDiv_ara\').style.display=\'none\';sListView.send_form(true, \''.$_REQUEST['module'].
                                '\', \'index.php?templateID='.$templateid.'&entryPoint=formLetter\',\''.$app_strings['LBL_LISTVIEW_NO_SELECTED'].'\');document.getElementById(\'popupDivBack_ara\').style.display=\'none\';">'.$template.'</a></b></td></tr>';
			}
		echo '<tr style="height:10px;"><tr><tr><td colspan="2"><button style=" display: block;margin-left: auto;margin-right: auto" onclick="document.getElementById(\'popupDivBack_ara\').style.display=\'none\';document.getElementById(\'popupDiv_ara\').style.display=\'none\';return false;">Cancel</button></td></tr>
			</table>
				</div>
				<div id="popupDivBack_ara" onclick="this.style.display=\'none\';document.getElementById(\'popupDiv_ara\').style.display=\'none\';" style="top:0px;left:0px;position:fixed;height:100%;width:100%;background:#000000;opacity:0.5;display:none;vertical-align:middle;text-align:center;z-index:9998;">
				</div>
				<script>
					function showPopup(){
					if(sugarListView.get_checks_count() < 1)
					{
						alert(\''.$app_strings['LBL_LISTVIEW_NO_SELECTED'].'\');
					}
					else
					{
						var ppd=document.getElementById(\'popupDivBack_ara\');
						var ppd2=document.getElementById(\'popupDiv_ara\');
						if(ppd!=null && ppd2!=null){
							ppd.style.display=\'block\';
							ppd2.style.display=\'block\';
						}else{
							alert(\'Error!\');
						}
					}
					}
				</script>';
			}
		else{
			echo '<script>
				function showPopup(){
				alert(\''.$app_strings['LBL_NO_TEMPLATE'].'\');		
				}
			</script>';
		}
	}
	
	static function DVPopupHtml($module){
		global $app_list_strings,$app_strings,$db;
		
        $templates = formLetter::getModuleTemplates($module);
		require_once('modules/AOS_Products/AOS_Products.php');
        if(!empty($templates)){
			if($module == 'Leads'){
					 $sql = "SELECT * FROM aos_pdf_templates WHERE type = '".$module."' AND deleted = 0  AND active = 1";
					$result = $db->query($sql);
					$countLine = $db->getRowCount($result); 
					$properties_query = "SELECT aos_products.id 
						FROM aos_products
						LEFT JOIN leads_aos_products_1_c	
						ON aos_products.id = leads_aos_products_1_c.leads_aos_products_1aos_products_idb
						WHERE leads_aos_products_1_c.leads_aos_products_1leads_ida = '".$_REQUEST['record']."' AND aos_products.deleted = 0 AND leads_aos_products_1_c.deleted = 0 AND aos_products.`name` IS NOT NULL"; 
					$result_properties = $db->query($properties_query);
					$countLine_properties = $db->getRowCount($result_properties);
			
					if($countLine != 0){	
						if($countLine_properties != 0){
							echo '	<div id="list_popup" style="display:none;position:fixed;top: 39%; left: 41%;opacity:1;z-index:9999;background:#FFFFFF;">
							<form id="popupForm" action="index.php?entryPoint=formLetter" method="post">
							<table style="border: #000 solid 2px;padding-left:40px;padding-right:40px;padding-top:10px;padding-bottom:10px;font-size:110%;" >
								<tr height="20">
									<td colspan="2">
									<b>Please Select Property:-</b>
									</td>
								</tr>';
							$index=0;
							while ($row = $db->fetchByAssoc($result_properties)) {
								$property_id = $row['id'];
								$property_bean = new AOS_Products();
								$property_bean->retrieve($property_id);
							
								echo '<tr height="20">
								<td width="17" valign="center"><input type="checkbox" id="property_'.$index.'" name="property_id[]" value="'.$property_bean->id.'"></td>
								<td scope="row" align="left"><b><a href="#" >'.$property_bean->name.'</a></b></td></tr>';
								$index++;
							}
							echo '		<input type="hidden" name="templateID" value="" />
							<input type="hidden" name="module" value="'.$module.'" />
							<input type="hidden" name="uid" value="'.$_REQUEST['record'].'" />
							<tr style="height:10px;"><tr><tr><td colspan="2"><button style=" display: block;margin-left: auto;margin-right: auto" onclick="document.getElementById(\'list_popup\').style.display=\'none\';document.getElementById(\'popupDivBack_ara\').style.display=\'block\';document.getElementById(\'popupDiv_ara\').style.display=\'block\';
							
							return false;
							">Next</button></td></tr>
							</table>
							</form>
							</div>';	
				
						}
					echo '	<div id="popupDiv_ara" style="display:none;position:fixed;top: 39%; 	left: 41%;opacity:1;z-index:9999;background:#FFFFFF;">
						<form id="popupForm" action="index.php?entryPoint=formLetter" method="post">
						<table style="border: #000 solid 2px;padding-left:40px;padding-right:40px;padding-top:10px;padding-bottom:10px;font-size:110%;" >
							<tr height="20">
								<td colspan="2">
								<b>'.$app_strings['LBL_SELECT_TEMPLATE'].':-</b>
								</td>
						</tr>';
					while ($row = $db->fetchByAssoc($result)) {
						$templateid = $row['id'];
						$js = "document.getElementById('popupDivBack_ara').style.display='none';document.getElementById('popupDiv_ara').style.display='none';var form=document.getElementById('popupForm');if(form!=null){form.templateID.value='".$templateid."';form.submit();}else{alert('Error!');}";
						echo '<tr height="20">
						<td width="17" valign="center"><a href="#" onclick="'.$js.'"><img src="themes/default/images/txt_image_inline.gif" width="16" height="16" /></a></td>
						<td scope="row" align="left"><b><a href="#" onclick="'.$js.'">'.$row['name'].'</a></b></td></tr>';
					}
				echo '		<input type="hidden" name="templateID" value="" />
					<input type="hidden" name="module" value="'.$module.'" />
					<input type="hidden" name="uid" value="'.$_REQUEST['record'].'" />
					</form>
					<tr style="height:10px;"><tr><tr><td colspan="2"><button style=" display: block;margin-left: auto;margin-right: auto" onclick="document.getElementById(\'popupDivBack_ara\').style.display=\'none\';document.getElementById(\'popupDiv_ara\').style.display=\'none\';return false;">Cancel</button></td></tr>
					</table>
					</div>
					
					<div id="popupDivBack_ara" onclick="this.style.display=\'none\';document.getElementById(\'popupDiv_ara\').style.display=\'none\';" style="top:0px;left:0px;position:fixed;height:100%;width:100%;background:#000000;opacity:0.5;display:none;vertical-align:middle;text-align:center;z-index:9998;">
					</div>
					<script>
						function showPopup(){
							var ppd=document.getElementById(\'popupDivBack_ara\');
							var ppd2=document.getElementById(\'popupDiv_ara\');
							var ppd3=document.getElementById(\'list_popup\');
							if(ppd!=null && ppd2!=null && ppd3!=null){
								//ppd.style.display=\'block\';
								// ppd2.style.display=\'block\';
								ppd3.style.display=\'block\';
								
							}else{
								alert(\'Error!\');
							}
						}
					</script>';
				} 
			}else{
							echo '	<div id="popupDiv_ara" style="display:none;position:fixed;top: 39%; left: 41%;opacity:1;z-index:9999;background:#FFFFFF;">
 				<form id="popupForm" action="index.php?entryPoint=formLetter" method="post">';
			
			echo '<table style="border: #000 solid 2px;padding-left:40px;padding-right:40px;padding-top:10px;padding-bottom:10px;font-size:110%;" >
				<tr height="20">
						<td colspan="2">
						<b>'.$app_strings['LBL_SELECT_TEMPLATE'].':-</b>
						</td>
					</tr>';
			foreach ($templates as $templateid => $template ) {
					$js = "document.getElementById('popupDivBack_ara').style.display='none';document.getElementById('popupDiv_ara').style.display='none';var form=document.getElementById('popupForm');if(form!=null){form.templateID.value='".$templateid."';form.submit();}else{alert('Error!');}";
						echo '<tr height="20">
						<td width="17" valign="center"><a href="#" onclick="'.$js.'"><img src="themes/default/images/txt_image_inline.gif" width="16" height="16" /></a></td>
						<td scope="row" align="left"><b><a href="#" onclick="'.$js.'">'.$template.'</a></b></td></tr>';
			}
			
		echo '		<input type="hidden" name="templateID" value="" />
				<input type="hidden" name="module" value="'.$module.'" />
				<input type="hidden" name="uid" value="'.$_REQUEST['record'].'" />
				</form>
				<tr style="height:10px;"><tr><tr><td colspan="2"><button style=" display: block;margin-left: auto;margin-right: auto" onclick="document.getElementById(\'popupDivBack_ara\').style.display=\'none\';document.getElementById(\'popupDiv_ara\').style.display=\'none\';return false;">Cancel</button></td></tr>
				</table>
				</div>
				
				<div id="popupDivBack_ara" onclick="this.style.display=\'none\';document.getElementById(\'popupDiv_ara\').style.display=\'none\';" style="top:0px;left:0px;position:fixed;height:100%;width:100%;background:#000000;opacity:0.5;display:none;vertical-align:middle;text-align:center;z-index:9998;">
				</div>
				<script>
					function showPopup(){
						var ppd=document.getElementById(\'popupDivBack_ara\');
						var ppd2=document.getElementById(\'popupDiv_ara\');
						if(ppd!=null && ppd2!=null){
							ppd.style.display=\'block\';
							ppd2.style.display=\'block\';
						}else{
							alert(\'Error!\');
						}
					}
				</script>';
			}
		}
		else{
			echo '<script>
				function showPopup(){
				alert(\''.$app_strings['LBL_NO_TEMPLATE'].'\');		
				}
			</script>';
		}
	}
}

?>
