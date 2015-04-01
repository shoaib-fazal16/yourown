function caclculate_data_expiry_coe(){
   var offerDateObject = document.getElementById('start_date');
   var offerDate = offerDateObject.value;
   var expiry = convertDate(offerDate,5);
   var coe = convertDate(offerDate,45);
   var followup = convertDate(offerDate,7);
   document.getElementById('expiration_date').value = expiry ;
   document.getElementById('coe_date').value = coe ;
   document.getElementById('renewal_reminder_date_date').value = followup ;
   document.getElementById('renewal_reminder_date_hours').selectedIndex = 12 ;
   document.getElementById('renewal_reminder_date_minutes').selectedIndex = 1 ;
   document.getElementById('renewal_reminder_date_meridiem').selectedIndex = 1 ;
   document.getElementById('renewal_reminder_date').value = followup + " 12:00am" ; 

}

function convertDate(date, days){
	var someDate = new Date(date);
	var numberOfDaysToAdd = days;
	someDate.setDate(someDate.getDate() + numberOfDaysToAdd);
	var dd = someDate.getDate();
	var mm = someDate.getMonth() + 1;
	var y = someDate.getFullYear();
	if(mm < 10){
	 	mm = '0'+ mm;
	}
	var someFormattedDate = mm + '/'+ dd + '/'+ y;
	return someFormattedDate ;
}