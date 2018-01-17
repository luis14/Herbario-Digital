
    $("#registrar").click(function(e) {

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


        if (nombre == '' && apellido1 == ''  && apellido2 == '' && email == '' && contrasena == '' && confirmacion == '') {
        	var texto = 'Llene los campos';
        }

        if (nombre == '' && texto == null){
        	var texto = 'Campo \'Nombre\' vacio'
        }

        if (nombre.length < 2){
            var texto = 'Campo \'Nombre\' muy corto'
        }

        if (nombre.length > 25){
            var texto = 'Campo \'Nombre\' muy largo'
        }

        if (apellido1 == '' && texto == null){
        	var texto = 'Campo \'Primer Apellido\' vacio'
        }

        if (apellido1.length < 2){
            var texto = 'Campo \'Primer Apellido\' muy corto'
        }

        if (apellido1.length > 25){
            var texto = 'Campo \'Primer Apellido\' muy largo'
        }

        if (email == '' && texto == null){
        	var texto = 'Campo \'Email\' vacio'
        }

        if (email.length > 45){
            var texto = 'Campo \'Email\' muy largo'
        }

        if (contrasena == '' && texto == null){
        	var texto = 'Campo \'Contraseña\' vacio'
        }

        if (contrasena.length < 6 && texto == null){
        	var texto = 'Contraseña de 6 caracteres mínimo'
        }

        if (contrasena.length > 45){
            var texto = 'Campo \'Contraseña\' muy largo'
        }

        if (confirmacion == '' && texto == null){
        	var texto = 'Campo \'Contraseña\' vacio'
        }

        if (confirmacion != contrasena){
        	var texto = 'Contraseñas no coinciden'
        }

        if (!ValidateEmail(email) && texto == null){
        	var texto = 'Email no admisible'
        }

        if (texto != null){
        	alert (texto);
        	return false;

    	} else {

            $.ajax({
            url: "http://www.herbariodigital.xyz/AppMovil/php/existencia.php",
            type: "post", 
            data: {  
                username: email,
            },
            success: function(response) {
                if (response != 0){
                    alert('Correo ya esta registrado');
                    return false;
                } else {

                $.ajax({
                  url: "http://www.herbariodigital.xyz/AppMovil/php/registrar.php",
                  type: "post", //send it through get method
                  data: {  
                     nombre: nombre,
                     papellido: apellido1,
                     sapellido: apellido2,
                     email: email,
                     contrasena: contrasena,
                  },
                  success: function(response) {
                  	alert('Registro Exitoso');
                    window.location.replace("index.html");
                  },
                  error: function(xhr) {
                    alert('Error al registrar')
                  }
                });

                }
            }
        });
    }
});






function ValidateEmail(mail){  
	if (/^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/.test(mail))  {  
    	return (true)  
  	}   
    return (false)  
}  