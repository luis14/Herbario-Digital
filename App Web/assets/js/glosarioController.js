function loadGlosario(){
     getItems();

}
function loadListaIzquierda(pListaItems){
    var listaIzquierda= $("#listaIzquierda");
    var letraActual = "";
    var ulActual = $("<ul></ul>");
    for (var i = 0; i < pListaItems.length; i++) {
        if (letraActual != pListaItems[i].nombre[0]) {

            letraActual = pListaItems[i].nombre[0];
            var liTag = $("<li></li>");
            liTag.attr("class","list-group-item outside");
            var span = $("<span></span>");
            span.html(letraActual);
            var ul = $("<ul></ul>");
            ul.attr("class","list-group");
            liTag.append(span);
            liTag.append(ul);
            ulActual= ul;
            listaIzquierda.append(liTag);
        }
        //<li class="list-group-item"><span>abrazadora </span></li>
        var liItem = $("<li></li>");
        liItem.attr("class","list-group-item");
        liItem.attr("id",pListaItems[i].id);
        var spanLi = $("<span></span>");
        spanLi.attr("class","inside");
        var aTag  = $("<a></a>");
        aTag.attr("href","#glosaryElement"+pListaItems[i].id);
        spanLi.html(pListaItems[i].nombre);
        aTag.append(liItem);
        liItem.append(spanLi);
        ulActual.append(aTag);
    }
}
function getItems(){
    var xmlhttp = new XMLHttpRequest();
    xmlhttp.onreadystatechange = function() {
        if (this.readyState == 4 && this.status == 200) {
            $("#spinLoadGlosarioIzq").removeClass().addClass("glyphicon glyphicon-search");
            myArr = JSON.parse(this.responseText);
            loadListaIzquierda(myArr);
            loadListaDerecha(myArr);
            $("a.btn").click(function(){
                if($(this).hasClass("unloaded")){
                    var id = $(this).attr("class").split(" ").pop();
                    $(this).removeClass("unloaded");
                    loadImages(id);
                }
                if($(this).find("i").hasClass("glyphicon-plus")){
                    $(this).find("i").removeClass("glyphicon-plus").addClass("glyphicon-minus");
                }
                else{
                    $(this).find("i").removeClass("glyphicon-minus").addClass("glyphicon-plus");
                }

            });
            var input = $('#search');
            input.on('input',function(){

                filterListaIzquierda();

            });

        }
    };

    xmlhttp.open("GET", "http://herbariodigital.xyz/AppWeb/assets/php/getItemsGlosario.php", true);
    xmlhttp.send();


}

function filterListaIzquierda(){
    var text = $('#search').val();
    if(text.length > 0){
        var testableRegExp = new RegExp(RegExp.escape(text),"i");
        $(".list-group-item > span.inside").each(function(){
            if(!(String($(this).html()).match(testableRegExp))){
                $(this).parent().hide();
            }
            else{
                $(this).parent().show();
            }
        });
    }
    else{
        $(".list-group-item > span").each(function(){
                $(this).parent().show();

        })
    }
    hideOutsideTags();

}
function hideOutsideTags(){
    $(".list-group-item.outside").each(function(){
        var allHidden =true;
        $(this).find("li.list-group-item").each(function(){
            if ($(this).css("display") != "none") {
                allHidden = false;
            }
        });
        if(allHidden){
            $(this).hide();
        }
        else{
            $(this).show();
        }
    });
}
function loadListaDerecha(pListaItems){
var listaDerecha = $("#listaDerecha");
    for (var i = 0; i < pListaItems.length; i++) {
        var glosaryElement = $("<div></div>");
        glosaryElement.attr("class","row glosaryElement");
        glosaryElement.attr("id","glosaryElement"+pListaItems[i].id);
        var infoVisible = $("<div></div>");
        infoVisible.attr("class","col-md-12 infoVisible");
        var h1 = $("<h1></h1>");
        h1.html(pListaItems[i].nombre);
        var pTag = $("<p></p>");
        pTag.html(pListaItems[i].definicion);
        infoVisible.append(h1);
        infoVisible.append(pTag);
        glosaryElement.append(infoVisible);
        listaDerecha.append(glosaryElement);
        var infoNotVisible = $("<div></div>");
        infoNotVisible.attr("class","col-md-12");
        var div = $("<div></div>");
        //<a class="btn btn-default btn-xs pull-right" data-toggle="collapse" aria-expanded="false" aria-controls="collapse-1" role="button" href="#collapse-1">
        // <i class="glyphicon glyphicon-plus"></i></a>
        var aTag = $("<a></a>");
        aTag.attr("class","btn btn-default btn-xs pull-right unloaded "+pListaItems[i].id);
        aTag.attr("data-toggle","collapse");
        aTag.attr("aria-expanded","false");
        aTag.attr("aria-controls","collapse-"+i);
        aTag.attr("role","button");
        aTag.attr("href","#collapse-"+i);
        var iTag = $("<i></i>");
        iTag.attr("class","glyphicon glyphicon-plus");
        var collapse = $("<div></div>");
        collapse.attr("class","collapse");
        collapse.attr("id","collapse-"+i);
        var h4Ejemplo = $("<h4></h4>");
        h4Ejemplo.html("Fotografías de "+pListaItems[i].nombre+" "); //<i class="fa fa-circle-o-notch fa-spin" id="spinLoadGlosarioIzq"></i>
        var iTagLoaderEj = $("<i></i>");
        iTagLoaderEj.attr("class","fa fa-circle-o-notch fa-spin loaderEjemplos"+pListaItems[i].id);
        h4Ejemplo.append(iTagLoaderEj);
        var divFotoEjemplos = $("<div></div>");
        divFotoEjemplos.attr("class","row photoList ejemplos "+pListaItems[i].id);
        var h4Tipos = $("<h4></h4>");
        h4Tipos.html("Tipos de "+pListaItems[i].nombre+" ");
        var iTagLoaderTipos = $("<i></i>");
        iTagLoaderTipos.attr("class","fa fa-circle-o-notch fa-spin loaderTipos"+pListaItems[i].id);
        h4Tipos.append(iTagLoaderTipos);
        var divFotoTipos = $("<div></div>");
        divFotoTipos.attr("class","row photoList tipos "+pListaItems[i].id);

        collapse.append(h4Ejemplo);
        collapse.append(divFotoEjemplos);
        collapse.append(h4Tipos);
        collapse.append(divFotoTipos);
        aTag.append(iTag);
        div.append(aTag);
        div.append(collapse);
        infoNotVisible.append(div);
        glosaryElement.append(infoNotVisible);



    }



}

