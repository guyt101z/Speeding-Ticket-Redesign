jQuery ->
	$('#purchase_user_email').autocomplete
    source: $('#purchase_user_email').data('autocomplete-source');
    
  $('#purchase_asset_ids').attr("data-placeholder", "Enter Tag Number...").chosen();