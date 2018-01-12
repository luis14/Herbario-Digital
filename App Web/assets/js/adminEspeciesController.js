function loadControllers(){
    loadEspecies();

    $("#uploadimage").on('submit',(function(e) {
        e.preventDefault();
        $.ajax({
        url: "http://herbariodigital.xyz/AppWeb/assets/php/addEspecie.php", // Url to which the request is send
        type: "POST",             // Type of request to be send, called as method
        data: new FormData(this), // Data sent to server, a set of key/value pairs (i.e. form fields and values)
        contentType: false,       // The content type used when sending data to the server.
        cache: false,             // To unable request pages to be cached
        processData:false,        // To send DOMDocument or non processed data file it is set to false
        success: function(data)   // A function to be called if request succeeds
        {
            var jsonAns = JSON.parse(data);
            if(jsonAns.status == "ok"){
                $("#modalAgregar").modal("hide");
                location.reload();
            }
            else{
                alert("An error ocurred");
            }
        }
    });
}));

    $("#btnModalAgregar").on("click",function(){
        loadSelectAgregar();
    });
    $("#uploadItem").on('submit',(function(e) {
        e.preventDefault();
        $.ajax({
        url: "http://herbariodigital.xyz/AppWeb/assets/php/addItemGlosario.php", // Url to which the request is send
        type: "POST",             // Type of request to be send, called as method
        data: new FormData(this), // Data sent to server, a set of key/value pairs (i.e. form fields and values)
        contentType: false,       // The content type used when sending data to the server.
        cache: false,             // To unable request pages to be cached
        processData:false,        // To send DOMDocument or non processed data file it is set to false
        success: function(data)   // A function to be called if request succeeds
        {
            var jsonAns = JSON.parse(data);
            if(jsonAns.status == "ok"){
                $("#modalAgregar").modal("hide");
                location.reload();
            }
            else{
                alert("An error ocurred");
            }
        }
    });
}));
$(document).on('change', '.btn-file :file', function() {
    var input = $(this),
        label = input.val().replace(/\\/g, '/').replace(/.*\//, '');
    input.trigger('fileselect', [label]);
    });

    $('.btn-file :file').on('fileselect', function(event, label) {

        var input = $(this).parents('.input-group').find(':text'),
            log = label;

        if( input.length ) {
            input.val(log);
        } else {
            if( log ) alert(log);
        }

    });
    function readURL(input) {
        if (input.files && input.files[0]) {
            var reader = new FileReader();

            reader.onload = function (e) {
                $('#img-top').attr('src', e.target.result);
                $('#img-top').attr('hidden',false);
            }

            reader.readAsDataURL(input.files[0]);
        }
    }

    $("#imgInpAgregar").change(function(){
        readURL(this);
    });


    $("#btnEliminar").click(function(){
        eliminarEspecie($("#idEliminar").val());
    });
    $("#btnEditar").click(function(){
        var idEditar =  $("#idEditar").val();
        var nombreComun = $("#nombreComun").val();
        var nombreCientifico = $("#nombreCientifico").val();
        var descripcion = $("#descripcion").val();
        var pubescencia = $('#pubescencia').val();
        var yemaFloral = $('#yemaFloral').val();
        var procedencia = $("#procedencia").val();
        var genero = $("#genero").val();
        var familia = $("#familia").val();
        var colorSavia = $("#colorSavia").val();
        var texturaSavia = $("#texturaSavia").val();
        var formaHoja = $("#formaHoja").val();
        var posicionHoja = $("#posicionHoja").val();
        var ubicacion = $("#ubicacion").val();
        var florColor = $("#florColor").val();
        var florSimetria = $("#florSimetria").val();
        editarEspecie(idEditar,nombreComun,nombreCientifico,descripcion,pubescencia,yemaFloral,procedencia,genero,familia,colorSavia,texturaSavia,formaHoja,posicionHoja,ubicacion,florColor,florSimetria);
    })
}
function editarEspecie(idEditar,nombreComun,nombreCientifico,descripcion,pubescencia,yemaFloral,procedencia,genero,familia,colorSavia,texturaSavia,formaHoja,posicionHoja,ubicacion,florColor,florSimetria){

    var xmlhttp = new XMLHttpRequest();
    xmlhttp.onreadystatechange = function() {
        if (this.readyState == 4 && this.status == 200) {
            jsonAns = JSON.parse(this.responseText);
            if (jsonAns.status ="ok" ) {
                $('#modalEditar').modal('hide');
                  location.reload();
            }
            else{
                $('#modalEditar').modal('hide');
                alert("Algo salió mal. Reintente más tarde.");
            }
        }
    };
    xmlhttp.open("GET","http://herbariodigital.xyz/AppWeb/assets/php/adminEspeciesController.php?action=edit&id="+idEditar+"&nombreComun="+nombreComun+"&nombreCientifico="+nombreCientifico+"&descripcion="+descripcion+"&pubescencia="+pubescencia+"&yemaFloral="+yemaFloral+"&procedencia="+procedencia+"&genero="+genero+"&familia="+familia+"&colorSavia="+colorSavia+"&texturaSavia="+texturaSavia+"&formaHoja="+formaHoja+"&posicionHoja="+posicionHoja+"&ubicacion="+ubicacion+"&florColor="+florColor+"&florSimetria="+florSimetria, true);
    xmlhttp.send();
}
function eliminarEspecie(pId){
    var xmlhttp = new XMLHttpRequest();
    xmlhttp.onreadystatechange = function() {
        if (this.readyState == 4 && this.status == 200) {
            jsonAns = JSON.parse(this.responseText);
            if (jsonAns.status ="ok" ) {
                $('#modalEliminar').modal('hide');
                  location.reload();
            }
            else{
                $('#modalEliminar').modal('hide');
                alert("Algo salió mal. Reintente más tarde.");
            }
        }
    };

    xmlhttp.open("GET", "http://herbariodigital.xyz/AppWeb/assets/php/adminEspeciesController.php?action=delete&id="+pId, true);
    xmlhttp.send();
}
function agregarAdministrador(){

    var correoElectronico = $("#newCorreoElectronico").val();
    var password = $("#newPassword").val();
    if(correoElectronico.length >0 && password.length >0){
        var xmlhttp = new XMLHttpRequest();
        xmlhttp.onreadystatechange = function() {
            if (this.readyState == 4 && this.status == 200) {
                jsonAns = JSON.parse(this.responseText);
                if (jsonAns.status ="ok" ) {
                    $('#modalAgregar').modal('hide');
                    $("#newCorreoElectronico").val("");
                    $("#newPassword").val("");
                      location.reload();
                }
                else{
                    $('#modalAgregar').modal('hide');
                    alert("Algo salió mal. Reintente más tarde.");
                }
            }
        };

        xmlhttp.open("GET", "http://herbariodigital.xyz/AppWeb/assets/php/adminEspeciesController.php?action=add&email="+correoElectronico+"&password="+password, true);
        xmlhttp.send();
    }

}

function loadEspecies(){
    ////,"+row[i].especieID+"~"+row[i].pubescencia+"~"+row[i].yemaFloral+"~"+row[i].nombreComun+"~"+row[i].nombreCientifico+"~"+row[i].descripcion+"~"+row[i].imagenURL+"~"+row[i].f_procedenciaID+"~"+row[i].f_generoID+"~"+row[i].f_familiaID+"~"+row[i].f_saviaColorID+"~"+row[i].f_saviaTexturaID+"~"+row[i].f_formaHojaID+"~"+row[i].f_posicionHojaID+"~"+row[i].f_ubicacionID+"~"+row[i].f_florColorID+"~"+row[i].f_florSimetriaID+"
    var xmlhttp = new XMLHttpRequest();
    xmlhttp.onreadystatechange = function() {
        if (this.readyState == 4 && this.status == 200) {
            jsonAns = JSON.parse(this.responseText); // //id	nombre	definicion
            if (jsonAns.status ="ok" ) {
                var rows = jsonAns.items;
                var tbodyAdmin = $("#tbodyAdmin");
                for (var i = 0; i < rows.length; i++) {
                    var tr = $("<tr></tr>");
                    var tdAccion = $("<td></td>");
                    var span1 = $("<span style='margin-right:10%;' ></span>");
                    var iTag1 = $("<i class='glyphicon glyphicon-pencil'></i> ");
                    var aTag1 = $("<a href='#' data-toggle='modal' class='editar' data-target='#modalEditar'> Editar </a>");
                    var inputHidden =$("<input type='hidden' value='"+rows[i].especieID+"~"+rows[i].pubescencia+"~"+rows[i].yemaFloral+"~"+rows[i].nombreComun+"~"+rows[i].nombreCientifico
                    +"~"+rows[i].descripcion+"~"+rows[i].imagenURL+"~"+rows[i].f_procedenciaID
                    +"~"+rows[i].f_generoID+"~"+rows[i].f_familiaID+"~"+rows[i].f_saviaColorID
                    +"~"+rows[i].f_saviaTexturaID+"~"+rows[i].f_formaHojaID+"~"+rows[i].f_posicionHojaID
                    +"~"+rows[i].f_ubicacionID+"~"+rows[i].f_florColorID+"~"+rows[i].f_florSimetriaID+"'></input>");
                    var span2 = $("<span></span>");
                    var iTag2 = $("<i class='glyphicon glyphicon-remove'></i> ");
                    var aTag2 = $("<a href='#' class='eliminar' data-toggle='modal' data-target='#modalEliminar'> Eliminar </a>");
                    var tdNombreComun = $("<td>"+rows[i].nombreComun+"</td>");
                    var tdNombreCientifico = $("<td>"+rows[i].nombreCientifico+"</td>");
                    var tdDescripcion = $("<td>"+rows[i].descripcion+"</td>");
                    var tdImagen = $("<td><img class='img-circle' src='"+rows[i].imagenURL+"' width='50' height='50'></td>");
                    span1.append(iTag1);
                    span1.append(aTag1);
                    span2.append(iTag2);
                    span2.append(aTag2);
                    tdAccion.append(span1);
                    tdAccion.append(span2);
                    tdAccion.append(inputHidden);
                    tr.append(tdAccion);
                    tr.append(tdNombreComun);
                    tr.append(tdNombreCientifico);
                    tr.append(tdDescripcion);
                    tr.append(tdImagen);
                    tbodyAdmin.append(tr);
                }
                $('#tablePagination').DataTable();
                $("a.eliminar").click(function(){
                    var info= $(this).parents("tr").find("input").val();
                    cargarModalDelete(info);
                });
                $("a.editar").click(function(){
                    var info= $(this).parents("tr").find("input").val();
                    cargarModalEditar(info);
                });

            }
            else{
                alert("Algo salió mal. Reintente más tarde.");
            }
        }
    };

    xmlhttp.open("GET", "http://herbariodigital.xyz/AppWeb/assets/php/adminEspeciesController.php?action=getAll", true);
    xmlhttp.send();
}
function cargarModalEditar(pinfo){
    ////,"+row[i].especieID+"~"+row[i].pubescencia+"~"+row[i].yemaFloral+"~"+row[i].nombreComun+"~"+row[i].nombreCientifico+"~"+row[i].descripcion+"~"+row[i].imagenURL+"~"+row[i].f_procedenciaID+"~"+row[i].f_generoID+"~"+row[i].f_familiaID+"~"+row[i].f_saviaColorID+"~"+row[i].f_saviaTexturaID+"~"+row[i].f_formaHojaID+"~"+row[i].f_posicionHojaID+"~"+row[i].f_ubicacionID+"~"+row[i].f_florColorID+"~"+row[i].f_florSimetriaID+"
pinfo=pinfo.split("~");
var especieID = pinfo[0];
var pubescencia = pinfo[1];
var yemaFloral = pinfo[2];
var nombreComun = pinfo[3];
var nombreCientifico = pinfo[4];
var descripcion = pinfo[5];
var imagenURL = pinfo[6];
var f_procedenciaID = pinfo[7];
var f_generoID = pinfo[8];
var f_familiaID = pinfo[9];
var f_saviaColorID = pinfo[10];
var f_saviaTexturaID = pinfo[11];
var f_formaHojaID = pinfo[12];
var f_posicionHojaID = pinfo[13];
var f_ubicacionID = pinfo[14];
var f_florColorID = pinfo[15];
var f_florSimetriaID = pinfo[16];
$("#idEditar").val(especieID);
$("#nombreComun").val(nombreComun);
$("#nombreCientifico").val(nombreCientifico);
$("#descripcion").val(descripcion);
//$('#pubescencia').html('');
if (pubescencia =="sí") {
    $('#pubescencia').append($("<option value='sí' selected>Sí</option>"));
    $('#pubescencia').append($("<option value='no' >No</option>"));
}else{
    $('#pubescencia').append($("<option value='no' selected>No</option>"));
    $('#pubescencia').append($("<option value='sí' >Sí</option>"));
}

//$('#yemaFloral').html('');
if (yemaFloral =="sí") {
    $('#yemaFloral').append($("<option value='no' >No</option>"));
    $('#yemaFloral').append($("<option value='sí' selected>Sí</option>"));

}else{
    $('#yemaFloral').append($("<option value='sí' >Sí</option>"));
    $('#yemaFloral').append($("<option value='no' selected >No</option>"));

}

var input_procedencia = $("#procedencia");
var input_genero = $("#genero");
var input_familia = $("#familia");
var input_colorSavia = $("#colorSavia");
var input_texturaSavia = $("#texturaSavia");
var input_formaHoja = $("#formaHoja");
var input_posicionHoja = $("#posicionHoja");
var input_ubicacion = $("#ubicacion");
var input_florColor = $("#florColor");
var input_florSimetria = $("#florSimetria");

var xmlhttp = new XMLHttpRequest();
xmlhttp.onreadystatechange = function() {
    if (this.readyState == 4 && this.status == 200) {
        jsonAns = JSON.parse(this.responseText);
        if (jsonAns.status ="ok" ) {
            loadSelect(input_procedencia,jsonAns.procedencia,f_procedenciaID);
            loadSelect(input_genero,jsonAns.genero,f_generoID);
            loadSelect(input_familia,jsonAns.familia,f_familiaID);
            loadSelect(input_colorSavia,jsonAns.colorSavia,f_saviaColorID);
            loadSelect(input_texturaSavia,jsonAns.texturaSavia,f_saviaTexturaID);
            loadSelect(input_formaHoja,jsonAns.formaHoja,f_formaHojaID);
            loadSelect(input_posicionHoja,jsonAns.posicionHoja,f_posicionHojaID);
            loadSelect(input_ubicacion,jsonAns.ubicacion,f_ubicacionID);
            loadSelect(input_florColor,jsonAns.florColor,f_florColorID);
            loadSelect(input_florSimetria,jsonAns.florSimetria,f_florSimetriaID);

        }
        else{
            $('#modalEditar').modal('hide');
            alert("Algo salió mal. Reintente más tarde.");
        }
    }
};

xmlhttp.open("GET", "http://herbariodigital.xyz/AppWeb/assets/php/adminEspeciesController.php?action=getCatalogos", true);
xmlhttp.send();

}

function cargarModalDelete(pInfo){
    var idEliminar = pInfo.split("~")[0];
    var itemEliminar = pInfo.split("~")[4];
    $("#idEliminar").val(idEliminar);
    $("#itemEliminar").html(itemEliminar);

}
function loadSelectAgregar(){
    var xmlhttp = new XMLHttpRequest();
    xmlhttp.onreadystatechange = function() {
        if (this.readyState == 4 && this.status == 200) {
            jsonAns = JSON.parse(this.responseText);
            if (jsonAns.status ="ok" ) {
                loadSelect($("#procedenciaAgregar"),jsonAns.procedencia,"-1");
                loadSelect($("#generoAgregar"),jsonAns.genero,"-1");
                loadSelect($("#familiaAgregar"),jsonAns.familia,"-1");
                loadSelect($("#colorSaviaAgregar"),jsonAns.colorSavia,"-1");
                loadSelect($("#texturaSaviaAgregar"),jsonAns.texturaSavia,"-1");
                loadSelect($("#formaHojaAgregar"),jsonAns.formaHoja,"-1");
                loadSelect($("#posicionHojaAgregar"),jsonAns.posicionHoja,"-1");
                loadSelect($("#ubicacionAgregar"),jsonAns.ubicacion,"-1");
                loadSelect($("#florColorAgregar"),jsonAns.florColor,"-1");
                loadSelect($("#florSimetriaAgregar"),jsonAns.florSimetria,"-1");
            }
            else{
                $('#modalEditar').modal('hide');
                alert("Algo salió mal. Reintente más tarde.");
            }
        }
    };

    xmlhttp.open("GET", "http://herbariodigital.xyz/AppWeb/assets/php/adminEspeciesController.php?action=getCatalogos", true);
    xmlhttp.send();
}
function loadSelect(select,array,id){
    select.html("");
    for (var i = 0; i < array.length; i++) {
        if (array[i].id == id) {
            $("<option value='"+array[i].id+"' selected>"+array[i].nombre+"</option>").appendTo(select);

        }
        else{
            $("<option value='"+array[i].id+"'>"+array[i].nombre+"</option>").appendTo(select);
        }
    }
}
