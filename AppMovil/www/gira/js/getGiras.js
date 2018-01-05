
    function getGiras(){

                $.ajax({
                  url: "http://www.herbariodigital.xyz/AppMovil/php/getGiras.php?id="+localStorage.id,
                  type: "get", //send it through get method

                  success: function(textresponse) {
                    myArr = JSON.parse(textresponse);
                    if (myArr.length > 0) {
                      arrID = [];
                      arrFecha = [];
                      arrLugar = [];
                      arrNombre = [];
                      for (var i = 0; i < myArr.length; i++) {
                        arrID.push(myArr[i].id);
                        arrFecha.push(myArr[i].Fecha);
                        arrLugar.push(myArr[i].Lugar);
                        arrNombre.push(myArr[i].Nombre)
                    }
                    addItem(arrID, arrFecha, arrLugar, arrNombre);
                  }
                },
                  error: function(xhr) {
                    alert('Bad action at 404');
                  }
                });
              }

    function addItem(id, Fecha, Lugar, Nombre){
        for (var i = 0; i < id.length; i++) {
            var date = Fecha[i];
            var place = Lugar[i];
            var name = Nombre[i];
            var ids = id[i]

            //$('#lista').append($('<li>').text(named));
            var span = $("<span></span>");
            span.html(place + ' · ' + date);
            span.css("font-style","italic");
            
            var img = $("<img/>");
            img.attr("src","location.png");

            var a = $("<a></a>");
            a.addClass("widget-list-link");
            a.attr("href","../ventanaGira/ventanagira.html");
            a.html(name);

            var li = $("<li></li>");
            li.attr("id", ids);

            $('#lista').append(li);
            li.append(a);
            a.append(img);
            a.append(span);

        }
    }

    $(document).on('click','li',function(){
        x = $(this).attr('id');
        localStorage.GiraElecta = x;
    });

