

function loadTabs(){
    loadFamiliaTab();
    loadGeneroTab();
    loadFiltros();
    loadModal();
}

function loadModal(){
    $("#btnModalTable").on("click",function (e) {
        var clase = $(this).attr("class").split(' ').pop();
        var listaIDS = [];
        if(clase == "familia"){
            $('input[type="checkbox"].compTableFam:checked').each(function(){
                listaIDS.push($(this).val());
            });
        }
        else if(clase == "genero"){
            $('input[type="checkbox"].compTableGen:checked').each(function(){
                listaIDS.push($(this).val());
            });
        }
        var params = "criterio="+clase+"&ids="+JSON.stringify(listaIDS).toString();
        var xmlhttp = new XMLHttpRequest();

        xmlhttp.onreadystatechange = function() {
            if (this.readyState == 4 && this.status == 200) {
                //alert(this.responseText);
                $("tr").each(function(){
                    $(this).find("th:not(:first)").remove();
                    $(this).find("td:not(:first)").remove();

                });

                myArr = JSON.parse(this.responseText);
                if (myArr.length > 0 ) {
                    for (var i = 0; i < myArr.length; i++) {
                        var tableHeader=$("#thead");
                        var newTh = $("<th></th>");
                        newTh.html(myArr[i].nombre);
                        tableHeader.append(newTh);
                    }
                    //.nombre.procedencia.ubicacion.posicionHoja.formaHoja.florColor.florSimetria.saviaColor.saviaTextura
                    for (var i = 0; i < myArr.length; i++) {
                        var tableRow=$("#procedencia");
                        var newTd= $("<td></td>");
                        newTd.html(myArr[i].procedencia);
                        tableRow.append(newTd);
                    }
                    for (var i = 0; i < myArr.length; i++) {
                        var tableRow=$("#ubicacion");
                        var newTd= $("<td></td>");
                        newTd.html(myArr[i].ubicacion);
                        tableRow.append(newTd);
                    }
                    for (var i = 0; i < myArr.length; i++) {
                        var tableRow=$("#posicionHoja");
                        var newTd= $("<td></td>");
                        newTd.html(myArr[i].posicionHoja);
                        tableRow.append(newTd);
                    }
                    for (var i = 0; i < myArr.length; i++) {
                        var tableRow=$("#formaHoja");
                        var newTd= $("<td></td>");
                        newTd.html(myArr[i].formaHoja);
                        tableRow.append(newTd);
                    }
                    for (var i = 0; i < myArr.length; i++) {
                        var tableRow=$("#saviaColor");
                        var newTd= $("<td></td>");
                        newTd.html(myArr[i].saviaColor);
                        tableRow.append(newTd);
                    }
                    for (var i = 0; i < myArr.length; i++) {
                        var tableRow=$("#saviaTextura");
                        var newTd= $("<td></td>");
                        newTd.html(myArr[i].saviaTextura);
                        tableRow.append(newTd);
                    }
                    for (var i = 0; i < myArr.length; i++) {
                        var tableRow=$("#florColor");
                        var newTd= $("<td></td>");
                        newTd.html(myArr[i].florColor);
                        tableRow.append(newTd);
                    }
                    for (var i = 0; i < myArr.length; i++) {
                        var tableRow=$("#florSimetria");
                        var newTd= $("<td></td>");
                        newTd.html(myArr[i].florSimetria);
                        tableRow.append(newTd);
                    }

                    $("#spinTabla").hide();

                }
            }
        };

        xmlhttp.open("POST", "http://herbariodigital.xyz/AppWeb/assets/php/getInfoToLoadTable.php", true);
        xmlhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
        xmlhttp.send(params);
    });
}


