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

//ini_set('display_errors', '1');

	require_once('modules/AOS_PDF_Templates/PDF_Lib/mpdf.php');
	require_once('modules/AOS_PDF_Templates/templateParser.php');
	require_once('modules/AOS_PDF_Templates/AOS_PDF_Templates.php');
	
	global $sugar_config;

    $module_type = $_REQUEST['module'];
	$module_type_create = rtrim($module_type,'s');
	$module_type_low = strtolower($module_type);
	
	$module = new $module_type_create();

    $recordIds = array();

    if(isset($_REQUEST['current_post']) && $_REQUEST['current_post'] != ''){
        $order_by = '';
        require_once('include/MassUpdate.php');
        $mass = new MassUpdate();
        $mass->generateSearchWhere($_REQUEST['module'], $_REQUEST['current_post']);
        $ret_array = create_export_query_relate_link_patch($_REQUEST['module'], $mass->searchFields, $mass->where_clauses);
        $query = $module->create_export_query($order_by, $ret_array['where'], $ret_array['join']);
        $result = $GLOBALS['db']->query($query,true);
        $uids = array();
        while($val = $GLOBALS['db']->fetchByAssoc($result,false))
        {
            array_push($recordIds, $val['id']);
        }
    }
    else{
        $recordIds = explode(',',$_REQUEST['uid']);
    }

	
	$template = new AOS_PDF_Templates();
	$template->retrieve($_REQUEST['templateID']);
	
	$pdf=new mPDF('en','A4','','DejaVuSansCondensed',$template->margin_left,$template->margin_right,$template->margin_top,$template->margin_bottom,$template->margin_header,$template->margin_footer);
	
	foreach ($recordIds as $recordId) {
		$module->retrieve($recordId);
		$pdf_history=new mPDF('en','A4','','DejaVuSansCondensed',$template->margin_left,$template->margin_right,$template->margin_top,$template->margin_bottom,$template->margin_header,$template->margin_footer);

		$object_arr = array();
		$object_arr[$module_type] = $module->id;
	
		if($module_type === 'Contacts')
		{
			$object_arr['Accounts'] = $module->account_id;
		}
	
		$search = array ('@<script[^>]*?>.*?</script>@si', 		// Strip out javascript
						'@<[\/\!]*?[^<>]*?>@si',		// Strip out HTML tags
						'@([\r\n])[\s]+@',			// Strip out white space
						'@&(quot|#34);@i',			// Replace HTML entities
						'@&(amp|#38);@i',
						'@&(lt|#60);@i',
						'@&(gt|#62);@i',
						'@&(nbsp|#160);@i',
						'@&(iexcl|#161);@i',
						'@<address[^>]*?>@si'
		);

		$replace = array ('',
						 '',
						 '\1',
						 '"',
						 '&',
						 '<',
						 '>',
						 ' ',
						 chr(161),
						 '<br>'
			);
	
		$text = preg_replace($search, $replace, $template->description);
		$text = preg_replace_callback('/\{DATE\s+(.*?)\}/', 
			function ($matches) { return date($matches[1]); },
			$text );
		$header = preg_replace($search, $replace, $template->pdfheader);
		$footer = preg_replace($search, $replace, $template->pdffooter);
	
		$converted = templateParser::parse_template($text, $object_arr);
		$header = templateParser::parse_template($header, $object_arr);
		$footer = templateParser::parse_template($footer, $object_arr);
	
		$printable = str_replace("\n","<br />",$converted);

		$file_name = str_replace(" ","_",$template->name).".pdf";
	
		ob_clean();
		try{
			$note = new Note();
			$note->modified_user_id = $current_user->id;
			$note->created_by = $current_user->id;
			$note->name = $file_name;
			$note->parent_type = $module_type;
			$note->parent_id = $module->id;
			$note->file_mime_type = 'application/pdf';
			$note->filename = $file_name;
			if($module_type == 'Contacts')
			{
				$note->contact_id = $module->id;
				$note->parent_type = 'Accounts';
				$note->parent_id = $module->account_id;
			}
			$note->save();
			////////////////////////////////////
			$GLOBALS['log']->fatal("Lead ID: ".$module->id);
			
			$propoerty_ids = implode('","', $_REQUEST['property_id']);
			$GLOBALS['log']->fatal($propoerty_ids);
			$query = 'SELECT c_c.name as county_name, aos_products.name as apn, aos_products.legal_description as legal_description, aos_products.situs_state as state
			FROM yo_county as c_c
			LEFT JOIN yo_county_aos_products_c
			ON c_c.id = yo_county_aos_products_c.yo_county_aos_productsyo_county_ida
			LEFT JOIN aos_products
			ON yo_county_aos_products_c.yo_county_aos_productsaos_products_idb = aos_products.id
			WHERE yo_county_aos_productsaos_products_idb IN ("'.$propoerty_ids.'")';
			$GLOBALS['log']->fatal($query);
			$result = $GLOBALS['db']->query($query);
			while($county_name_array = $GLOBALS['db']->fetchByAssoc($result)){
				$county_name['county_name'][] = $county_name_array['county_name'];
				$county_name['apn'][] = $county_name_array['apn'];
				$county_name['state'][] = $county_name_array['state'];
				$county_name['legal_description'][] = $county_name_array['legal_description'];
			}
			/* $county_name = $GLOBALS['db']->fetchByAssoc($result);	 */	
			//$GLOBALS['log']->fatal(print_r($county_name , true));
			$printable =  str_replace("leads_aos_products_1_name_yo_county_aos_products_name",implode(', ',$county_name['county_name']), $printable );
			$printable =  str_replace("leads_aos_products_1_name_name",implode(', ',$county_name['apn']), $printable );
			$printable =  str_replace("leads_aos_products_1_name_legal_description",implode(', ',$county_name['legal_description']), $printable );
			$printable =  str_replace("leads_aos_products_1_name_situs_state",implode(', ',$county_name['state']), $printable );	
			////////////////////////////////////////////////
			
			$fp = fopen($sugar_config['upload_dir'].'nfile.pdf','wb');
			fclose($fp);
		
			$pdf_history->setAutoFont();
			$pdf_history->SetHTMLHeader($header);
			$pdf_history->SetHTMLFooter($footer);
			$pdf_history->writeHTML($printable);
			$pdf_history->Output($sugar_config['upload_dir'].'nfile.pdf','F');
		
			$pdf->AddPage();
			$pdf->setAutoFont();
			$pdf->SetHTMLHeader($header);
			$pdf->SetHTMLFooter($footer);
			$pdf->writeHTML($printable);
		
			rename($sugar_config['upload_dir'].'nfile.pdf',$sugar_config['upload_dir'].$note->id);
		
		}catch(mPDF_exception $e){ 
			echo $e;
		}
	}
	
	$pdf->Output($file_name, "D");
?>
