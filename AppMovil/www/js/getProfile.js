    
    function getProfile(){
        var xmlhttp = new XMLHttpRequest();
        xmlhttp.onreadystatechange = function() {
            if (this.readyState == 4 && this.status == 200) {
                myArr = JSON.parse(this.responseText);
                var comun = myArr[0].comun;
                var cientifico = myArr[0].cientifico;
                var url = myArr[0].url
                var fuste = myArr[0].fuste;
                var hoja = myArr[0].hoja;
                var semilla = myArr[0].semilla;
                var flor = myArr[0].flor;
                var fecha = myArr[0].fecha;
                var extra = myArr[0].extra; 
                var lugar = myArr[0].lugar;
                /*LoadPhotos();*/
                addItem(comun, cientifico, url, fuste, hoja, semilla, flor, fecha, extra, lugar);
            }
        };
        xmlhttp.open("GET", "http://herbariodigital.xyz/AppMovil/php/getProfile.php?id_muestra="+localStorage.MuestraID, true);
        xmlhttp.send();
    }




    function addItem(comun, cientifico, url, fuste, hoja, semilla, flor, fecha, extra, lugar){
        /* HEADER INI */

        var div_1 = $('<div></div>');
        div_1.attr('align','center');
        div_1.attr('class','colm');

        var a_1 = $('<a></a>');
        a_1.attr('align','center');

        var img_1 = $('<img/>');
        img_1.attr('align','center');
        img_1.css('margin','5px');
        img_1.css('position','relative');
        img_1.css('height','39px');
        img_1.css('width','40px');
        img_1.css('borderRadius','20px');
        img_1.css('top','5px');
        img_1.attr('src', url);

        div_1.append(a_1);
        a_1.append(img_1);


        var div_2 = $('<div></div>');
        div_2.attr('align','center');
        div_2.attr('class','column');

        var H4_2 = $('<H4></H4>');
        H4_2.attr('color','white');
        H4_2.css('position','relative');
        H4_2.css('top','13px');
        H4_2.css('color','white');
        H4_2.html(comun);

        var H6_2 = $('<H6></H6>');
        H6_2.attr('color','white');
        H6_2.css('position','relative');
        H6_2.css('top','17px');
        H6_2.css('color','white');
        H6_2.html(cientifico);

        div_2.append(H4_2);
        div_2.append(H6_2);



        var div_3 = $('<div></div>');
        div_3.attr('align','center');
        div_3.attr('class','colm');

        var a_3 = $('<a></a>');
        a_3.attr('align','center');
        a_3.attr('href', '../ventanaGira/ventanagira.html');


        var img_3 = $('<img/>');
        img_3.attr('align','center');
        img_3.css('margin','5px');
        img_3.css('position','relative');
        img_3.css('height','28px');
        img_3.css('width','28px');
        img_3.css('top','10px');
        img_3.attr('src', 'volver.png');

        div_3.append(a_3);
        a_3.append(img_3);


        $('#heads').append(div_1);
        $('#heads').append(div_2);
        $('#heads').append(div_3);

        /* HEADER END */


        /* FOTOS INI */

        /* FOTOS END */

        
        /* FECHA Y LUGAR INI */
        var divR_1 = $('<div></div>');
        divR_1.attr('align','center');
        divR_1.attr('class','column3');

        var H4R_1 = $('<H4></H4>');
        H4R_1.attr('color','white');
        H4R_1.css('position','relative');
        H4R_1.css('top','13px');
        H4R_1.css('color','white');
        H4R_1.html('Fecha');

        var H6R_1 = $('<H6></H6>');
        H6R_1.attr('color','white');
        H6R_1.css('position','relative');
        H6R_1.css('top','17px');
        H6R_1.css('color','white');
        H6R_1.html(fecha);


        var divR_2 = $('<div></div>');
        divR_2.attr('align','center');
        divR_2.attr('class','column3');

        var H4R_2 = $('<H4></H4>');
        H4R_2.attr('color','white');
        H4R_2.css('position','relative');
        H4R_2.css('top','13px');
        H4R_2.css('color','white');
        H4R_2.html('Lugar');

        var H6R_2 = $('<H6></H6>');
        H6R_2.attr('color','white');
        H6R_2.css('position','relative');
        H6R_2.css('top','17px');
        H6R_2.css('color','white');
        H6R_2.html(lugar);


        divR_1.append(H4R_1);
        divR_1.append(H6R_1);
        divR_2.append(H4R_2);
        divR_2.append(H6R_2);


        $('#recolectainfo').append(divR_1);
        $('#recolectainfo').append(divR_2);

        /* FECHA Y LUGAR END */

        /* PLANTA INFO INI */

        var p_fuste =  $('<p></p>');
        p_fuste.html(fuste);
        $('#content1').append(p_fuste);

        var p_hoja =  $('<p></p>');
        p_hoja.html(hoja);
        $('#content2').append(p_hoja);

        var p_fruto =  $('<p></p>');
        p_fruto.html(semilla);
        $('#content3').append(p_fruto);

        var p_flor =  $('<p></p>');
        p_flor.html(flor);
        $('#content4').append(p_flor);

        var p_extra =  $('<p></p>');
        p_extra.html(extra);
        $('#content5').append(p_extra);

        /* PLANTA INFO END */
        
    }

