$(document).ready(function() {
	
	$('.materials h2').click(function() {
		$('.materials .material').removeClass('visible');
		$(this).siblings('.material').addClass('visible');
		
	});
	
});