function loadFamiliaTab(){
    var xmlhttp = new XMLHttpRequest();
    xmlhttp.onreadystatechange = function() {
        if (this.readyState == 4 && this.status == 200) {
            myArr = JSON.parse(this.responseText);
            var famActual = "";
            var tabFamilia = $('#accordion-1');
            var panelCount = 0;
            var actualUl = "";
            if (myArr.length > 0 ) {
                for (var i = 0; i < myArr.length; i++) {
                    if(famActual != myArr[i].nombreFamilia){
                        panelCount +=1;
                        famActual = myArr[i].nombreFamilia;
                        var divPanel = $("<div></div>");
                        divPanel.attr("class","panel panel-default panel-list "+quitarEspacios(myArr[i].ubicacion)+" "+quitarEspacios(myArr[i].procedencia)+" "+quitarEspacios(myArr[i].posicionHoja)+" "+quitarEspacios(myArr[i].formaHoja)+" "+quitarEspacios(myArr[i].florColor)+" "+quitarEspacios(myArr[i].florSimetria)+" "+quitarEspacios(myArr[i].saviaColor)+" "+quitarEspacios(myArr[i].saviaTextura));
                        var divPanelHeading = $("<div></div>");
                        divPanelHeading.attr("class","panel-heading panel-heading-line-bottom");
                        var divRow = $("<div></div>");
                        divRow.attr("class","row");
                        var divCol1 =  $("<div></div>");
                        divCol1.attr("class","col-lg-1 col-md-1 col-sm-1 col-xs-1");
                        divCol1.attr("style","width:4.166666665%");
                        var input = $("<input/>");
                        input.attr("type","checkbox");
                        input.attr("class","compTableFam");
                        input.attr("value",myArr[i].familiaID);
                        var divCol2 =  $("<div></div>");
                        divCol2.attr("class"," selectableFamilia col-lg-11 col-md-11 col-sm-11 col-xs-11 no-padding");

                        divCol2.attr("role","tab");
                        divCol2.attr("data-toggle","collapse");
                        divCol2.attr("data-parent","#accordion-1");
                        divCol2.attr("href","#accordion-1 .item-"+panelCount);
                        divCol2.attr("aria-expanded","false");
                        var h4 = $("<h4></h4>");
                        h4.attr("class","panel-title");
                        var iTag = $("<i></i>");
                        iTag.attr("class","glyphicon glyphicon-chevron-right");
                        iTag.attr("id","iconLista");
                        var aTag = $("<a></a>");
                        aTag.attr("role","button");
                        aTag.attr("data-toggle","collapse");
                        aTag.attr("data-parent","#accordion-1");
                        aTag.attr("aria-expanded","false");

                        aTag.attr("href","#accordion-1 .item-"+panelCount);
                        aTag.attr("class","title");
                        aTag.html(myArr[i].nombreFamilia);
                        var span =  $("<span></span>");
                        span.attr("class","badge");
                        span.html(getCountOfFamilias(myArr,famActual));
                        aTag.append(span);
                        h4.append(iTag);
                        h4.append(aTag);
                        divCol2.append(h4);
                        divCol1.append(input);
                        divRow.append(divCol1);
                        divRow.append(divCol2);
                        divPanelHeading.append(divRow);
                        divPanel.append(divPanelHeading);
                        tabFamilia.append(divPanel);



                        var divPanelCollapsed = $("<div></div>");
                        divPanelCollapsed.attr("class","panel-collapse collapse item-"+panelCount);
                        divPanelCollapsed.attr("role","tabpanel");
                        var divPanelBodyCollapsed = $("<div></div>");
                        divPanelBodyCollapsed.attr("class","panel-body panel-hidden");
                        var ulTag = $("<ul></ul>");
                        actualUl = ulTag;
                        ulTag.attr("class","list-group");
                        var liTag = $("<li></li>");
                        liTag.attr("class","list-group-item");
                        var divRowtag = $("<div></div>");
                        divRowtag.attr("class","row");
                        aRedirectorTag = $("<a></a>");
                        aRedirectorTag.attr("href","fichaBotanica.php?id="+myArr[i].especieID);
                        var divCol1 = $("<div></div>");
                        divCol1.attr("class","col-lg-2 col-md-2 col-sm-2 col-xs-12");
                        var img =  $("<img/>");
                        img.attr("class","img-circle img-responsive");
                        img.attr("src",myArr[i].img);
                        img.attr("width","90");
                        img.attr("height","100");
                        var divCol2 = $("<div></div>");
                        divCol2.attr("class","col-lg-10 col-md-10 col-sm-10 col-xs-12");
                        var blockquote = $("<blockquote></blockquote>");
                        var pTag =  $("<p></p>");
                        pTag.html(myArr[i].nombreCientifico);
                        var footerTag =  $("<footer></footer>");
                        footerTag.html(myArr[i].nombreComun);
                        blockquote.append(pTag);
                        blockquote.append(footerTag);
                        divCol2.append(blockquote);
                        divCol1.append(img);
                        aRedirectorTag.append(divCol1);
                        aRedirectorTag.append(divCol2);
                        divRowtag.append(aRedirectorTag);
                        liTag.append(divRowtag);
                        actualUl.append(liTag);
                        divPanelBodyCollapsed.append(actualUl);
                        divPanelCollapsed.append(divPanelBodyCollapsed);
                        divPanel.append(divPanelCollapsed);


                    }
                    else{
                        var liTag = $("<li></li>");
                        liTag.attr("class","list-group-item");
                        var divRowtag = $("<div></div>");
                        divRowtag.attr("class","row");
                        aRedirectorTag = $("<a></a>");
                        aRedirectorTag.attr("href","fichaBotanica.php?id="+myArr[i].especieID);
                        var divCol1 = $("<div></div>");
                        divCol1.attr("class","col-lg-2 col-md-2 col-sm-2 col-xs-12");
                        var img =  $("<img/>");
                        img.attr("class","img-circle img-responsive");
                        img.attr("src",myArr[i].img);
                        img.attr("width","90");
                        img.attr("height","100");
                        var divCol2 = $("<div></div>");
                        divCol2.attr("class","col-lg-10 col-md-10 col-sm-10 col-xs-12");
                        var blockquote = $("<blockquote></blockquote>");
                        var pTag =  $("<p></p>");
                        pTag.html(myArr[i].nombreCientifico);
                        var footerTag =  $("<footer></footer>");
                        footerTag.html(myArr[i].nombreComun);
                        blockquote.append(pTag);
                        blockquote.append(footerTag);
                        divCol2.append(blockquote);
                        divCol1.append(img);
                        aRedirectorTag.append(divCol1);
                        aRedirectorTag.append(divCol2);
                        divRowtag.append(aRedirectorTag);
                        liTag.append(divRowtag);
                        actualUl.append(liTag);


                    }
                  }

            }

        }

            $("#spinFamilia").hide();
            $(".selectableFamilia").on("click",function (e) {
              if($(this).find("i").attr('class') == "glyphicon glyphicon-chevron-right"){
                  $(this).find("i").removeClass().addClass("glyphicon glyphicon-chevron-down");
              }else{
                  $(this).find("i").removeClass().addClass("glyphicon glyphicon-chevron-right");
              }
          });
          $('input[type="checkbox"].compTableFam').click(function(){
              selectFamiliaToCompare($(this));
          });
    };

    xmlhttp.open("GET", "http://herbariodigital.xyz/AppWeb/assets/php/getListaEspeciesFamilia.php", true);
    xmlhttp.send();

}
function getCountOfFamilias(list,val){
    var count = 0;
    for(var i = 0; i < list.length; i++){
        if (list[i].nombreFamilia == val){
            count+=1;
        }
    }
    return count;
}
function getCountOfGeneros(list,val){
    var count = 0;
    for(var i = 0; i < list.length; i++){
        if (list[i].nombreGenero == val){
            count+=1;
        }
    }
    return count;
}

