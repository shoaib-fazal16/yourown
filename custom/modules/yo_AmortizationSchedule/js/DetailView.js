// var myCenter=new google.maps.LatLng(lat_long);
//36.175,-115.1363889
// lat = 36.175;
// lng = -115.1363889;
// lat = 38.8833;
// lng = -77.0167;

function calculateEndingBalance()
{
	var bbalance = parseFloat(removeQoma($('#bbalance').val()));
	var payment = parseFloat(removeQoma($('#payment').val()));
	var principal = parseFloat(removeQoma($('#principal').val()));
	var interest = parseFloat(removeQoma($('#interest').val()));
	var cprincipal = 0;
	principal = payment - interest;	
	cprincipal += principal;
	var ebalance = bbalance - principal;
	$('#principal').val(principal.toFixed(2));
	$('#cprincipal').val(cprincipal.toFixed(2));
	$('#ebalance').val(ebalance.toFixed(2));
}

function removeQoma(a){
	if(a){
		a=a.replace(/\,/g,'');
		a=parseInt(a,10);
	}
	return a;
}
	