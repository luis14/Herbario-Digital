
    function cargarEspecies(){
        alert('WORKING');
        var xmlhttp = new XMLHttpRequest();
        xmlhttp.onreadystatechange = function() {
            if (this.readyState == 4 && this.status == 200) {
                myArr = JSON.parse(this.responseText);
                if (myArr.length > 0 ) {
                  arrNombres = [];
                  arrIDS = [];
                  arrCient = [];
                  for (var i = 0; i < myArr.length; i++) {
                    arrNombres.push(myArr[i].nombre);
                    arrIDS.push(myArr[i].id);
                    arrCient.push(myArr[i].cientifico);
                    }
                    addItem(arrNombres, arrIDS, arrCient);
                }
            }
        };
        xmlhttp.open("GET", "http://herbariodigital.xyz/AppMovil/php/getEspecies.php", true);
        xmlhttp.send();
    }

    function addItem(name, ID, cient){
        for (var i = 0; i < name.length; i++) {
            var ul = document.getElementById("list");
            var li = document.createElement("li");
            echo(name[i]);
            li.appendChild(document.createTextNode(name[i]));
            ul.appendChild(li);
        }

    }