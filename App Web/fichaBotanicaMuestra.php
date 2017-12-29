<!DOCTYPE html>
<html>
<?php

include_once("assets/php/cargarFichaBotanicaMuestra.php");
    //array_push( $array,'id' => $row['id'], 'nombreComun'=> $row['nombreComun'], 'nombreCientifico'=> $row['nombreCientifico'], 'descripcion'=> $row['descripcion'], 'nombreFamilia'=> $row['nombreFamilia'], 'nombreGenero'=> $row['nombreGenero']);

    // echo $array['id'];
?>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Proyecto Herbario Digital</title>
    <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="assets/fonts/font-awesome.min.css">
    <link rel="stylesheet" href="assets/fonts/ionicons.min.css">
    <link rel="stylesheet" href="assets/css/Article-List.css">
    <link rel="stylesheet" href="assets/css/imageList.css">
    <link rel="stylesheet" href="assets/css/Map-Clean.css">
    <link rel="stylesheet" href="assets/css/Navbar-Chunky.css">
    <link rel="stylesheet" href="assets/css/styles.css">
</head>

<body >
    <input type="hidden" id="especieID" value=<?php echo "'".$_GET['id']."'";?>/>
    <nav class="navbar navbar-default">
        <div class="container-fluid">
            <div class="navbar-header"><a class="navbar-brand navbar-link" href="#">Brand</a>
                <button class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navcol-1"><span class="sr-only">Toggle navigation</span><span class="icon-bar"></span><span class="icon-bar"></span><span class="icon-bar"></span></button>
            </div>
            <div class="collapse navbar-collapse" id="navcol-1">
                <ul class="nav navbar-nav navbar-right">
                    <li class="active"  role="presentation"><a href="busquedaMuestra.html">Muestras </a></li>
                    <li role="presentation"><a href="especies.html">Especies </a></li>
                    <li role="presentation"><a href="glosario.html">Glosario </a></li>
                    <li role="presentation"><a href="contratacion.html">Contratación </a></li>
                </ul>
            </div>
        </div>
    </nav>
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-12">
                <ol class="breadcrumb" style="border-bottom-width:1px;">
                    <li><a><span>Muestras </span></a></li>
                    <li><a><span>Ficha botánica</span></a></li>
                </ol>
            </div>
        </div>
    </div>
    <div>
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
                    <h4 class="text-left"><?php echo $array['nombreCientifico']; ?></h4>
                    <div class="table-responsive">
                        <table class="table table-no-border">
                            <thead>
                                <tr>
                                    <th>Clasificación </th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>Familia </td>
                                    <td><?php echo $array['nombreFamilia']; ?></td>
                                </tr>
                                <tr>
                                    <td>Género </td>
                                    <td><?php echo $array['nombreGenero']; ?> </td>
                                </tr>
                                <tr>
                                    <td>Nombre científico</td>
                                    <td><?php echo $array['nombreCientifico']; ?></td>
                                </tr>
                                <tr>
                                    <td>Nombre común</td>
                                    <td><?php echo $array['nombreComun']; ?></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    <div class="table-responsive">
                        <table class="table table-no-border">
                            <thead>
                                <tr>
                                    <th>Descripción </th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td> <?php echo $array['descripcion']; ?> </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
                <div class="col-lg-8 col-md-8 col-sm-12 col-xs-12">
                    <div>
                        <ul class="nav nav-tabs">
                            <li><a href="#tab-2" role="tab" data-toggle="tab">Muestras </a></li>
                            <li class="active" ><a href="#tab-1" role="tab" data-toggle="tab">Características </a></li>
                        </ul>
                        <div class="tab-content" style="border-width:1px;border-color: #dddddd;border-bottom-style: solid;border-left-style: solid;border-right-style: solid;">
                            <div class="tab-pane active" role="tabpanel" id="tab-1">
                                <div class="row">
                                    <div class="col-md-12">
                                        <br/>
