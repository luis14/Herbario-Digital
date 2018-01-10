function loadControllers(){
    loadItems();
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
$(function() {
    // Multiple images preview in browser
    var imagesPreview = function(input, placeToInsertImagePreview) {

        if (input.files) {
            var filesAmount = input.files.length;
            var row = $("<div class='row' style='margin-top:10px;'></div>");
            row.appendTo(placeToInsertImagePreview);
            for (i = 0; i < filesAmount; i++) {
                var reader = new FileReader();
                reader.onload = function(event) {
                    var col = $("<div class='col-lg-3 col-md-3 col-sm-4 col-xs-4' style='margin-bottom:5px;'></div>");
                    $($.parseHTML('<img class="img img-responsive" height="100px" width="100px">')).attr('src', event.target.result).appendTo(col);
                row.append(col);
                }


                reader.readAsDataURL(input.files[i]);
            }
        }

    };

    $("#imgTip").change(function(){
        imagesPreview(this,"div.imagenTipos");
    });
    $("#imgEj").change(function(){
        imagesPreview(this,"div.imagenEjemplos");
    });
});


    $("#btnEliminar").click(function(){
        eliminarItem($("#idEliminar").val());
    });
    $("#btnEditar").click(function(){
        var idEditar =  $("#idEditar").val();
        var nombreEditar =  $("#nombreEditar").val();
        var definicionEditar =  $("#definicionEditar").val();

        editarItem(idEditar,nombreEditar,definicionEditar);
    })
}
function editarItem(idEditar,nombreEditar,definicionEditar){
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

    xmlhttp.open("GET", "http://herbariodigital.xyz/AppWeb/assets/php/adminGlosarioController.php?action=edit&id="+idEditar+"&nombre="+nombreEditar+"&definicion="+definicionEditar, true);
    xmlhttp.send();
}
function eliminarItem(pId){
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

    xmlhttp.open("GET", "http://herbariodigital.xyz/AppWeb/assets/php/adminGlosarioController.php?action=delete&id="+pId, true);
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

        xmlhttp.open("GET", "http://herbariodigital.xyz/AppWeb/assets/php/adminGlosarioController.php?action=add&email="+correoElectronico+"&password="+password, true);
        xmlhttp.send();
    }

}

function loadItems(){
    //$("#tablePagination").find("tr:gt(0)").remove();
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
                    var span1 = $("<span style='margin-right:10%;' ></span><br>");
                    var iTag1 = $("<i class='glyphicon glyphicon-pencil'></i> ");
                    var aTag1 = $("<a href='#' data-toggle='modal' class='editar' data-target='#modalEditar'> Editar </a>");
                    var inputHidden =$("<input type='hidden' value='"+rows[i].id+"~"+rows[i].nombre+"~"+rows[i].definicion+"'></input>");
                    var span2 = $("<span></span>");
                    var iTag2 = $("<i class='glyphicon glyphicon-remove'></i> ");
                    var aTag2 = $("<a href='#' class='eliminar' data-toggle='modal' data-target='#modalEliminar'> Eliminar </a>");
                    var tdCorreo = $("<td>"+rows[i].nombre+"</td>");
                    var tdDefinicion = $("<td>"+rows[i].definicion+"</td>");
                    span1.append(iTag1);
                    span1.append(aTag1);
                    span2.append(iTag2);
                    span2.append(aTag2);
                    tdAccion.append(span1);
                    tdAccion.append(span2);
                    tdAccion.append(inputHidden);
                    tr.append(tdAccion);
                    tr.append(tdCorreo);
                    tr.append(tdDefinicion);
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

    xmlhttp.open("GET", "http://herbariodigital.xyz/AppWeb/assets/php/adminGlosarioController.php?action=getAll", true);
    xmlhttp.send();
}
function cargarModalEditar(pinfo){
    var idEditar = pinfo.split("~")[0]
    var editNombre = pinfo.split("~")[1];
    var editDefinicion = pinfo.split("~")[2];
    $("#idEditar").val(idEditar);
    $("#nombreEditar").val(editNombre);
    $("#definicionEditar").val(editDefinicion);
}

function cargarModalDelete(pInfo){
    var idEliminar = pInfo.split("~")[0];
    var itemEliminar = pInfo.split("~")[1];
    $("#idEliminar").val(idEliminar);
    $("#itemEliminar").html(itemEliminar);

}
