
$(function(){
	
	$('#gross_offer_c').on('change',function(){
		recalc();
	});	
	$('#delinquent_taxes_c').on('change',function(){
		recalc();
	});
	
	function recalc(){
		var gross = $('#gross_offer_c').val();
		gross = parseFloat(gross.replace(/,/g,""));
		
		var tax = $('#delinquent_taxes_c').val();
		tax = parseFloat(tax.replace(/,/g,""));

		if(tax == ''){
			tax = 0;
		}
		var net = gross - tax;
		$('#net_offer_c').val(net);
	}
});