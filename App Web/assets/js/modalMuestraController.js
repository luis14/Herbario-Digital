$(".col-lg-4.col-md-4.col-sm-6.col-xs-6.item").on("click",function (e) {
$('#panzoom1').removeAttr("style");

    var idMuestra = $(this).attr("id");
    var xmlhttp = new XMLHttpRequest();

    xmlhttp.onreadystatechange = function() {

        if (this.readyState == 4 && this.status == 200) {

            muestra = JSON.parse(this.responseText);
            if (muestra) {
                //ejecutivo	fecha	fuente	nombreCientifico	imagenURL	nombreColector	nombreIdentificador
                $('#tituloModal').html("#"+muestra.ejecutivo);
                $('#panzoom1').attr("src",muestra.imagenURL);
                $('#colector').html(muestra.nombreColector);
                $('#identificador').html(muestra.nombreIdentificador);
                $('#fuente').html(muestra.fuente);
                $('#fecha').html(muestra.fecha);
            }

        }
    };

    xmlhttp.open("GET", "http://herbariodigital.xyz/AppWeb/assets/php/getDetalleMuestra.php?muestraID="+idMuestra, true);
    xmlhttp.send();

});
