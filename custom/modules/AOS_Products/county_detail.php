<?php

global $timedate;
require_once('modules/yo_County/yo_County.php');
require_once('modules/AOS_Products/AOS_Products.php');
ob_clean();
$county = new yo_County();
$county->retrieve($_REQUEST['record']);
$html = '<div id="cnty_County_detailview_tabs">
<a href="javascript:void(0)" onclick="close_county_detail()"><span style="float:right;margin: 5px;padding: 5px;border: 1px solid black;" title="close">X</span></a>
<div>
<div id="detailpanel_1" class="detail detail508 expanded">
<table id="DEFAULT" class="panelContainer" cellspacing="0" width="80%">
<tbody><tr>
<td width="6%" scope="col">
State:
</td>
<td width="6%">
<input type="hidden" class="sugar_field" id="state_c" value="Arizona">
'.$county->state.'
</td>
<td width="12.5%" scope="col">
Name:
</td>
<td width="37.5%">
<span class="sugar_field" id="name">'.$county->name.'</span>
</td>
</tr>
</tbody></table>
</div>
<div id="detailpanel_2" class="detail508 detail  expanded">
<h4>
Treasurer
</h4>
<table id="LBL_EDITVIEW_PANEL1" class="panelContainer" cellspacing="0" width="80%">
<tbody><tr>
<td width="6%" scope="col">
Treasurer Website:
</td>
<td width="6%" colspan="3">
<span class="sugar_field" id="treasurer_website_c">
<a href="'.$county->treasurer_website.'" target="_blank">'.$county->treasurer_website.'</a>
</span>
</td>
</tr>
<tr>
<td width="12.5%" scope="col">
Treasurer\'s address:
</td>
<td width="37.5%">
<span class="sugar_field" id="treasurer_address_c">'.$county->treasurer_address.'</span>
</td>
<td width="12.5%" scope="col">
Treasurer\'s address City:
</td>
<td width="37.5%">
<span class="sugar_field" id="treasurer_address_city_c">'.$county->treasurer_address_city.'</span>
</td>
</tr>
<tr>
<td width="12.5%" scope="col">
Treasurer\'s address State:
</td>
<td width="37.5%">
<span class="sugar_field" id="treasurer_address_state_c">'.$county->treasurer_address_state.'</span>
</td>
<td width="12.5%" scope="col">
Treasurer\'s address PostalCode:
</td>
<td width="37.5%">
<span class="sugar_field" id="treasurer_address_postalcode_c">'.$county->treasurer_address_postalcode.' </span>
</td>
</tr>
<tr>
<td width="12.5%" scope="col">
Treasurer Phone:
</td>
<td width="37.5%" class="phone">
'.$county->treasurer_phone.'
</td>
<td width="12.5%" scope="col">
Treasurer hours:
</td>
<td width="37.5%">
<span class="sugar_field" id="treasurer_hours_c">'.$county->treasurer_hours.'</span>
</td>
</tr>
</tbody></table>
</div>
<div id="detailpanel_3" class="detail  detail508   expanded">
<h4>

