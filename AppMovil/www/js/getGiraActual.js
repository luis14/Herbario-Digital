function getGiraActual(){
        var xmlhttp = new XMLHttpRequest();
        xmlhttp.onreadystatechange = function() {
            if (this.readyState == 4 && this.status == 200) {
                alert(this.responseText);
                
            }
        };
        xmlhttp.open("GET", "http://herbariodigital.xyz/AppMovil/php/getGiraActual.php", true);
        xmlhttp.send();
    }