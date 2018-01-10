function loadControllers(){
    loadAdministradores();
    $("#agregar").click(function(){

        agregarAdministrador()
    });
    $("#btnCancelar").click(function(){
        $("#idEliminar").val("");
        $("#correoEliminar").html("");
    });
    $("#btnEliminar").click(function(){
        eliminarAdministrador($("#idEliminar").val());
    });
    $("#btnEditar").click(function(){
        var idEditar =  $("#idEditar").val();
        var editCorreoElectronico =  $("#editCorreoElectronico").val();
        var editPassword =  $("#editPassword").val();
        editarAdministrador(idEditar,editCorreoElectronico,editPassword);
    })
}
function editarAdministrador(idEditar,editCorreoElectronico,editPassword){
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

    xmlhttp.open("GET", "http://herbariodigital.xyz/AppWeb/assets/php/adminUsuarioController.php?action=edit&id="+idEditar+"&user="+editCorreoElectronico+"&password="+editPassword, true);
    xmlhttp.send();
}
function eliminarAdministrador(pId){
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

    xmlhttp.open("GET", "http://herbariodigital.xyz/AppWeb/assets/php/adminUsuarioController.php?action=delete&id="+pId, true);
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

        xmlhttp.open("GET", "http://herbariodigital.xyz/AppWeb/assets/php/adminUsuarioController.php?action=add&email="+correoElectronico+"&password="+password, true);
        xmlhttp.send();
    }

}

function loadAdministradores(){
    //$("#tablePagination").find("tr:gt(0)").remove();
    var xmlhttp = new XMLHttpRequest();
    xmlhttp.onreadystatechange = function() {
        if (this.readyState == 4 && this.status == 200) {
            jsonAns = JSON.parse(this.responseText); //usuarioID contrasena email
            if (jsonAns.status ="ok" ) {
                var rows = jsonAns.items;
                var tbodyAdmin = $("#tbodyAdmin");
                for (var i = 0; i < rows.length; i++) {
                    var tr = $("<tr></tr>");
                    var tdAccion = $("<td></td>");
                    var span1 = $("<span style='margin-right:10%;' ></span>");
                    var iTag1 = $("<i class='glyphicon glyphicon-pencil'></i> ");
                    var aTag1 = $("<a href='#' data-toggle='modal' class='editar' data-target='#modalEditar'> Editar </a>");
                    var inputHidden =$("<input type='hidden' value='"+rows[i].usuarioID+" "+rows[i].email+" "+rows[i].contrasena+"'></input>");
                    var span2 = $("<span></span>");
                    var iTag2 = $("<i class='glyphicon glyphicon-remove'></i> ");
                    var aTag2 = $("<a href='#' class='eliminar' data-toggle='modal' data-target='#modalEliminar'> Eliminar </a>");
                    var tdCorreo = $("<td>"+rows[i].email+"</td>");
                    span1.append(iTag1);
                    span1.append(aTag1);
                    span2.append(iTag2);
                    span2.append(aTag2);
                    tdAccion.append(span1);
                    tdAccion.append(span2);
                    tdAccion.append(inputHidden);
                    tr.append(tdAccion);
                    tr.append(tdCorreo);
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

    xmlhttp.open("GET", "http://herbariodigital.xyz/AppWeb/assets/php/adminUsuarioController.php?action=getAll", true);
    xmlhttp.send();
}
function cargarModalEditar(pinfo){
    var idEditar = pinfo.split(" ")[0]
    var editCorreoElectronico = pinfo.split(" ")[1];
    var editPassword = pinfo.split(" ")[2];
    $("#idEditar").val(idEditar);
    $("#editCorreoElectronico").val(editCorreoElectronico);
    $("#editPassword").val(editPassword);
}

function cargarModalDelete(pInfo){

    var idEliminar = pInfo.split(" ")[0];
    var correoEliminar = pInfo.split(" ")[1];
    $("#idEliminar").val(idEliminar);
    $("#correoEliminar").html(correoEliminar);

}
