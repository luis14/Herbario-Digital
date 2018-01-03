$('.click').click(function() {
	if ($('span').hasClass("fa-star")) {
			$('.click').removeClass('active')
		setTimeout(function() {
			$('.click').removeClass('active-2')
		}, 30)
			$('.click').removeClass('active-3')
		setTimeout(function() {
			$('span').removeClass('fa-star')
			$('span').addClass('fa-star-o')
		}, 15)
	} else {
		$('.click').addClass('active')
		$('.click').addClass('active-2')
		setTimeout(function() {
			$('span').addClass('fa-star')
			$('span').removeClass('fa-star-o')
		}, 150)
		setTimeout(function() {
			$('.click').addClass('active-3')
		}, 150)
		$('.info').addClass('info-tog')
		setTimeout(function(){
			$('.info').removeClass('info-tog')
		},1000)
	}
})

	function getCredenciales(){
        var xmlhttp = new XMLHttpRequest();
        xmlhttp.onreadystatechange = function() {
            if (this.readyState == 4 && this.status == 200) {
                myArr = JSON.parse(this.responseText);
                if (myArr.length > 0 ) {
                  arrCredencial = [];
                  arrCredencial.push(myArr[0].username)
                  arrCredencial.push(myArr[0].resultado)
                  addItem(arrCredencial);
                }
            }
        };
        xmlhttp.open("GET", "http://herbariodigital.xyz/AppMovil/php/getCredenciales.php", true);
        xmlhttp.send();
    }

    function addItem(credencial){
         
        var named = credencial[0];
        $("#username").html(named);
            
    }

