
    $("#submitButton").click(function(e) {
        alert("1");
        $("#submitButton").attr("disabled","disabled");
        
        var u = $("#username").val();
        var p = $("#password").val();

        p = p.replace(/\s/g, ""); 
        u = u.replace(/\s/g, "");
        
        alert(2);

        if(u != '' && p!= '') {
            alert(u + p);
            $.post("http://www.herbariodigital.xyz/AppMovil/php/Registrar.php", {username:u,password:p}, function(res) {
                if(res == true) {
                    //$.mobile.changePage("registro.html");
                    alert(res);
                } else {
                    alert("Your login failed", function() {});
                }
                $("#submitButton").removeAttr("disabled");
            },"json");
        }
        alert("Vacio")
        return false;
    });




