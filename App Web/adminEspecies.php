<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Proyecto Herbario Digital</title>
    <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="assets/fonts/font-awesome.min.css">
    <link rel="stylesheet" href="assets/fonts/ionicons.min.css">
    <link rel="stylesheet" href="assets/css/Article-List.css">
    <link rel="stylesheet" href="https://cdn.datatables.net/1.10.16/css/dataTables.bootstrap.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <link rel="stylesheet" href="assets/css/imageList.css">
    <link rel="stylesheet" href="assets/css/Login-Form-Clean.css">
    <link rel="stylesheet" href="assets/css/Map-Clean.css">
    <link rel="stylesheet" href="assets/css/Navbar-Chunky.css">
    <link rel="stylesheet" href="assets/css/styles.css">
</head>

<body onload="loadControllers()">
    <nav class="navbar navbar-default">
        <div class="container-fluid">
            <div class="navbar-header"><a class="navbar-brand navbar-link" href="#">Brand</a>
                <button class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navcol-1"><span class="sr-only">Toggle navigation</span><span class="icon-bar"></span><span class="icon-bar"></span><span class="icon-bar"></span></button>
            </div>
            <div class="collapse navbar-collapse" id="navcol-1">
                <?php
                session_start();
                if (!isset($_SESSION['email'] )) {
                    header("Location: http://herbariodigital.xyz/AppWeb/adminLogin.html");
                    die();
                }
                ?>
                <ul class="nav navbar-nav navbar-right">
                    <li class="active" role="presentation"><a href="adminEspecies.php"> Especies</a></li>
                    <li role="presentation"><a href="adminGlosario.php">Glosario </a></li>
                    <li role="presentation"><a href="adminMuestras.php">Muestras </a></li>
                    <li role="presentation"><a href="adminUsuario.php">Gestión de Usuarios </a></li>
                    <li role="presentation"><a href="http://herbariodigital.xyz/AppWeb/assets/php/killSession.php">Cerrar Sesión(<small> <?php echo $_SESSION['email'];?> </small>)</a></li>
                </ul>
            </div>
        </div>
    </nav>
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-12">
                <ol class="breadcrumb" style="border-bottom-width:1px;">
                    <li><a><span>Administrador de especies</span></a></li>
                </ol>
            </div>
        </div>
    </div>
    <div class="container-fluid">
        <button class="btn btn-primary pull-right" id="btnModalAgregar" type="button" data-toggle="modal" data-target="#modalAgregar"> <i class="glyphicon glyphicon-plus"></i> Agregar especie</button>
    </div>
    <div class="container-fluid">
        <div class="table-responsive table-striped table-bordered">
            <table class="table table-striped table-bordered" id="tablePagination">
                <thead>
                    <tr>
                        <th>Acciones </th>
                        <th>Nombre Común</th>
                        <th>Nombre Científico</th>
                        <th>Descripción </th>
                        <th>Imagen </th>
                    </tr>
                </thead>
                <tbody id="tbodyAdmin">
                </tbody>
            </table>
        </div>
    </div>
    <div class="modal fade" role="dialog" tabindex="-1" id="modalEliminar">
        <input type="hidden" id="idEliminar"></input>
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
                    <h4 class="modal-title">Eliminar especie</h4></div>
                <div class="modal-body">
                    <p>¿Seguro que desea eliminar la especie <strong id="itemEliminar"></strong>?</p>
                </div>
                <div class="modal-footer">
                    <button class="btn btn-default" type="button" data-dismiss="modal">Cancelar </button>
                    <button class="btn btn-danger" type="button" id="btnEliminar" >Eliminar </button>
                </div>
            </div>
        </div>
    </div>
    <div class="modal fade" role="dialog" tabindex="-1" id="modalEditar">
        <input type="hidden" id="idEditar"></input>
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
                    <h4 class="modal-title">Editar especie</h4></div>
                <div class="modal-body">
                    <form>
                        <div class="row">
                            <div class="col-lg-4 col-md-4 col-sm-6 col-xs-6">
                                <div class="form-group">
                                    <h5 for="nombreComun">Nombre común</h5>
                                    <input class="form-control" type="text" id="nombreComun">
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-4 col-sm-6 col-xs-6">
                                <div class="form-group">
                                    <h5 for="nombreCientifico">Nombre científico</h5>
                                    <input class="form-control" type="text" id="nombreCientifico">
                                </div>
                            </div>
                            <!--   <div class="col-lg-4 col-md-4 col-sm-6 col-xs-6">
                             <div class="form-group">
                                    <h5 for="imagen">Imagen </h5>
                                    <div class="row">
                                        <div class="col-lg-8 col-md-8 col-sm-8 col-xs-8">
                                            <input class="form-control" type="text" id="imagen">
                                        </div>
                                        <div class="col-lg-2 col-md-4 col-sm-4 col-xs-4">
                                            <button class="btn btn-link" type="button">cambiar </button>
                                        </div>
                                    </div>
                                </div>
                            </div> -->
                            <div class="col-lg-4 col-md-4 col-sm-6 col-xs-6">
                                <div class="form-group">
                                    <h5 for="pubescencia">Pubescencia </h5>
                                    <select class="form-control" id="pubescencia">

                                    </select>
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-4 col-sm-6 col-xs-6">
                                <div class="form-group">
                                    <h5 for="yemaFloral">Yema Floral</h5>
                                    <select class="form-control" id="yemaFloral">
                                    </select>
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-4 col-sm-6 col-xs-6">
                                <div class="form-group">
                                    <h5 for="procedencia">Procedencia </h5>
                                    <select class="form-control" id="procedencia">

                                    </select>
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-4 col-sm-6 col-xs-6">
                                <div class="form-group">
                                    <h5 for="genero">Género </h5>
                                    <select class="form-control" id="genero">

                                    </select>
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-4 col-sm-6 col-xs-6">
                                <div class="form-group">
                                    <h5 for="familia">Familia </h5>
                                    <select class="form-control" id="familia">

                                    </select>
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-4 col-sm-6 col-xs-6">
                                <div class="form-group">
                                    <h5 for="colorSavia">Color de savia</h5>
                                    <select class="form-control" id="colorSavia">

                                    </select>
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-4 col-sm-6 col-xs-6">
                                <div class="form-group">
                                    <h5 for="texturaSavia">Textura de savia</h5>
                                    <select class="form-control" id="texturaSavia">

                                    </select>
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-4 col-sm-6 col-xs-6">
                                <div class="form-group">
                                    <h5 for="texturaSavia">Forma de hoja</h5>
                                    <select class="form-control" id="formaHoja">

                                    </select>
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-4 col-sm-6 col-xs-6">
                                <div class="form-group">
                                    <h5 for="posicionHoja">Posición de hoja</h5>
                                    <select class="form-control" id="posicionHoja">

                                    </select>
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-4 col-sm-6 col-xs-6">
                                <div class="form-group">
                                    <h5 for="ubicacion">Ubicación </h5>
                                    <select class="form-control" id="ubicacion">

                                    </select>
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-4 col-sm-6 col-xs-6">
                                <div class="form-group">
                                    <h5 for="florColor">Color de flor</h5>
                                    <select class="form-control" id="florColor">

                                    </select>
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-4 col-sm-6 col-xs-6">
                                <div class="form-group">
                                    <h5 for="florSimetria">Simetría de flor</h5>
                                    <select class="form-control" id="florSimetria">

                                    </select>
                                </div>
                            </div>
                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                <div class="form-group">
                                    <h5 for="descripcion">Descripción </h5></div>
                                <textarea class="form-control input-lg" id="descripcion"></textarea>
                            </div>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button class="btn btn-default" type="button" data-dismiss="modal">Cancelar </button>
                    <button class="btn btn-primary" type="button" id="btnEditar">Guardar cambios</button>
                </div>
            </div>
        </div>
    </div>
    <div class="modal fade" role="dialog" tabindex="-1" id="modalAgregar">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
                    <h4 class="modal-title">Agregar especie <img class='img-circle' src='' id="img-top" width='50' height='50' hidden> </h4></div>
                <div class="modal-body">
                    <form id="uploadimage" action="" method="post" enctype="multipart/form-data">
                        <div class="row">
                            <div class="col-lg-4 col-md-4 col-sm-6 col-xs-6">
                                <div class="form-group">
                                    <h5 for="nombreComun">Nombre común</h5>
                                    <input class="form-control" type="text" id="nombreComunAgregar" name="nombreComunAgregar">
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-4 col-sm-6 col-xs-6">
                                <div class="form-group">
                                    <h5 for="nombreCientifico">Nombre científico</h5>
                                    <input class="form-control" type="text" id="nombreCientificoAgregar" name="nombreCientificoAgregar">
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-4 col-sm-6 col-xs-6">
                                <div class="form-group">
                                    <h5 for="imagen">Imagen </h5>
                                    <div class="input-group">
                                        <span class="input-group-btn">
                                            <span class="btn btn-default btn-file">
                                                Browse… <input type="file" id="imgInpAgregar" name="imgInpAgregar"  required>
                                            </span>

                                        </span>
                                        <input type="text" class="form-control" readonly>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-4 col-sm-6 col-xs-6">
                                <div class="form-group">
                                    <h5 for="pubescencia">Pubescencia </h5>
                                    <select class="form-control" id="pubescenciaAgregar" name="pubescenciaAgregar">
                                        <option value="sí" selected="">Sí</option>
                                        <option value="no">No</option>
                                    </select>
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-4 col-sm-6 col-xs-6">
                                <div class="form-group">
                                    <h5 for="yemaFloral">Yema Floral</h5>
                                    <select class="form-control" id="yemaFloralAgregar" name="yemaFloralAgregar">
                                        <option value="sí" selected="">Sí</option>
                                        <option value="no">No</option>
                                    </select>
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-4 col-sm-6 col-xs-6">
                                <div class="form-group">
                                    <h5 for="procedencia">Procedencia </h5>
                                    <select class="form-control" id="procedenciaAgregar" name="procedenciaAgregar">

                                    </select>
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-4 col-sm-6 col-xs-6">
                                <div class="form-group">
                                    <h5 for="genero">Género </h5>
                                    <select class="form-control" id="generoAgregar" name="generoAgregar">

                                    </select>
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-4 col-sm-6 col-xs-6">
                                <div class="form-group">
                                    <h5 for="familia">Familia </h5>
                                    <select class="form-control" id="familiaAgregar" name="familiaAgregar">

                                    </select>
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-4 col-sm-6 col-xs-6">
                                <div class="form-group">
                                    <h5 for="colorSavia">Color de savia</h5>
                                    <select class="form-control" id="colorSaviaAgregar" name="colorSaviaAgregar">

                                    </select>
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-4 col-sm-6 col-xs-6">
                                <div class="form-group">
                                    <h5 for="texturaSavia">Textura de savia</h5>
                                    <select class="form-control" id="texturaSaviaAgregar" name="texturaSaviaAgregar">

                                    </select>
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-4 col-sm-6 col-xs-6">
                                <div class="form-group">
                                    <h5 for="texturaSavia">Forma de hoja</h5>
                                    <select class="form-control" id="formaHojaAgregar" name="formaHojaAgregar">

                                    </select>
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-4 col-sm-6 col-xs-6">
                                <div class="form-group">
                                    <h5 for="posicionHoja">Posición de hoja</h5>
                                    <select class="form-control" id="posicionHojaAgregar" name="posicionHojaAgregar">

                                    </select>
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-4 col-sm-6 col-xs-6">
                                <div class="form-group">
                                    <h5 for="ubicacion">Ubicación </h5>
                                    <select class="form-control" id="ubicacionAgregar" name="ubicacionAgregar">

                                    </select>
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-4 col-sm-6 col-xs-6">
                                <div class="form-group">
                                    <h5 for="florColor">Color de flor</h5>
                                    <select class="form-control" id="florColorAgregar" name="florColorAgregar">

                                    </select>
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-4 col-sm-6 col-xs-6">
                                <div class="form-group">
                                    <h5 for="florSimetria">Simetría de flor</h5>
                                    <select class="form-control" id="florSimetriaAgregar" name="florSimetriaAgregar">

                                    </select>
                                </div>
                            </div>
                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                <div class="form-group">
                                    <h5 for="descripcion">Descripción </h5></div>
                                <textarea class="form-control input-lg" id="descripcionAgregar" name="descripcionAgregar"></textarea>
                            </div>
                        </div>

                </div>
                <div class="modal-footer">
                    <button class="btn btn-default" type="button" data-dismiss="modal">Cancelar </button>
                    <button class="btn btn-primary" type="submit">Agregar</button>
                </div>
                </form>
            </div>
        </div>
    </div>
    <script src="assets/js/jquery.min.js"></script>
    <script src="assets/bootstrap/js/bootstrap.min.js"></script>
    <script src="https://cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js"></script>
    <script src=" https://cdn.datatables.net/1.10.16/js/dataTables.bootstrap.min.js"></script>
    <script src="assets/js/adminEspeciesController.js"></script>
</body>

</html>
