
    function cargarEspecies(){
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
            var named = name[i];
            var science = cient[i];

            //$('#lista').append($('<li>').text(named));
            var span = $("<span></span>");
            span.html(science);
            span.css("font-style","italic");
            
            var img = $("<img/>");
            img.attr("src","flor.png");

            var a = $("<a></a>");
            a.addClass("widget-list-link");
            a.attr("href","../upload/samples/index.html");
            a.html(named);

            var li = $("<li></li>");

            $('#lista').append(li);
            li.append(a);
            a.append(img);
            a.append(span);

        }
    }

