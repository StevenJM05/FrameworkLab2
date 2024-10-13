<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@page contentType="text/html" pageEncoding="UTF-8" %>
        <!DOCTYPE html>
        <html lang="es">

        <head>
            <meta charset="UTF-8" />
            <meta name="viewport" content="width=device-width, initial-scale=1.0" />
            <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
                integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
                crossorigin="anonymous" />

            <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css"
                integrity="sha512-Kc323vGBEqzTmouAECnVceyQqyqdsSiqLQISBL29aUW4U/M7pSPA/gEUZQqv1cwx4OnYxTxve5UMg5GT6L4JJg=="
                crossorigin="anonymous" referrerpolicy="no-referrer" />
            <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
            <link rel="stylesheet" href="style.css" />
            <title>Lugares</title>
        </head>

        <body>
            <!-- Sidebar -->
            <div class="sidebar">
                <h2>Laboratorio Framework 2</h2>
                <ul>
                    <li>
                        <a href="index.html"><i class='bx bxs-home icon'></i> Inicio</a>
                    </li>
                    <li>
                        <a href="ControllerEvento"><i class='bx bx-category-alt icon'></i> Eventos</a>
                    </li>
                    <li class="active">
                        <a href="ControllerLugares"><i class='bx bxs-flag-alt icon'></i>Lugares</a>
                    </li>
                </ul>
            </div>

            <!-- Main content -->
            <div class="main-content">
                <div class="table-container">
                    <div class="header">
                        <h2>Lugares</h2>
                        <c:if test="${not empty mensaje}">
                            <div class="alert alert-info">${mensaje}</div>
                        </c:if>

                        <div class="buttons">
                            <button class="filter-button">Filtros</button>
                            <button class="new-ticket-button" data-bs-toggle="modal" data-bs-target="#agregarLugar">
                                + Nuevo Lugar
                            </button>
                        </div>
                    </div>
                    <table>
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Nombre</th>
                                <th>Dirección</th>
                                <th>Capacidad</th>
                                <th>Acciones</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${consulta}" var="consulta">
                                <tr>
                                    <td>${consulta.idLugar}</td>
                                    <td>${consulta.nombreLugar}</td>
                                    <td>${consulta.direccion}</td>
                                    <td>${consulta.capacidad}</td>
                                    <td>
                                        <div class="row">
                                            <div class="col-md-3">
                                                <button class="btn btn-success" data-bs-toggle="modal"
                                                    data-bs-target="#ActualizarLugar"
                                                    onclick="llenarFormulario('${consulta.idLugar}', '${consulta.nombreLugar}', '${consulta.direccion}', ${consulta.capacidad})">
                                                    <i class="fa-solid fa-pen-to-square mx-1"></i>
                                                </button>
                                            </div>
                                            <div class="col-md-3">
                                                <button class="btn btn-danger" data-bs-toggle="modal"
                                                    data-bs-target="#eliminarLugar"
                                                    onclick="llenarEliminar('${consulta.idLugar}')">
                                                    <i class="fa-regular fa-circle-xmark mx-1"></i>
                                                </button>
                                            </div>
                                            <div class="col-md-3">
                                                <form action="ControllerEvento" method="post">
                                                    <input type="hidden" name="idLugar" value="${consulta.idLugar}">
                                                    <input type="hidden" id="action" name="action" value="ver" />
                                                    <button class="btn btn-info" name="ver" value="ver">
                                                        <i class="fa-solid fa-eye mx-1"></i>
                                                    </button>
                                                </form>
                                            </div>
                                        </div>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>

            <!-- Modal de Actualización -->
            <div class="modal fade" id="ActualizarLugar" tabindex="-1" aria-labelledby="ActualizarLugar"
                aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <form action="ControllerLugares" method="post">
                            <div class="modal-header">
                                <h5 class="modal-title" id="exampleModalLabel">Actualizar Lugar</h5>
                                <button type="button" class="btn-close" data-bs-dismiss="modal"
                                    aria-label="Close"></button>
                            </div>
                            <div class="modal-body">
                                <input type="hidden" id="action" name="action" value="actualizar" />
                                <input type="hidden" id="idLugar" name="idLugar" value="">
                                <div class="mb-3">
                                    <label for="nombreLugar" class="form-label">Nombre</label>
                                    <input type="text" class="form-control" id="nombreLugar" name="nombre" value=""
                                        required>
                                </div>
                                <div class="mb-3">
                                    <label for="direccionLugar" class="form-label">Dirección</label>
                                    <input type="text" class="form-control" id="direccionLugar" name="direccion"
                                        required>
                                </div>
                                <div class="mb-3">
                                    <label for="capacidad" class="form-label">Capacidad</label>
                                    <input type="number" class="form-control" id="capacidadLugar" name="capacidad"
                                        required>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cerrar</button>
                                <button type="submit" class="btn btn-primary">Actualizar</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>

            <!-- Modal Agregar Lugar -->
            <div class="modal fade" id="agregarLugar" tabindex="-1" aria-labelledby="agregarLugar" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header" style="background-color: blueviolet; color: aliceblue">
                            <h5 class="modal-title" id="exampleModalLabel">Agregar Lugar</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                            <form action="ControllerLugares" method="post">
                                <div class="mb-3">
                                    <label for="nombre" class="form-label">Nombre:</label>
                                    <input type="text" class="form-control" id="nombre" name="nombre" required />
                                </div>
                                <div class="mb-3">
                                    <label for="direccion" class="form-label">Dirección:</label>
                                    <input type="text" class="form-control" id="direccion" name="direccion" required />
                                </div>
                                <div class="mb-3">
                                    <label for="capacidad" class="form-label">Capacidad:</label>
                                    <input type="number" class="form-control" id="capacidad" name="capacidad"
                                        required />
                                </div>
                                <input type="hidden" name="action" value="agregar" />

                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">
                                        Close
                                    </button>
                                    <button type="submit" class="btn btn-primary">Agregar</button>
                                </div>
                            </form>

                        </div>
                    </div>
                </div>
            </div>

            <!-- Modal Eliminar Lugar -->
            <div class="modal fade" id="eliminarLugar" tabindex="-1" aria-labelledby="eliminarLugar" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header" style="background-color: blueviolet; color: aliceblue">
                            <h5 class="modal-title" id="exampleModalLabel">Eliminar Lugar</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                            <label class="form-label">¿Desea eliminar el lugar?</label>

                        </div>
                        <div class="modal-footer">
                            <form action="ControllerLugares" method="post">
                                <input type="hidden" name="action" value="eliminar">
                                <input type="hidden" id="idEliminarLugar" name="idLugar" value="">
                                <button type="submit" class="btn btn-danger">
                                    <i class="fa-solid fa-eraser"></i>Eliminar
                                </button>
                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">
                                    <i class="fa-solid fa-eye-slash"></i>Cancelar
                                </button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>




            <script>
                function llenarFormulario(idLugar, nombre, direccion, capacidad) {
                    // Asignar los valores a los campos del formulario
                    document.getElementById("idLugar").value = idLugar;
                    document.getElementById("nombreLugar").value = nombre;
                    document.getElementById("direccionLugar").value = direccion;
                    document.getElementById("capacidadLugar").value = capacidad;
                }
                function llenarEliminar(idEliminar) {
                    document.getElementById("idEliminarLugar").value = idEliminar;

                }


            </script>

            <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"
                integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4JQkC+hVqc2pM8ODewa9r"
                crossorigin="anonymous"></script>

            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.min.js"
                integrity="sha384-BBtl+eGJRgqQAUMxJ7pMwbEyER4l1g+O15P+16Ep7Q9Q+zqX6gSbd85u4mG4QzX+"
                crossorigin="anonymous"></script>
        </body>

        </html>