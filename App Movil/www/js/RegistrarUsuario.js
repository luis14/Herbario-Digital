
    $("#registrar").click(function(e) {
        alert("1");
        $("#registrarbtn").attr("disabled", "disabled");

        var nombre = $("#nombre").val();
        var apellido1 = $("#papellido").val();
        var apellido2 = $("#sapellido").val();
        var email = $("#email").val();
        var contrasena = $("#contrasena").val();
        var confirmacion = $("#confirmacion").val();

        nombre = nombre.replace(/\s/g, "");
        apellido1 = apellido1.replace(/\s/g, "");
        apellido2 = apellido2.replace(/\s/g, "");
        email = email.replace(/\s/g, "");
        contrasena = contrasena.replace(/\s/g, "");
        confirmacion = confirmacion.replace(/\s/g, "");


        alert(2);


        if (nombre != '' && apellido1 != ''  && apellido2 != '' && email != '' && contrasena != '' && confirmacion != '') {
            $.post("http://www.herbariodigital.xyz/AppMovil/php/Registrar.php", { username: email, password: contrasena }, function (res) {
                if (res == true) {
                    //$.mobile.changePage("registro.html");
                    alert(res+"aqui");
                } else {
                    alert("Fallo al registrar", function () { });
                }
                $("#registrarbtn").removeAttr("disabled");
            }, "json");
        }
        else{
            alert("Vacio")
            return false;
        }
    });