Recorder\'s Office
</h4>
<table id="LBL_EDITVIEW_PANEL3" class="panelContainer" cellspacing="0" width="80%">
<tbody><tr>
<td width="6%" scope="col">
Recorders Office URL:
</td>
<td width="6%" colspan="3">
<span class="sugar_field" id="recorders_url_c">
<a href="'.$county->recorders_url.'" target="_blank">'.$county->recorders_url.'</a>
</span>
</td>
</tr>
<tr>
<td width="12.5%" scope="col">
Recorders Address:
</td>
<td width="37.5%">
<span class="sugar_field" id="recorders_address_c">'.$county->recorders_address.'</span>
</td>
<td width="12.5%" scope="col">
Recorders Address City:
</td>
<td width="37.5%">
<span class="sugar_field" id="recorders_address_city_c">'.$county->recorders_address_city.'</span>
</td>
</tr>
<tr>
<td width="12.5%" scope="col">
Recorders Address State:
</td>
<td width="37.5%">
<span class="sugar_field" id="recorders_address_state_c">'.$county->recorders_address_state.'</span>
</td>
<td width="12.5%" scope="col">
Recorders Address PostalCode:
</td>
<td width="37.5%">
<span class="sugar_field" id="recorders_address_postalcode_c">'.$county->recorders_address_postalcode.'</span>
</td>
</tr>
<tr>
<td width="12.5%" scope="col">
Recorders office phone:
</td>
<td width="37.5%" class="phone">
'.$county->recorders_phone.'
</td>
<td width="12.5%" scope="col">
Recorders office hours:
</td>
<td width="37.5%">
<span class="sugar_field" id="recorders_hours_c">'.$county->recorders_hours.'</span>
</td>
</tr>
</tbody></table>
</div>
<div id="detailpanel_4" class="detail  detail508   expanded">
<h4>
Assessor\'s Office
</h4>
<table id="LBL_EDITVIEW_PANEL2" class="panelContainer" cellspacing="0" width="100%">
<tbody><tr>
<td width="6%" scope="col">
Assessors Office URL:
</td>
<td width="6%" colspan="3">
<span class="sugar_field" id="assessors_office_url_c">
<a href="'.$county->assessors_office_url.'" target="_blank">'.$county->assessors_office_url.'</a>
</span>
</td>
</tr>
<tr>
<td width="12.5%" scope="col">
Assessors office address:
</td>
<td width="37.5%">
<span class="sugar_field" id="assessors_address_c">'.$county->assessors_address.'</span>
</td>
<td width="12.5%" scope="col">
Assessors office address City:
</td>
<td width="37.5%">
<span class="sugar_field" id="assessors_address_city_c">'.$county->assessors_address_city.'</span>
</td>
</tr>
<tr>
<td width="12.5%" scope="col">
Assessors office address State:
</td>
<td width="37.5%">
<span class="sugar_field" id="assessors_address_state_c">'.$county->assessors_address_state.'</span>
</td>
<td width="12.5%" scope="col">
Assessors office address PostalCode:
</td>
<td width="37.5%">
<span class="sugar_field" id="assessors_address_postalcode_c">'.$county->assessors_address_postalcode.'</span>
</td>
</tr>
<tr>
<td width="12.5%" scope="col">
Assessors office phone:
</td>
<td width="37.5%" class="phone">
'.$county->assessors_office_phone.'
</td>
<td width="12.5%" scope="col">
Assessors office hours:
</td>
<td width="37.5%">
<span class="sugar_field" id="assessors_hours_c">'.$county->assessors_hours.'</span>
</td>
</tr>
</tbody></table>
</div>
<div id="detailpanel_5" class="detail  detail508   expanded">
<h4>
GIS Map
</h4>
<table id="LBL_EDITVIEW_PANEL4" class="panelContainer" cellspacing="0" width="80%">
<tbody><tr>
<td width="6%" scope="col">
GISMap:
</td>
<td width="37%">
<input type="hidden" class="sugar_field" id="gismap_c" value="'.$county->gismap.'">
<iframe src="'.$county->gismap.'" title="'.$county->gismap.'" height="200" width="100%"></iframe>
</td>
<td width="12.5%" scope="col">
GIS Department Phone:
</td>
<td width="37.5%" class="phone">
'.$county->gis_phone.'
</td>
</tr>
</tbody></table>
</div>
<div id="detailpanel_6" class="detail  detail508   expanded">
<h4>
New Panel 5
</h4>
<table id="LBL_EDITVIEW_PANEL5" class="panelContainer" cellspacing="0" width="80%">
<tbody><tr>
<td width="6%" scope="col">
Community Development URL:
</td>
<td width="6%">
<span class="sugar_field" id="community_development_url_c">
<a href="'.$county->community_development_url.'" target="_blank">'.$county->community_development_url.'/</a>
</span>
</td>
<td width="6%" scope="col">
Community development phone:
</td>
<td width="37.5%" class="phone">
'.$county->community_development_phone.'
</td>
</tr>
</tbody></table>
</div>
</div>
</div>';
echo $html;
die();
?>