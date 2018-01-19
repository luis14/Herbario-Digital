
function getEspeciePorRegistrar(){
                $.ajax({
                  url: "http://www.herbariodigital.xyz/AppMovil/php/getEspeciePorRegistrar.php?id="+ localStorage.plantaNueva,
                  type: "get", //send it through get method

                  success: function(textresponse) {
                    myArr = JSON.parse(textresponse);
                    arrName = myArr[0].comun;
                    arrScience = myArr[0].cientifico;
                    arrURL = myArr[0].url;
                    addItem(arrName, arrScience, arrURL);
                  },
                  error: function(xhr) {
                    alert('Bad action at 404');
                  }
                });
              }


function addItem(comun, cientifico, url){
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
        H4_2.css('top','3px');
        H4_2.css('color','white');
        H4_2.css('font-size','14px');
        H4_2.html(comun);
        $("#comun").attr("value",comun);

        var H6_2 = $('<H6></H6>');
        H6_2.attr('color','white');
        H6_2.css('position','relative');
        H6_2.css('bottom','2px');
        H6_2.css('color','white');
        H6_2.css('font-size','9px');
        H6_2.html(cientifico);
        $("#cientifico").attr("value",cientifico);

        div_2.append(H4_2);
        div_2.append(H6_2);


        var div_3 = $('<div></div>');
        div_3.attr('align','center');
        div_3.attr('class','colm');

        var a_3 = $('<a></a>');
        a_3.attr('align','center');
        a_3.attr('href', '../../ListaEspecies/ListaEspecies.html');


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


        var planta = localStorage.plantaNueva
        $("#planta").attr("value",planta);
        var persona = localStorage.id
        $("#persona").attr("value",persona);
        var gira = localStorage.GiraElecta
        $("#gira").attr("value",gira);
        /* HEADER END */
    }


    $(function(){
        $("#uploadItem").on('submit',(function(e) {
        e.preventDefault();
        $.ajax({
        url: "http://herbariodigital.xyz/AppMovil/php/insertBitacora.php", // Url to which the request is send
        type: "POST",             // Type of request to be send, called as method
        data: new FormData(this), // Data sent to server, a set of key/value pairs (i.e. form fields and values)
        contentType: false,       // The content type used when sending data to the server.
        cache: false,             // To unable request pages to be cached
        processData:false,        // To send DOMDocument or non processed data file it is set to false
        success: function(data)   // A function to be called if request succeeds
            {
                //var jsonAns = JSON.parse(data);
                alert('Datos insertados exitosamente');
                location.href='../../registro/registro.html';
                
            }
        });

    }));

 })

    







