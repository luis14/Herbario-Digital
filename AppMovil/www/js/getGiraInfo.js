    function getGiraInfo(){
                $.ajax({
                  url: "http://www.herbariodigital.xyz/AppMovil/php/getGiraInfo.php?id="+localStorage.GiraElecta,
                  type: "get", //send it through get method

                  success: function(textresponse) {
                    myArr = JSON.parse(textresponse);
                    arrfecha = myArr[0].fecha;
                    arrnombre = myArr[0].nombre;
                    arrprofesor = myArr[0].profesor;
                    arrlugar = myArr[0].lugar;
                    addInfo(arrfecha, arrnombre, arrprofesor, arrlugar);
                  },
                  error: function(xhr) {
                    alert('Bad action at 404');
                  }
                });
              }

    function addInfo(fecha, nombre, profesor, lugar){
            
            var img = $('<img></img>');
            img.css('position', 'absolute');
            img.css('height', '20px');
            img.css('width', '20px');
            img.css('right', '10px');
            img.attr('src', 'volver.png');

            var a = $('<a></a>');
            a.attr('href','../gira/gira.html');

            var h3 = $('<h3></h3>');
            h3.attr('align', 'center');
            h3.css("font-family","Gill Sans, sans-serif");
            h3.html(nombre);

            $('#encabezado').append(h3);
            h3.append(a);
            a.append(img);


            var h5_1 = $("<h5></h5>");
            h5_1.attr('align','center');
            h5_1.css('font-family','Gill Sans, sans-serif');
            h5_1.css('background-color', '#41A4A4');
            h5_1.css('color','white');
            h5_1.html('Profesor: ' + profesor);

            var h5_2 = $("<h5></h5>");
            h5_2.attr('align','center');
            h5_2.css('font-family','Gill Sans, sans-serif');
            h5_2.css('background-color', '#2B6D6D');
            h5_2.css('color','white');
            h5_2.html('Lugar: ' + lugar);

            var h5_3 = $("<h5></h5>");
            h5_3.attr('align','center');
            h5_3.css('font-family','Gill Sans, sans-serif');
            h5_3.css('background-color', '#41A4A4');
            h5_3.css('color','white');
            h5_3.html('Fecha: ' + fecha);

            $('#infoGira').append(h5_1);
            $('#infoGira').append(h5_2);
            $('#infoGira').append(h5_3);
    }


    function getGiraEspecies(){
                $.ajax({
                  url: "http://www.herbariodigital.xyz/AppMovil/php/getGiraEspecie.php?id_persona="+localStorage.id+"&id_gira="+localStorage.GiraElecta,
                  type: "get", //send it through get method

                  success: function(textresponse) {
                    myArr = JSON.parse(textresponse);
                    if (myArr.length > 0) {
                      arrID = [];
                      arrFecha = [];
                      arrComun = [];
                      arrCientifico = [];
                      arrUrl = [];
                      for (var i = 0; i < myArr.length; i++) {
                        arrID.push(myArr[i].id);
                        arrFecha.push(myArr[i].fecha);
                        arrComun.push(myArr[i].comun);
                        arrCientifico.push(myArr[i].cientifico)
                        arrUrl.push(myArr[i].url)
                    }
                    addEspecie(arrID, arrFecha, arrComun, arrCientifico, arrUrl);
                  }
                },
                  error: function(xhr) {
                    alert('Bad action at 404');
                  }
                });
              }




    function addEspecie(id, fecha, comun, cientifico, url){
    var position = 123;
    for (var i = 0; i < comun.length; i++) {
            var cientificop = cientifico[i];
            var comunp = comun[i];
            var url = url[i];
            var fechap = fecha[i];
            var ids = id[i];

            //$('#lista').append($('<li>').text(named));
            var span = $("<span></span>");
            span.html(cientificop +' · '+ fechap);
            span.css("font-style","italic");
            
            var img = $("<img/>");
            img.attr("src", url);

            var a = $("<a></a>");
            a.addClass("widget-list-link");
            a.attr("href","../perfilGira/perfil.html");
            a.html(comunp);

            var span2 = $("<span></span>");
            span2.attr('class',"fa fa-star-o");

            var div = $("<div></div>");
            div.attr('class', 'click');
            div.css('position','absolute');
            div.css('right','20px');
            div.css('top', position);
            div.css('z-index','1');
            div.css('font-size', '25px');

            var li = $("<li></li>");
            li.attr("id", ids);

            $('#lista').append(li);
            li.append(a);
            a.append(img);
            a.append(span);
            li.append(div);
            div.append(span2);

            position += 57;
        }        
    }

    $(document).on('click','li',function(){
        x = $(this).attr('id');
        localStorage.MuestraID = x;
    });





