

$(document).ready(function(){
	if ( $('.pagination').length && $("#blocs_produits").length ){
		$(window).scroll(function(){
			url =  $('.pagination .next_page').attr('href');
			 if (url && $(window).scrollTop() > $(document).height() - $(window).height() - 50){
			 	$('.pagination').text('loading more product...');
            	$.getScript(url);
			 }
		});

		$(window).scroll();
	}
});