function loadFiltros(){
    var xmlhttp = new XMLHttpRequest();
    xmlhttp.onreadystatechange = function() {
        if (this.readyState == 4 && this.status == 200) {
            myFiltro = JSON.parse(this.responseText);
            colocarFiltro(myFiltro.procedencia,"Procedencia",1);
             colocarFiltro(myFiltro.ubicacion,"Ubicación",2);
             colocarFiltro(myFiltro.posicionHoja,"Posición de la Hoja",3);
             colocarFiltro(myFiltro.formaHoja,"Forma de la Hoja",4);
             colocarFiltro(myFiltro.florColor,"Color de la Flor",5);
             colocarFiltro(myFiltro.florSimetria,"Simetría de la Flor",6);
             colocarFiltro(myFiltro.saviaColor,"Color de la Savia",7);
             colocarFiltro(myFiltro.saviaTextura,"Textura de la Savia",8);
             $("#spinFiltrarEspecies").hide();


        }
        $(".panel-heading.panel-left").on("click", function (e) {
          if($(this).find("i").attr('class') == "glyphicon glyphicon-chevron-right"){
              $(this).find("i").removeClass().addClass("glyphicon glyphicon-chevron-down");
          }else{
              $(this).find("i").removeClass().addClass("glyphicon glyphicon-chevron-right");
          }
        });

        $('input[type="checkbox"].filter').click(function(){
            select();
        });
    };

    xmlhttp.open("GET", "http://herbariodigital.xyz/AppWeb/assets/php/getFiltros.php", true);
    xmlhttp.send();

}

