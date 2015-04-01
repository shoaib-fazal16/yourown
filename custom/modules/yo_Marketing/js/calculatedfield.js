$(document).ready($('#available_for_sale').on('change', function(){
	console.log('sdsdsdsdsds');
	caclculate_dom();
}));
function caclculate_dom(){
   var availForSaleObject = document.getElementById('available_for_sale');
   var availForSale = new Date(availForSaleObject.value);
   var todaysDate = new Date();
   var differenceOfDates = dateDiffInDays(availForSale, todaysDate) ;
   document.getElementById('date_of_month').value = differenceOfDates  ; 
   
}

var _MS_PER_DAY = 1000 * 60 * 60 * 24;

// a and b are javascript Date objects
function dateDiffInDays(a, b) {
  // Discard the time and time-zone information.
  var utc1 = Date.UTC(a.getFullYear(), a.getMonth(), a.getDate());
  var utc2 = Date.UTC(b.getFullYear(), b.getMonth(), b.getDate());

  return Math.floor((utc2 - utc1) / _MS_PER_DAY);
}

function convertDate(date, todaysDate){
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