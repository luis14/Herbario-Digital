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
                    <li role="presentation"><a href="adminEspecies.php"> Especies</a></li>
                    <li  class="active" role="presentation"><a href="adminGlosario.php">Glosario </a></li>
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
                    <li><a><span>Administrador del Glosario</span></a></li>
                </ol>
            </div>
        </div>
    </div>
    <div class="container-fluid">
        <button class="btn btn-primary pull-right" type="button" data-toggle="modal" data-target="#modalAgregar"> <i class="glyphicon glyphicon-plus"></i> Agregar ítem</button>
    </div>
    <div class="container-fluid">
        <div class="table-responsive table-striped table-bordered">
            <table class="table table-striped table-bordered" id="tablePagination">
                <thead>
                    <tr>
                        <th>Acciones </th>
                        <th>Nombre </th>
                        <th>Definición </th>
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
                    <h4 class="modal-title">Eliminar ítem del glosario</h4></div>
                <div class="modal-body">
                    <p>¿Seguro que desea eliminar el ítem <strong id="itemEliminar"></strong>?</p>
                </div>
                <div class="modal-footer">
                    <button class="btn btn-default" type="button" data-dismiss="modal">Cancelar </button>
                    <button class="btn btn-danger" type="button" id="btnEliminar">Eliminar </button>
                </div>
            </div>
        </div>
    </div>
    <div class="modal fade" role="dialog" tabindex="-1" id="modalAgregar">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
                    <h4 class="modal-title">Agregar ítem</h4></div>
                <div class="modal-body">
                    <form id="uploadItem" action="" method="post" enctype="multipart/form-data">
                        <div class="row">
                            <div class="col-lg-4 col-md-4 col-sm-6 col-xs-6">
                                <div class="form-group">
                                    <h5 for="Nombre">Nombre </h5>
                                    <input class="form-control" type="text" id="Nombre" name="Nombre">
                                </div>
                            </div>
                            <div class="col-lg-8 col-md-8 col-sm-8 col-xs-8">
                                <div class="form-group">
                                    <h5 for="Definicion">Definición </h5>
                                    <textarea class="form-control" id="Definicion" name="Definicion"></textarea>
                                </div>
                            </div>
                            <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
                                <div class="form-group imagenEjemplos">
                                    <h5 for="imagen">Imagenes de ejemplos </h5>
                                    <div class="input-group ">
                                        <span class="input-group-btn">
                                            <span class="btn btn-default btn-file">
                                                Browse… <input type="file" id="imgEj" class="imagenEjemplos" name="imgEj[]" multiple >
                                            </span>

                                        </span>
                                        <input type="text" class="form-control" readonly>
                                    </div>
                                    <img id='img-upload' class="img img-responsive" height="100px" width="100px"/>
                                </div>
                            </div><div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
                                <div class="form-group imagenTipos"  >
                                    <h5 for="imagen">Imagenes de tipos</h5>
                                    <div class="input-group">
                                        <span class="input-group-btn">
                                            <span class="btn btn-default btn-file">
                                                Browse… <input type="file" id="imgTip" class="imagenTipos" name="imgTip[]" multiple >
                                            </span>

                                        </span>
                                        <input type="text" class="form-control" readonly>
                                    </div>
                                    <img id='img-upload' class="img img-responsive" height="100px" width="100px"/>
                                </div>
                            </div>
                        </div>
                </div>
                <div class="modal-footer">
                    <button class="btn btn-default" type="button" data-dismiss="modal">Cancelar </button>
                    <button class="btn btn-primary" type="submit">Agregar </button>
                </div>
                </form>
            </div>
        </div>
    </div>
    <div class="modal fade" role="dialog" tabindex="-1" id="modalEditar">
        <input type="hidden" id="idEditar"></input>
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
                    <h4 class="modal-title">Editar ítem</h4></div>
                <div class="modal-body">
                    <form>
                        <div class="row">
                            <div class="col-lg-4 col-md-4 col-sm-6 col-xs-6">
                                <div class="form-group">
                                    <h5 for="nombreComun">Nombre </h5>
                                    <input class="form-control" type="text" id="nombreEditar">
                                </div>
                            </div>
                            <div class="col-lg-11 col-md-8 col-sm-11 col-xs-11">
                                <div class="form-group">
                                    <h5 for="nombreCientifico">Definición </h5>
                                    <textarea class="form-control" id="definicionEditar"></textarea>
                                </div>
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
    <script src="assets/js/jquery.min.js"></script>
    <script src="assets/bootstrap/js/bootstrap.min.js"></script>
    <script src="https://cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js"></script>
    <script src=" https://cdn.datatables.net/1.10.16/js/dataTables.bootstrap.min.js"></script>
    <script src="assets/js/adminGlosarioController.js"></script>
</body>

</html>