function colocarFiltro(listaChecks,nombreFiltro,itemNum){
    var divAcordion = $("#accordion-4");
    var divPanel = $("<div></div>");
    divPanel.attr("class","panel panel-default ");
    var divPanelHeading = $("<div></div>");
    divPanelHeading.attr("class","panel-heading panel-left");

    divPanelHeading.attr("role","tab");
    divPanelHeading.attr("data-toggle","collapse");
    divPanelHeading.attr("data-parent","#accordion-4");
    divPanelHeading.attr("aria-expanded","false");
    divPanelHeading.attr("href","#accordion-4 .item-"+itemNum);
    var h4 = $("<h4></h4>");
    h4.attr("class","panel-title");
    var iTag = $("<i></i>");
    iTag.attr("class","glyphicon glyphicon-chevron-right");
    iTag.attr("id","iconLista");
    var aTag = $("<a></a>");
    aTag.attr("role","button");
    aTag.attr("data-toggle","collapse");
    aTag.attr("data-parent","#accordion-4");
    aTag.attr("aria-expanded","false");

    aTag.attr("href","#accordion-4 .item-"+itemNum);
    aTag.attr("class","title");
    aTag.html(nombreFiltro);
    var divPanelCollapsed =  $("<div></div>");
    divPanelCollapsed.attr("class","panel-collapse collapse item-"+itemNum);
    divPanelCollapsed.attr("role","tabpanel");
    var divPanelBody =   $("<div></div>");
    divPanelBody.attr("class","panel-body");
    for (var i = 0; i < listaChecks.length; i++) {
        var divCheckBoxes =   $("<div></div>");
        divCheckBoxes.attr("class","checkbox");
        var label =   $("<label></label>");
        label.html("<input type='checkbox' class='filter' value='"+quitarEspacios(listaChecks[i])+"'>"+listaChecks[i]);
        divCheckBoxes.append(label);
        divPanelBody.append(divCheckBoxes);
      }
      divPanelCollapsed.append(divPanelBody);
      h4.append(iTag);
      h4.append(aTag);
      divPanelHeading.append(h4);
      divPanel.append(divPanelHeading);
      divPanel.append(divPanelCollapsed);
      divAcordion.append(divPanel);


    /*
    <div class="panel panel-default">
        <div class="panel-heading panel-left" role="tab" data-toggle="collapse" data-parent="#accordion-4" aria-expanded="false" href="#accordion-4 .item-1">
            <h4 class="panel-title"><i class="glyphicon glyphicon-chevron-right"></i>
                <a role="button" data-toggle="collapse" data-parent="#accordion-4" aria-expanded="false" href="#accordion-4 .item-1" class="title">Ubicación</a>
            </h4>
        </div>
        <div class="panel-collapse collapse item-1" role="tabpanel">
            <div class="panel-body">
                <div class="checkbox">
                    <label>
                        <input type="checkbox">Elemento 1
                    </label>
                </div>
            </div>
        </div>
    </div>
    */
}
function loadGeneroTab(){
    var xmlhttp = new XMLHttpRequest();
    xmlhttp.onreadystatechange = function() {
        if (this.readyState == 4 && this.status == 200) {
            myArr = JSON.parse(this.responseText);
            var famActual = "";
            var tabFamilia = $('#accordion-2');
            var panelCount = 0;
            var actualUl = "";
            if (myArr.length > 0 ) {
                for (var i = 0; i < myArr.length; i++) {
                    if(famActual != myArr[i].nombreGenero){
                        panelCount +=1;
                        famActual = myArr[i].nombreGenero;
                        var divPanel = $("<div></div>");
                        divPanel.attr("class","panel panel-default panel-list "+quitarEspacios(myArr[i].ubicacion)+" "+quitarEspacios(myArr[i].procedencia)+" "+quitarEspacios(myArr[i].posicionHoja)+" "+quitarEspacios(myArr[i].formaHoja)+" "+quitarEspacios(myArr[i].florColor)+" "+quitarEspacios(myArr[i].florSimetria)+" "+quitarEspacios(myArr[i].saviaColor)+" "+quitarEspacios(myArr[i].saviaTextura));
                        var divPanelHeading = $("<div></div>");
                        divPanelHeading.attr("class","panel-heading panel-heading-line-bottom");
                        var divRow = $("<div></div>");
                        divRow.attr("class","row");
                        var divCol1 =  $("<div></div>");
                        divCol1.attr("class","col-lg-1 col-md-1 col-sm-1 col-xs-1");
                        divCol1.attr("style","width:4.166666665%");
                        var input = $("<input/>");
                        input.attr("type","checkbox");
                        input.attr("class","compTableGen");
                        input.attr("value",myArr[i].generoID);
                        var divCol2 =  $("<div></div>");
                        divCol2.attr("class"," selectableGenero col-lg-11 col-md-11 col-sm-11 col-xs-11 no-padding");

                        divCol2.attr("role","tab");
                        divCol2.attr("data-toggle","collapse");
                        divCol2.attr("data-parent","#accordion-2");
                        divCol2.attr("href","#accordion-2 .item-"+panelCount);
                        divCol2.attr("aria-expanded","false");
                        var h4 = $("<h4></h4>");
                        h4.attr("class","panel-title");
                        var iTag = $("<i></i>");
                        iTag.attr("class","glyphicon glyphicon-chevron-right");
                        iTag.attr("id","iconLista");
                        var aTag = $("<a></a>");
                        aTag.attr("role","button");
                        aTag.attr("data-toggle","collapse");
                        aTag.attr("data-parent","#accordion-2");
                        aTag.attr("aria-expanded","false");

                        aTag.attr("href","#accordion-2 .item-"+panelCount);
                        aTag.attr("class","title");
                        aTag.html(myArr[i].nombreGenero);
                        var span =  $("<span></span>");
                        span.attr("class","badge");
                        span.html(getCountOfGeneros(myArr,famActual));
                        aTag.append(span);
                        h4.append(iTag);
                        h4.append(aTag);
                        divCol2.append(h4);
                        divCol1.append(input);
                        divRow.append(divCol1);
                        divRow.append(divCol2);
                        divPanelHeading.append(divRow);
                        divPanel.append(divPanelHeading);
                        tabFamilia.append(divPanel);



                        var divPanelCollapsed = $("<div></div>");
                        divPanelCollapsed.attr("class","panel-collapse collapse item-"+panelCount);
                        divPanelCollapsed.attr("role","tabpanel");
                        var divPanelBodyCollapsed = $("<div></div>");
                        divPanelBodyCollapsed.attr("class","panel-body panel-hidden");
                        var ulTag = $("<ul></ul>");
                        actualUl = ulTag;
                        ulTag.attr("class","list-group");
                        var liTag = $("<li></li>");
                        liTag.attr("class","list-group-item");
                        var divRowtag = $("<div></div>");
                        divRowtag.attr("class","row");
                        aRedirectorTag = $("<a></a>");
                        aRedirectorTag.attr("href","fichaBotanica.php?id="+myArr[i].especieID);
                        var divCol1 = $("<div></div>");
                        divCol1.attr("class","col-lg-2 col-md-2 col-sm-2 col-xs-12");
                        var img =  $("<img/>");
                        img.attr("class","img-circle img-responsive");
                        img.attr("src",myArr[i].img);
                        img.attr("width","90");
                        img.attr("height","100");
                        var divCol2 = $("<div></div>");
                        divCol2.attr("class","col-lg-10 col-md-10 col-sm-10 col-xs-12");
                        var blockquote = $("<blockquote></blockquote>");
                        var pTag =  $("<p></p>");
                        pTag.html(myArr[i].nombreCientifico);
                        var footerTag =  $("<footer></footer>");
                        footerTag.html(myArr[i].nombreComun);
                        blockquote.append(pTag);
                        blockquote.append(footerTag);
                        divCol2.append(blockquote);
                        divCol1.append(img);
                        aRedirectorTag.append(divCol1);
                        aRedirectorTag.append(divCol2);
                        divRowtag.append(aRedirectorTag);
                        liTag.append(divRowtag);
                        actualUl.append(liTag);
                        divPanelBodyCollapsed.append(actualUl);
                        divPanelCollapsed.append(divPanelBodyCollapsed);
                        divPanel.append(divPanelCollapsed);


                    }
                    else{
                        var liTag = $("<li></li>");
                        liTag.attr("class","list-group-item");
                        var divRowtag = $("<div></div>");
                        divRowtag.attr("class","row");
                        aRedirectorTag = $("<a></a>");
                        aRedirectorTag.attr("href","fichaBotanica.php?id="+myArr[i].especieID);
                        var divCol1 = $("<div></div>");
                        divCol1.attr("class","col-lg-2 col-md-2 col-sm-2 col-xs-12");
                        var img =  $("<img/>");
                        img.attr("class","img-circle img-responsive");
                        img.attr("src",myArr[i].img);
                        img.attr("width","90");
                        img.attr("height","100");
                        var divCol2 = $("<div></div>");
                        divCol2.attr("class","col-lg-10 col-md-10 col-sm-10 col-xs-12");
                        var blockquote = $("<blockquote></blockquote>");
                        var pTag =  $("<p></p>");
                        pTag.html(myArr[i].nombreCientifico);
                        var footerTag =  $("<footer></footer>");
                        footerTag.html(myArr[i].nombreComun);
                        blockquote.append(pTag);
                        blockquote.append(footerTag);
                        divCol2.append(blockquote);
                        divCol1.append(img);
                        aRedirectorTag.append(divCol1);
                        aRedirectorTag.append(divCol2);
                        divRowtag.append(aRedirectorTag);
                        liTag.append(divRowtag);
                        actualUl.append(liTag);


                    }
                  }

            }

        }
        $("#spinGenero").hide();
            $(".selectableGenero").on("click",function (e) {
              if($(this).find("i").attr('class') == "glyphicon glyphicon-chevron-right"){
                  $(this).find("i").removeClass().addClass("glyphicon glyphicon-chevron-down");
              }else{
                  $(this).find("i").removeClass().addClass("glyphicon glyphicon-chevron-right");
              }
            });
            $('input[type="checkbox"].compTableGen').click(function(){
                selectGeneroToCompare($(this));
            });
    };

    xmlhttp.open("GET", "http://herbariodigital.xyz/AppWeb/assets/php/getListaEspeciesGenero.php", true);
    xmlhttp.send();

}

