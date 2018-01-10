    function getFavoritos(){
        var xmlhttp = new XMLHttpRequest();
        xmlhttp.onreadystatechange = function() {
            if (this.readyState == 4 && this.status == 200) {
                myArr = JSON.parse(this.responseText);
                if (myArr.length > 0 ) {
                    arrBitacora = [];
                    arrFecha = [];
                    arrComun = [];
                    arrCientifico = [];
                    arrGira = [];
                    arrURL = [];
                    for (var i = 0; i < myArr.length; i++) {
                        arrBitacora.push(myArr[i].Bitacora);
                        arrFecha.push(myArr[i].Fecha);
                        arrComun.push(myArr[i].Comun);
                        arrCientifico.push(myArr[i].Cientifico);
                        arrGira.push(myArr[i].Gira);
                        arrURL.push(myArr[i].URL);
                    }
                    addItem(arrBitacora,arrFecha,arrComun,arrCientifico,arrGira, arrURL);
                }
            }
        };
        xmlhttp.open("GET", "http://www.herbariodigital.xyz/AppMovil/php/getFavoritos.php?id="+localStorage.id, true);
        xmlhttp.send();
    }



    function setEstadoFavorito(id_m, num){
        var xmlhttp = new XMLHttpRequest();
        xmlhttp.onreadystatechange = function() {
            if (this.readyState == 4 && this.status == 200) {
                getFavoritos();
            }
        };
        xmlhttp.open("GET", "http://www.herbariodigital.xyz/AppMovil/php/setEstadoFavorito.php?id="+id_m+'&num='+num, true);
        xmlhttp.send();
    }



    function addItem(bitacora, fecha, comun, cientifico, gira, url){
        var position = 70;
        for (var i = 0; i < bitacora.length; i++) {
            var named = comun[i];
            var science = cientifico[i];
            var ident = bitacora[i];
            var imagen = url[i];
            var date = fecha[i];
            var nameg = gira[i]

           //$('#lista').append($('<li>').text(named));

            var spans = $("<span></span>");
            spans.html(nameg +' · '+ date);
            spans.css("font-style","italic");

            var span = $("<span></span>");
            span.html(science);
            span.css("font-style","italic");
            
            var img = $("<img/>");
            img.attr("src", imagen);
            img.css('height','50px');
            img.css('width','50px');

            var a = $("<a></a>");
            a.addClass("widget-list-link");
            a.attr("href","../perfilFav/perfil.html");
            a.html(named);

            var span2 = $("<span></span>");
            span2.attr('class',"fa fa-star-o");
            span2.attr('id', 's'+ident);

            var div = $("<div></div>");
            div.attr('class', 'click');
            div.attr('id','ss'+ident);
            div.css('position','absolute');
            div.css('right','20px');
            div.css('top', position);
            div.css('z-index','1');
            div.css('font-size', '25px');

            var li = $("<li></li>");
            li.attr("id", ident);

            $('#lista').append(li);
            li.append(a);
            a.append(img);
            a.append(span);
            a.append(spans);
            li.append(div);
            div.append(span2);

            ids = $('#s' + ident);
            Fids = $('#ss' + ident);
            TurnOn(ids, Fids);

            position += 75;

        }
    }

    function TurnOn(ids, Fids){
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

    $(document).on('click','li',function(){
        x = $(this).attr('id');
        localStorage.MuestraID = x;
    });

    $(document).on('click','span',function(){
        var li = $(this).closest('li').attr('id');
        var id = $(this).attr('id');
        var Fid = $(this).parent().attr('id');
        ids = $('#' + id);
        Fids = $('#' + Fid);

        $(Fids).removeClass('active')
        setTimeout(function() {
        $(Fids).removeClass('active-2')
        }, 30)
        $(Fids).removeClass('active-3')
        setTimeout(function() {
        $(ids).removeClass('fa-star')
        $(ids).addClass('fa-star-o')
        }, 15)
        setEstadoFavorito(li, 0);
        location.reload();
    
});

