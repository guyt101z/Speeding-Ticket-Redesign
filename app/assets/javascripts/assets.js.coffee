jQuery ->
	$('#asset_user_email').autocomplete
    source: $('#asset_user_email').data('autocomplete-source');