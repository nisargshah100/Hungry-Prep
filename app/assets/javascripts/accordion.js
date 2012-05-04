$(document).ready(function() {
	
	$('.materials .material').hide();
	
	$('.materials h2').click(function() {
		$('.materials .material').slideUp('fast');
		$(this).siblings('.material').slideDown('fast');
	});
	
});