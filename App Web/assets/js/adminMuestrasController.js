function loadControllers(){
    loadEspeciesAgregar();

    loadMuestras();
    $("#uploadimage").on('submit',(function(e) {
        e.preventDefault();
        $.ajax({
        url: "http://herbariodigital.xyz/AppWeb/assets/php/addMuestra.php", // Url to which the request is send
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

    $("#btnEliminar").click(function(){
        eliminarMuestra($("#idEliminar").val());
    });
    $("#btnEditar").click(function(){
        var idEditar = $("#idEditar").val();
        var Identificador = $("#IdentificadorEDITAR").val();
        var Colector = $("#ColectorEDITAR").val();
        var Ejecutivo = $("#EjecutivoEDITAR").val();
        var Fuente = $("#FuenteEDITAR").val();
        var fecha = $("#fechaEDITAR").val();
        var Especie = $("#EspecieEDITAR").val();
        editarAdministrador(idEditar,Identificador,Colector,Ejecutivo,Fuente,fecha,Especie);
    });

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
		            $('#img-upload').attr('src', e.target.result);
		        }

		        reader.readAsDataURL(input.files[0]);
		    }
		}

		$("#imgInp").change(function(){
		    readURL(this);
		});
}

function loadEspeciesAgregar(){
    var xmlhttp = new XMLHttpRequest();
    xmlhttp.onreadystatechange = function() {
        if (this.readyState == 4 && this.status == 200) {
            jsonAns = JSON.parse(this.responseText);
            if (jsonAns.status ="ok" ) {
                $('#Especie').html('');
                for (var i = 0; i < jsonAns.items.length; i++) {
                        $("#Especie").append("<option value='"+jsonAns.items[i].id+"'>"+jsonAns.items[i].nombre+"</option>");
                }
            }
            else{
                alert("Algo salió mal. Reintente más tarde.");
            }
        }
    };

    xmlhttp.open("GET", "http://herbariodigital.xyz/AppWeb/assets/php/adminMuestrasController.php?action=getEspecies", true);
    xmlhttp.send();
}
function editarAdministrador(idEditar,Identificador,Colector,Ejecutivo,Fuente,fecha,Especie){
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

    xmlhttp.open("GET", "http://herbariodigital.xyz/AppWeb/assets/php/adminMuestrasController.php?action=edit&id="+idEditar+"&Identificador="+Identificador+"&Colector="+Colector+"&Ejecutivo="+Ejecutivo+"&Fuente="+Fuente+"&fecha="+fecha+"&Especie="+Especie, true);
    xmlhttp.send();
}
function eliminarMuestra(pId){
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

    xmlhttp.open("GET", "http://herbariodigital.xyz/AppWeb/assets/php/adminMuestrasController.php?action=delete&id="+pId, true);
    xmlhttp.send();
}
function agregarMuestra(){
    var Identificador = $("#Identificador").val();
    var Colector = $("#Colector").val();
    var Ejecutivo = $("#Ejecutivo").val();
    var imagen = $("#imagen").val();
    var Fuente = $("#Fuente").val();
    var fecha = $("#fecha").val();
    var Especie = $("#Especie").val();

    /*
    Identificador
    Colector
    Ejecutivo
    Fuente
    fecha
    Especie
    imgInp
    */


}

function loadMuestras(){

    var xmlhttp = new XMLHttpRequest();
    xmlhttp.onreadystatechange = function() {
        if (this.readyState == 4 && this.status == 200) {
            jsonAns = JSON.parse(this.responseText); ////muestraID	nombreIdentificador	nombreColector	fuente	fecha	imagenURL nombreCientifico	ejecutivo
            if (jsonAns.status ="ok" ) {
                var rows = jsonAns.items;
                var tbodyAdmin = $("#tbodyAdmin");
                for (var i = 0; i < rows.length; i++) {
                    var tr = $("<tr></tr>");
                    var tdAccion = $("<td></td>");
                    var span1 = $("<span style='margin-right:10%;' ></span>");
                    var iTag1 = $("<i class='glyphicon glyphicon-pencil'></i> ");
                    var aTag1 = $("<a href='#' data-toggle='modal' class='editar' data-target='#modalEditar'> Editar </a>");
                    var inputHidden =$("<input type='hidden' value='"+rows[i].muestraID+"~"+rows[i].nombreIdentificador+"~"+rows[i].nombreColector+"~"+rows[i].fuente+"~"+rows[i].fecha+"~"+rows[i].imagenURL+"~"+rows[i].nombreCientifico+"~"+rows[i].ejecutivo+"'></input>");
                    var span2 = $("<span></span>");
                    var iTag2 = $("<i class='glyphicon glyphicon-remove'></i> ");
                    var aTag2 = $("<a href='#' class='eliminar' data-toggle='modal' data-target='#modalEliminar'> Eliminar </a>");
                    var Ejecutivo = $("<td>"+rows[i].ejecutivo+"</td>");
                    tr.append(tdAccion);
                    tr.append(Ejecutivo);
                    var Recolector = $("<td>"+rows[i].nombreColector+"</td>");
                    tr.append(Recolector);
                    var Identificador = $("<td>"+rows[i].nombreIdentificador+"</td>");
                    tr.append(Identificador);
                    var Fuente = $("<td>"+rows[i].fuente+"</td>");
                    tr.append(Fuente);
                    var Fecha= $("<td>"+rows[i].fecha+"</td>");
                    tr.append(Fecha);
                    var Imagen = $("<td><img class='img-circle' src='"+rows[i].imagenURL+"' width='50' height='50'></td>");
                    tr.append(Imagen);
                    span1.append(iTag1);
                    span1.append(aTag1);
                    span2.append(iTag2);
                    span2.append(aTag2);
                    tdAccion.append(span1);
                    tdAccion.append(span2);
                    tdAccion.append(inputHidden);

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

    xmlhttp.open("GET", "http://herbariodigital.xyz/AppWeb/assets/php/adminMuestrasController.php?action=getAll", true);
    xmlhttp.send();
}
function cargarModalEditar(pinfo){
    pinfo = pinfo.split("~");
    var muestraID = pinfo[0];
    var nombreIdentificador = pinfo[1];
    var nombreColector = pinfo[2];
    var fuente = pinfo[3];
    var fecha = pinfo[4];
    var imagenURL = pinfo[5];
    var nombreCientifico = pinfo[6];
    var ejecutivo = pinfo[7];

    var xmlhttp = new XMLHttpRequest();
    xmlhttp.onreadystatechange = function() {
        if (this.readyState == 4 && this.status == 200) {
            $("#idEditar").val(muestraID);
            $("#IdentificadorEDITAR").val(nombreIdentificador);
            $("#ColectorEDITAR").val(nombreColector);
            $("#EjecutivoEDITAR").val(ejecutivo);
            $("#FuenteEDITAR").val(fuente);
            $("#fechaEDITAR").val(fecha);
            jsonAns = JSON.parse(this.responseText);
            if (jsonAns.status ="ok" ) {
                $('#EspecieEDITAR').html('');
                for (var i = 0; i < jsonAns.items.length; i++) {
                    if (jsonAns.items[i].nombre == nombreCientifico) {
                        $("#EspecieEDITAR").append("<option value='"+jsonAns.items[i].id+"' selected='true'>"+jsonAns.items[i].nombre+"</option>");
                    }
                    else{
                        $("#EspecieEDITAR").append("<option value='"+jsonAns.items[i].id+"'>"+jsonAns.items[i].nombre+"</option>");
                    }
                }
            }
            else{
                $('#modalEditar').modal('hide');
                alert("Algo salió mal. Reintente más tarde.");
            }
        }
    };

    xmlhttp.open("GET", "http://herbariodigital.xyz/AppWeb/assets/php/adminMuestrasController.php?action=getEspecies", true);
    xmlhttp.send();

    /*






    */
}

function cargarModalDelete(pInfo){
    pInfo =  pInfo.split("~");
    var idEliminar = pInfo[0];
    var correoEliminar = pInfo[7];
    $("#idEliminar").val(idEliminar);
    $("#ejecutivoEliminar").html(correoEliminar);

}
