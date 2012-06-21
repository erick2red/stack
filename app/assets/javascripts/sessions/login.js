(function($){
	$('form').submit(function(){
		if($(this).find('input[type=submit]').hasClass('disabled'))
			return false;
		$.ajax({
			dataType: 'json',
			type: 'POST',
			data: $(this).serialize(),
			success: function(data){
				window.location = '/files'
			},
			error: function(jqxhr, textStatus, error){
				$.noty({ text: $.parseJSON(jqxhr.responseText)['message']});
			}
		});
		return false;
	});
	$('form [name="name"]').on('keyup', function(ev){ $('form input[type=submit]').toggleClass('disabled', $(this).val().length == 0);
	}).on('keypress', function(ev){ if(ev.keyCode== 32) return false; return true; });
})(jQuery);
