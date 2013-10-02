jQuery ->
	$('#ticket_user_email').autocomplete
    source: $('#ticket_user_email').data('autocomplete-source');
    
  $('#ticket_asset_ids').attr("data-placeholder", "Enter Tag Number...").chosen();
  
  if $('.pagination').length
    $(window).scroll ->
      url = $('.pagination .next_page').attr('href')
      if url && $(window).scrollTop() > $(document).height() - $(window).height() - 200
        $('.pagination').text("loading more tickets...")
        $.getScript(url)
    $(window).scroll()