
$(function(){
	
	$('#gross_offer').on('change',function(){
		recalc();
	});	
	$('#delinquent_taxes').on('change',function(){
		recalc();
	});
	
	function recalc(){
		var gross = $('#gross_offer').val();
		gross = parseFloat(gross.replace(/,/g,""));
		
		var tax = $('#delinquent_taxes').val();
		tax = parseFloat(tax.replace(/,/g,""));

		if(tax == ''){
			tax = 0;
		}
		var net = gross - tax;
		$('#net_offer').val(net);
	}
});