function loadImages(id){
    var xmlhttp = new XMLHttpRequest();
    xmlhttp.onreadystatechange = function() {
        if (this.readyState == 4 && this.status == 200) {
            myImgs = JSON.parse(this.responseText);
            $(".loaderTipos"+id).hide();
            $(".loaderEjemplos"+id).hide();
            var divEjemplos = $(".ejemplos."+id);
            if (myImgs.ejemplos.length > 0 ) {

                for (var i = 0; i < myImgs.ejemplos.length; i++) {
                    var div = $("<div></div>");
                    div.attr("class","col-lg-3 col-md-3 col-sm-3 col-xs-3");
                    var img = $("<img/>");
                    img.attr("class","img-responsive");
                    img.attr("src",myImgs.ejemplos[i]);
                    div.append(img);
                    divEjemplos.append(div);
                }
            }
            /* else{

                var div = $("<div></div>");
                div.attr("class","col-lg-12 col-md-12 col-sm-12 col-xs-12");
                var h3 = $("<h3><h3/>");
                h3.html("No hay ejemplos registrados");
                div.append(h3);
                divEjemplos.append(div);

            }*/
            var divTipos = $(".tipos."+id);
            if (myImgs.tipos.length > 0 ) {
                for (var i = 0; i < myImgs.tipos.length; i++) {
                    var div = $("<div></div>");
                    div.attr("class","col-lg-3 col-md-3 col-sm-3 col-xs-3");
                    var img = $("<img/>");
                    img.attr("class","img-responsive");
                    img.attr("src",myImgs.tipos[i]);
                    div.append(img);
                    divTipos.append(div);
                }
            }
            /*else{

                var div = $("<div></div>");
                div.attr("class","col-lg-12 col-md-12 col-sm-12 col-xs-12");
                var h3 = $("<h3><h3/>");
                h3.html("No hay tipos registrados");
                div.append(h3);
                divTipos.append(div);

            } */

        }
    };

    xmlhttp.open("GET", "http://herbariodigital.xyz/AppWeb/assets/php/getImagenesGlosario.php?id="+id, true);
    xmlhttp.send();


}


/*
<div class="row glosaryElement">
    <div class="col-md-12 infoVisible">
        <h1>Ápice </h1>
        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla quis volutpat augue. Sed ut auctor urna. Quisque eu duifacilisis, finibus lectus non, vulputate mi finibus lectus.&nbsp; </p>
    </div>
    <div class="col-md-12">
        <div>
            <a class="btn btn-default btn-xs pull-right" data-toggle="collapse" aria-expanded="false" aria-controls="collapse-1" role="button" href="#collapse-1"> <i class="glyphicon glyphicon-plus"></i></a>
            <div class="collapse" id="collapse-1">
                <h4>Fotografías de apices</h4>
                <div class="row photoList">
                    <div class="col-lg-3 col-md-3 col-sm-3 col-xs-3"><img class="img-responsive" src="assets/img/empty.png"></div>
                    <div class="col-lg-3 col-md-3 col-sm-3 col-xs-3"><img class="img-responsive" src="assets/img/empty.png"></div>
                    <div class="col-lg-3 col-md-3 col-sm-3 col-xs-3"><img class="img-responsive" src="assets/img/empty.png"></div>
                    <div class="col-lg-3 col-md-3 col-sm-3 col-xs-3"><img class="img-responsive" src="assets/img/empty.png"></div>
                </div>
                <h4>Tipos de apices</h4>
                <div class="row photoList">
                    <div class="col-lg-3 col-md-3 col-sm-3 col-xs-3"><img class="img-responsive" src="assets/img/empty.png"></div>
                    <div class="col-lg-3 col-md-3 col-sm-3 col-xs-3"><img class="img-responsive" src="assets/img/empty.png"></div>
                    <div class="col-lg-3 col-md-3 col-sm-3 col-xs-3"><img class="img-responsive" src="assets/img/empty.png"></div>
                    <div class="col-lg-3 col-md-3 col-sm-3 col-xs-3"><img class="img-responsive" src="assets/img/empty.png"></div>
                </div>
            </div>
        </div>
    </div>
</div>
*/

RegExp.escape= function(s) {
    return s.replace(/[-\/\\^$*+?.()|[\]{}]/g, '\\$&');
};