<br/>
                                    </div>
                                    <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
                                        <?php
                                            if($listaCaracteristicas){
                                                foreach ($listaCaracteristicas as $caracteristica) {
                                                    # code...

                                                    echo "<div class='row margin-down'>
                                                        <div class='col-lg-4 col-md-4 col-sm-3 col-xs-3'><img class='img-responsive' src='".$caracteristica['imagenURL']."' width='60' style='margin-left:3px;'></div>
                                                        <div class='col-lg-8 col-md-8 col-sm-9 col-xs-9'>
                                                            <div class='row'>
                                                                <div class='col-md-12'>
                                                                    <h4 class='text-nowrap' style='margin:0px;'>".$caracteristica['nombre']."</h4></div>
                                                            </div>
                                                            <div class='row'>
                                                                <div class='col-md-12'><em>".$caracteristica['resumen']."</em></div>
                                                            </div>
                                                        </div>
                                                    </div>";
                                                }
                                            }else{
                                                    echo "<div class='col-lg-12 col-md-12 col-sm-12 col-xs-12'><h2 class='text-center' style='margin-bottom:20%;'>No hay características registradas</h2></div>";
                                            }
                                        ?>
                                    </div>
                                    <div class="col-lg-8 col-md-8 col-sm-12 col-xs-12">
                                        <div class="row">
                                            <div class="col-md-12">
                                                <h5>Fotografías de muestra verde</h5></div>
                                        </div>
                                        <div class="row">
                                            <?php
                                                if($muestrasVerdes){
                                                    $counter = 0;
                                                    foreach ($muestrasVerdes as $muestraVerde) {

                                                        echo "<div class='col-lg-3 col-md-3 col-sm-3 col-xs-3' style='margin-bottom:5%;'>
                                                            <img class='img-responsive' src='".$muestraVerde['imagenURL']."'/></div>";
                                                    }
                                                }else{
                                                        echo "<div class='col-lg-12 col-md-12 col-sm-12 col-xs-12'><h2 class='text-center' style='margin-bottom:20%;'>No hay muestras verdes registradas</h2></div>";
                                                }
                                            ?>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-12">
                                                <h5>Mapa de distribución</h5></div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-12">
                                                <div id="map"></div>



                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="tab-pane" role="tabpanel" id="tab-2">
                                <div class="row">
                                    <div class="col-md-12">
                                        <!--<div class="dropdown pull-right" style="margin-top:10px;">
                                             <button class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-expanded="false" type="button" style="margin-bottom:5px;">Ordenar por <span class="caret"></span></button>
                                            <ul class="dropdown-menu" role="menu">
                                                <li role="presentation"><a href="#">First Item</a></li>
                                                <li role="presentation"><a href="#">Second Item</a></li>
                                                <li role="presentation"><a href="#">Third Item</a></li>
                                            </ul>
                                        </div>-->
                                    </div>
                                </div>
                                <div class="row">
                                    <?php
                                    if ($muestras) {
                                        foreach ($muestras as $muestra) {
                                            echo "<div id='".$muestra['muestraID']."'class='col-lg-4 col-md-4 col-sm-6 col-xs-6 item' data-toggle='modal' data-target='#muestra'><img class='img-responsive' src='".$muestra['imagen']."'>
                                                <h5 class='text-center'> <i class='glyphicon glyphicon-file'></i>".$muestra['ejecutivo']." | <i class='glyphicon glyphicon-calendar'></i>".$muestra['fecha']."</h5></div>";
                                        }
                                    }else {
                                        echo "<div class='col-lg-12 col-md-12 col-sm-12 col-xs-12'><h2 class='text-center' style='margin-bottom:20%;'>No hay muestras registradas</h2></div>";
                                    }



                                    ?>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="modal fade" role="dialog" tabindex="-1" id="muestra">
    <div class="modal-dialog modal-lg" role="document" id="modalXL">
    <div class="modal-content">
    <div class="modal-header">
    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
    <h4 class="modal-title" id="tituloModal"> </h4></div>
    <div class="modal-body">

    <div class="row">
    <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12" id="contain1" style="textAlign:center;overflow:scroll;">
        <div class= "row">
            <div class= "col-lg-12 col-md-12 col-sm-12 col-xs-12 " id="divImage" style="textAlign:center;overflow:scroll;">
                <img class="img-responsive" id="panzoom1" src="assets/img/WhatsApp Image 2017-12-06 at 8.45.50 PM.jpeg" >
            </div>
            <div class= "col-lg-12 col-md-12 col-sm-12 col-xs-12">
                <button class="btn btn-default btn-sm pull-left" id="zoom-out1"  type="button"> <i class="glyphicon glyphicon-minus"></i></button>
                <button class="btn btn-default btn-sm pull-right" id="zoom-in1" type="button" > <i class="glyphicon glyphicon-plus"></i></button>
            </div>
        </div>
    </div>
    <div class="col-lg-8 col-md-8 col-sm-12 col-xs-12">
    <div class="row">
    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
    <div class="table-responsive">
        <table class="table table-no-border">
            <thead>
                <tr>
                    <th>Datos de la muestra</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>Colector (a)</td>
                    <td id="colector"></td>
                </tr>
                <tr>
                    <td>Identificador (a)</td>
                    <td id="identificador"></td>
                </tr>
                <tr>
                    <td>Fuente de la muestra</td>
                    <td id="fuente"></td>
                </tr>
                <tr>
                    <td>Fecha de recolección</td>
                    <td id="fecha"></td>
                </tr>
            </tbody>
        </table>
    </div>
    </div>
    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
    <h4>Descarga de la muestra</h4></div>
    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
    <div class="btn-group btn-group-sm" role="group">
        <button class="btn btn-default" type="button"><i class="glyphicon glyphicon-download-alt"></i> Alta resolución</button>
        <button class="btn btn-default" type="button" style="margin-left:3px;"><em> </em><i class="glyphicon glyphicon-download-alt"></i> Baja resolución </button>
    </div>
    </div>
    </div>
    </div>
    </div>
    </div>
    <div class="modal-footer">
    <button class="btn btn-default" type="button" data-dismiss="modal">Cerrar</button>
    </div>
    </div>
    </div>
    </div>
    <script src="assets/js/jquery.min.js"></script>
    <script src="assets/js/jquery.panzoom.js"></script>
    <script src="assets/js/mapController.js"></script>
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAmuk3onNrslpzRdayt2bzUUSsj3bjCFTM&callback=initMap"></script>
    <script src="assets/bootstrap/js/bootstrap.min.js"></script>
    <script src="assets/js/imageController.js"></script>
    <script src="assets/js/modalMuestraController.js"></script>
    <script>
        (function() {
        var $section = $('#contain1');
        $section.find('#panzoom1').panzoom({
          $zoomIn: $section.find("#zoom-in1"),
          $zoomOut: $section.find("#zoom-out1"),
          startTransform: 'scale(1.1)',
          increment: 0.1,
          minScale: 1,
          contain: 'invert'
        }).panzoom('zoom');
      })();
    </script>
</body>

</html>
