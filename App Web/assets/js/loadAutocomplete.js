
    /*888888888*/
    var arrNombres = [];
    var arrIDS = [];
    var input = document.getElementById('value');
    var optionsVal = document.getElementById('list');
    //var buttonSubmit = document.getElementById('buttonSubmit');
    var escogioPacienteDeLista = false;
    //window.addEventListener("load",cargarEspecies)

    input.addEventListener('keyup', show);
    optionsVal.onclick = function(){
        escogioPacienteDeLista = true;
        setVal(this);
    //    verificarSiTienePaquete(this.options[this.selectedIndex].value);
    };

    function verificarSiTienePaquete(idPaciente){
      var xmlhttp = new XMLHttpRequest();
      xmlhttp.onreadystatechange = function() {
        if (this.readyState == 4 && this.status == 200) {
          console.log(this.responseText);
          var array = JSON.parse(this.responseText);
          var smallText = document.getElementById('textInfoPaciente');
          if (array.puedeAgendarCita == false) {
            smallText.style.color = '#f42727';
            smallText.style.display = 'block';
            smallText.innerHTML = array.msj;
          }
          if (array.puedeAgendarCita == true) {
            var inputPaqueteID = document.getElementById('paquetePagadoId');
            smallText.style.color = '#28d631';
            smallText.style.display = 'block';
            smallText.innerHTML = array.msj;
            inputPaqueteID.value = array.paquetePagadoId;

          }

        }
      };
      xmlhttp.open("GET", "../php/verificarSiTienePaquete.php?paciente_id=" + idPaciente, true);
      xmlhttp.send();
    }

    function cargarEspecies(){
        var criterioBusqueda = document.getElementById('criterioBusqueda').value;
        input.value = "";
        input.disabled = true;
        var xmlhttp = new XMLHttpRequest();
        xmlhttp.onreadystatechange = function() {
            if (this.readyState == 4 && this.status == 200) {
                myArr = JSON.parse(this.responseText);
                if (myArr.length > 0 ) {
                  arrNombres = [];
                  arrIDS = [];
                  for (var i = 0; i < myArr.length; i++) {
                    arrNombres.push(myArr[i].nombre);
                    arrIDS.push(myArr[i].id);
                    }
                }
                input.disabled = false;
            }
        };

        xmlhttp.open("GET", "http://herbariodigital.xyz/AppWeb/assets/php/getListaEspecies.php?criterioBusqueda="+criterioBusqueda, true);
        xmlhttp.send();
    }
    function show(){
        var dropdown = document.getElementById('dropdown');
        var optionsVal = document.getElementById('list');
        var smallText = document.getElementById('textInfoPaciente');
        dropdown.style.display = 'none';
        //buttonSubmit.disabled = true;
        if (arrNombres.length > 0 ) {
            for (var i = 0; i < arrNombres.length; i++) {
                while (optionsVal.firstChild) {
                    optionsVal.removeChild( optionsVal.firstChild );
                }
                if(input.value){
                   var textNombre = input.value;
                   var testableRegExp = new RegExp(RegExp.escape(textNombre),"i");
                   for(var i = 0; i < arrNombres.length; i++){
                       if (String(arrNombres[i]).match(testableRegExp)){
                         dropdown.style.display = 'block';
                         optionsVal.style.display = 'block';
                         addValue(arrNombres[i],arrIDS[i]);
                       }
                   }
                }
            }

         }
    }
    //Use this function to replace potential characters that could break the regex
RegExp.escape= function(s) {
    return s.replace(/[-\/\\^$*+?.()|[\]{}]/g, '\\$&');
};


    function addValue(text,val){
        var createOptions = document.createElement('option');
        optionsVal.appendChild(createOptions);
        createOptions.text = text;
        createOptions.value = val;
        if (optionsVal.options.length<10) {
          optionsVal.size = optionsVal.options.length;
        }
        else{
          optionsVal.size =8;
        }
    }


    //Settin the value in the box by firing the click event
    function setVal(selectedVal){
        input.value = selectedVal.options[selectedVal.selectedIndex].text;
    //    buttonSubmit.disabled = false;
        document.getElementById('dropdown').style.display='none';
        window.location.replace("http://herbariodigital.xyz/AppWeb/fichaBotanicaMuestra.php?id="+selectedVal.options[selectedVal.selectedIndex].value);
    }
