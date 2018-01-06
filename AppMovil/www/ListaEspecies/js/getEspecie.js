
    function cargarEspecies(){
        var xmlhttp = new XMLHttpRequest();
        xmlhttp.onreadystatechange = function() {
            if (this.readyState == 4 && this.status == 200) {
                myArr = JSON.parse(this.responseText);
                if (myArr.length > 0 ) {
                  arrNombres = [];
                  arrIDS = [];
                  arrCient = [];
                  arrImg = [];
                  for (var i = 0; i < myArr.length; i++) {
                    arrNombres.push(myArr[i].nombre);
                    arrIDS.push(myArr[i].id);
                    arrCient.push(myArr[i].cientifico);
                    arrImg.push(myArr[i].imagen);
                    }
                    addItem(arrNombres, arrIDS, arrCient, arrImg);
                }
            }
        };
        xmlhttp.open("GET", "http://herbariodigital.xyz/AppMovil/php/getEspecies.php", true);
        xmlhttp.send();
    }

    function addItem(name, id, cient, imge){
        for (var i = 0; i < name.length; i++) {
            var named = name[i];
            var science = cient[i];
            var ident = id[i];
            var imagen = imge[i];

            //$('#lista').append($('<li>').text(named));
            var span = $("<span></span>");
            span.html(science);
            span.css("font-style","italic");
            
            var img = $("<img/>");
            img.attr("src",imagen);

            var a = $("<a></a>");
            a.addClass("widget-list-link");
            a.attr("href","../upload/samples/index.html");
            a.html(named);

            var li = $("<li></li>");
            li.attr("id", ident);

            $('#lista').append(li);
            li.append(a);
            a.append(img);
            a.append(span);

        }
    }

    $(document).on('click','li',function(){
        x = $(this).attr('id');
        localStorage.plantaNueva = x;
    
    });



