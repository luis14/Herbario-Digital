
    $("#submitButton").click(function(e) {
        var u = $("#username").val();
        var p = $("#password").val();

        p = p.replace(/\s/g, ""); 
        u = u.replace(/\s/g, "");


        if (u == '' && p == ''){
            var texto = 'Llene los campos';
        }
        
        if (u == '' && texto == null){
            var texto = 'Campo usuario vacío';
        }


        if (!ValidateEmail(u) && texto == null){
            var texto = 'Email no admisible'
        }

        if (p == '' && texto == null){
            var texto = 'Campo contraseña vacío';
        }
        

        if (texto != null){
            alert(texto);
            return false;

        }  else {

        $.ajax({
        url: "http://www.herbariodigital.xyz/AppMovil/php/existencia.php",
        type: "post", 
        data: {  
            username: u, 
        },
        success: function(response) {
            if (response == 0){
                alert('Correo inexistente');
                return false;
            } else {
                $.ajax({
                  url: "http://www.herbariodigital.xyz/AppMovil/php/Login.php",
                  type: "post", //send it through get method
                  data: {  
                    username: u, 
                    password: p,
                  },
                  success: function(response) {
                    if (response == -1){
                        alert("Contrasena o correo invalidos");
                        return false
                    } else {
                        window.location.replace("registro/registro.html");

                    }
                  },
                  error: function(xhr) {
                    alert('Bad action at 404');
                  }
                });
            }
        },
        error: function(xhr) {
            alert(xhr);
            return false;
        }
    });

    }
});

    function ValidateEmail(mail){  
        if (/^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/.test(mail))  {  
        return (true);  
    }   
    return (false); 
}  





