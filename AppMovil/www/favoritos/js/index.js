
$('span').click(function() {
	var id = $(this).attr('id');
	var Fid = $(this).parent().attr('id');
	ids = $('#' + id);
	Fids = $('#' + Fid);
	
	if ($(ids).hasClass("fa-star")) {
			$(Fids).removeClass('active')
		setTimeout(function() {
			$(Fids).removeClass('active-2')
		}, 30)
			$(Fids).removeClass('active-3')
		setTimeout(function() {
			$(ids).removeClass('fa-star')
			$(ids).addClass('fa-star-o')
		}, 15)
	} else {
		$(Fids).addClass('active')
		$(Fids).addClass('active-2')
		setTimeout(function() {
			$(ids).addClass('fa-star')
			$(ids).removeClass('fa-star-o')
		}, 150)
		setTimeout(function() {
			$(Fids).addClass('active-3')
		}, 150)
		$('.info').addClass('info-tog')
		setTimeout(function(){
			$('.info').removeClass('info-tog')
		},1000)
	}
})








