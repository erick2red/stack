(function($){
	$('form').submit(function(){
		if(!$(this).find('input[name="name"]').val().length){
			$.noty({ text: 'no username' })
			return false;
		}
		var user = {
			'name': $.trim($(this).find('input[name="name"]').val()),
			'password': $.trim($(this).find('input[name="password"]').val())
		}
		$.ajax({
			dataType: 'json',
			contentType: 'application/json',
			type: 'POST',
			data: JSON.stringify(user),
			success: function(data){
				if(data.answer == 0){
					window.location = window.location.toString().replace(/login$/, 'files');
				}else{
					$.noty({ type: (data.answer > 0) ? 'warning' : 'alert', text: data.message });
				}
			}
		});
		return false;
	});
	$('form [name="name"]').on('keypress', function(ev){ if(ev.keyCode== 32) return false; return true; });
})(jQuery);
