
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

        if (apellido1 == '' && texto == null){
        	var texto = 'Campo \'Apellido\' vacio'
        }

        if (email == '' && texto == null){
        	var texto = 'Campo \'Email\' vacio'
        }

        if (contrasena == '' && texto == null){
        	var texto = 'Campo \'Contraseña\' vacio'
        }

        if (contrasena.length < 6 && texto == null){
        	var texto = 'Contraseña de 6 caracteres mínimo'
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
                    window.location.replace("registro/registro.html");
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