function select(){
    if($('input[type="checkbox"].filter:checked').length == 0){
        $('div.tab-pane.active div.panel-group .panel.panel-default.panel-list').show();
    }
    else{

   $('div.tab-pane.active div.panel-group .panel.panel-default.panel-list').hide();

   var $div=$("div.tab-pane.active div.panel-group .panel.panel-default.panel-list");
   var check=false;
   $('input[type="checkbox"].filter:checked').each(function(){
      $("." + $(this).val()).show();
  });
}
}

function selectFamiliaToCompare(checkedBox){
    $('input[type="checkbox"].compTableGen:checked').each(function(){
        $(this).attr("checked",false);
    })
    $("#btnModalTable").removeClass("genero");
    $("#btnModalTable").addClass("familia");
    if($('input[type="checkbox"].compTableFam:checked').length < 2){
        $("#btnModalTable").attr("disabled",true);
    }
    else if($('input[type="checkbox"].compTableFam:checked').length > 5){
        $("#btnModalTable").attr("disabled",true);
        checkedBox.attr("checked",false);
    }
    else{
        $("#btnModalTable").attr("disabled",false);
    }
}
function selectGeneroToCompare(checkedBox){
    $('input[type="checkbox"].compTableFam:checked').each(function(){
        $(this).attr("checked",false);
    })
    $("#btnModalTable").removeClass("familia");
    $("#btnModalTable").addClass("genero");
    if($('input[type="checkbox"].compTableGen:checked').length < 2){
        $("#btnModalTable").attr("disabled",true);
    }
    else if($('input[type="checkbox"].compTableGen:checked').length > 5){
        $("#btnModalTable").attr("disabled",true);
        checkedBox.attr("checked",false);
    }
    else{
        $("#btnModalTable").attr("disabled",false);
    }
}
function quitarEspacios(input){
    return input.replace(/\s/g,'');
}
