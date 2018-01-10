$("#btnLogin").click(function(){
    var email = $("#email").val();
    var password = $("#password").val();
    loguearUsuario(email,password);
});

function loguearUsuario(pEmail,pPassword){
    var xmlhttp = new XMLHttpRequest();
    xmlhttp.onreadystatechange = function() {
        if (this.readyState == 4 && this.status == 200) {
            jsonAns = JSON.parse(this.responseText);
            if (jsonAns.result == "logged" ) {
            //    $('#modalEliminar').modal('hide');
                  location.href="http://herbariodigital.xyz/AppWeb/adminEspecies.html";
            }
            else{

                alert("El correo electrónico o la contraseña son incorrectos. Reintente");
            }
        }
    };

    xmlhttp.open("GET", "http://herbariodigital.xyz/AppWeb/assets/php/adminUsuarioController.php?action=loguear&user="+pEmail+"&password="+pPassword, true);
    xmlhttp.send();
}
