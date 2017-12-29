
var speed = 15;

function showImage(){
    var div = document.getElementById("divImage");
    /*with (div.style){
        width = "300px";
        height = "300px";
        border = "2px solid black";
        textAlign = "center";
        overflow = "scroll";
    }*/
    //document.body.appendChild(div);
    img = document.getElementById("imagenZoom");
    img.width = 270;
    img.height = 300;
    div.appendChild(img);
}

function zoomMenos(){
    k = -speed;
    if(img.width >=300){
        img.width = img.width+k;
        img.height = img.height+k;
       img.style.margin = ((300 -img.height) / 2).toString()+"px";
       }

}
function zoomMas(){
    k = speed;

        img.width = img.width+k;
        img.height = img.height+k;
        img.style.margin = ((300 -img.height) / 2).toString()+"px";

}

var timeoutZoomMas,zoomMasButton = $('#zoomMas');
zoomMasButton.mousedown(function(){
    timeoutZoomMas = setInterval(function(){
        zoomMas();
    }, 80);

    return false;
});
$(document).mouseup(function(){
    clearInterval(timeoutZoomMas);
    return false;
});


var timeoutZoomMenos,zoomMenosButton = $('#zoomMenos');
zoomMenosButton.mousedown(function(){
    timeoutZoomMenos = setInterval(function(){
        zoomMenos();
    }, 80);

    return false;
});
$(document).mouseup(function(){
    clearInterval(timeoutZoomMenos);
    return false;
});
