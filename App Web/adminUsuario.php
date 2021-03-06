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
    <link rel="stylesheet" href="assets/css/Map-Clean.css">
    <link rel="stylesheet" href="assets/css/Navbar-Chunky.css">
    <link rel="stylesheet" href="assets/css/styles.css">
</head>

<body onLoad="loadControllers()">
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
                    <li  role="presentation"><a href="adminEspecies.php"> Especies</a></li>
                    <li role="presentation"><a href="adminGlosario.php">Glosario </a></li>
                    <li role="presentation"><a href="adminMuestras.php">Muestras </a></li>
                    <li class="active" role="presentation"><a href="adminUsuario.php">Gestión de Usuarios </a></li>
                    <li role="presentation"><a href="http://herbariodigital.xyz/AppWeb/assets/php/killSession.php">Cerrar Sesión(<small> <?php echo $_SESSION['email'];?> </small>)</a></li>
                </ul>
            </div>
        </div>
    </nav>
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-12">
                <ol class="breadcrumb" style="border-bottom-width:1px;">
                    <li><a><span>Administrador de Usuarios</span></a></li>
                </ol>
            </div>
        </div>
    </div>
    <div class="container-fluid">
        <button class="btn btn-primary pull-right" type="button" data-toggle="modal" data-target="#modalAgregar"> <i class="glyphicon glyphicon-plus"></i> Agregar usuario</button>
    </div>
    <div class="container-fluid">
        <div class="table-responsive table-striped table-bordered">
            <table class="table table-striped table-bordered" id="tablePagination">
                <thead>
                    <tr>
                        <th>Acciones </th>
                        <th>Correo Electrónico</th>
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
                    <h4 class="modal-title">Eliminar Usuario</h4></div>
                <div class="modal-body">
                    <p>¿Seguro que desea eliminar al usuario <strong id="correoEliminar"></strong>?</p>
                </div>
                <div class="modal-footer">
                    <button class="btn btn-default" type="button" data-dismiss="modal" id="btnCancelar">Cancelar </button>
                    <button class="btn btn-danger" type="button" id="btnEliminar">Eliminar </button>
                </div>
            </div>
        </div>
    </div>
    <div class="modal fade" role="dialog" tabindex="-1" id="modalEditar">
        <input type="hidden" id="idEditar"></input>
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
                    <h4 class="modal-title">Editar usuario</h4></div>
                <div class="modal-body">
                    <form>
                        <div class="row">
                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                <div class="form-group">
                                    <h5 for="editCorreoElectronico">Correo Electrónico</h5>
                                    <input class="form-control" type="text" id="editCorreoElectronico" required>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                <div class="form-group">
                                    <h5 for="editPassword">Contraseña </h5>
                                    <input class="form-control" type="password" id="editPassword" required>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button class="btn btn-default" type="button" data-dismiss="modal">Cancelar </button>
                    <button class="btn btn-primary" type="button" id="btnEditar" >Guardar cambios</button>
                </div>
            </div>
        </div>
    </div>
    <div class="modal fade" role="dialog" tabindex="-1" id="modalAgregar">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
                    <h4 class="modal-title">Agregar usuario</h4></div>
                <div class="modal-body">
                    <form>
                        <div class="row">
                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                <div class="form-group">
                                    <h5 for="newCorreoElectronico">Correo Electrónico</h5>
                                    <input class="form-control" type="text" id="newCorreoElectronico" required>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                <div class="form-group">
                                    <h5 for="newPassword">Contraseña </h5>
                                    <input class="form-control" type="password" id="newPassword" required>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button class="btn btn-default" type="button" data-dismiss="modal">Cancelar </button>
                    <button class="btn btn-primary" type="button" id="agregar">Agregar administrador</button>
                </div>
            </div>
        </div>
    </div>
    <script src="assets/js/jquery.min.js"></script>
    <script src="assets/bootstrap/js/bootstrap.min.js"></script>
    <script src="https://cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js"></script>
    <script src=" https://cdn.datatables.net/1.10.16/js/dataTables.bootstrap.min.js"></script>
    <script src="assets/js/adminUsuarioController.js"></script>
</body>

</html>
