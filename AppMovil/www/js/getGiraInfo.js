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
                    addItem(arrfecha, arrnombre, arrprofesor, arrlugar);
                  },
                  error: function(xhr) {
                    alert('Bad action at 404');
                  }
                });
              }

    function addItem(fecha, nombre, profesor, lugar){
            
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