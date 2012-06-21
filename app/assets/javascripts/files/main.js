(function($){
	$('a[href="../logout"]').on('click', function(){
		$.ajax({
			url: $(this).prop('href'),
			type: 'DELETE',
			contentType: 'application/json',
			dataType: 'json',
			success: function(data){
				if(data.answer === 0) window.location.reload();
			}
		});
		return false;
	});
})(jQuery);
