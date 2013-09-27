jQuery ->
	$('#ticket_user_email').autocomplete
    source: $('#ticket_user_email').data('autocomplete-source')
    
  $('#ticket_asset_ids').chosen()