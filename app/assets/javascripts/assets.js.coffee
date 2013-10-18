jQuery ->
	$('#asset_user_email').autocomplete
    source: $('#asset_user_email').data('autocomplete-source');
    
  $("#network-switch").click ->
  	$("#network-device").fadeToggle();
    	
  $('#asset_software_ids').attr("data-placeholder", "Enter Software Title...").chosen();