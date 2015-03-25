// var myCenter=new google.maps.LatLng(lat_long);
//36.175,-115.1363889
// lat = 36.175;
// lng = -115.1363889;
// lat = 38.8833;
// lng = -77.0167;

function initialize()
{
	lat = $('#location_latitude').text();
	lng = $('#loction_longitude').text();
	var myCenter = new google.maps.LatLng(lat,lng);
	var mapProp = {
	  center:myCenter,
	  zoom:5,
	  mapTypeId:google.maps.MapTypeId.ROADMAP
	};

	var map=new google.maps.Map(document.getElementById("googleMap"),mapProp);

	var marker=new google.maps.Marker({
	  position:myCenter,
	});

	marker.setMap(map);
}
$(document).ready(function(){
	lat = $('#location_latitude').text();
	lng = $('#loction_longitude').text();
	// google.maps.event.addDomListener(window, 'load', initialize);
	if(lat !='' && lng !=''){
	google.maps.event.addDomListener(window, 'load', initialize);
	}else{
		$('#googleMap').text('Please Provide Latitude and Longitude to view Map!');
	}
});
	