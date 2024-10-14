<%-- Document : eventos Created on : Sep 26, 2024, 5:50:14 PM Author : steve --%>
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
                !-- Enlazar Bootstrap Icons -->
            <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-icons/1.10.5/font/bootstrap-icons.min.css"
                rel="stylesheet">
                <link rel="stylesheet" href="style.css" />
                <title>Eventos</title>
            </head>

            <body>
                <!-- Sidebar -->
                <div class="sidebar">
                    <h2>Laboratorio Framework 2</h2>
                    <ul>
                        <li>
                            <a href="index.html"><i class='bx bxs-home icon'></i> Inicio</a>
                        </li>
                        <li class="active">
                            <a href="ControllerEvento"><i class='bx bx-category-alt icon'></i> Eventos</a>
                        </li>
                        <li>
                            <a href="ControllerLugares"><i class='bx bxs-flag-alt icon'></i>Lugares</a>
                        </li>
                    </ul>
                </div>

                <!-- Main content -->
                <div class="main-content">
                    <div class="table-container">
                        <div class="header">
                            <h2>Eventos</h2>
                            <div class="buttons">
                                <button class="filter-button">Filtros</button>
                                <button class="new-ticket-button" data-bs-toggle="modal"
                                    data-bs-target="#agregarEvento">
                                    + Nuevo Evento
                                </button>
                            </div>
                        </div>

                        <table>
                            <tr>
                                <th>#</th>
                                <th>Fecha</th>
                                <th>Lugar</th>
                                <th>Acciones</th>
                            </tr>
                            </thead>
                            <tbody>
                                <c:forEach items="${eventos}" var="evento">
                                    <tr>
                                        <td>${evento.idEvento}</td>
                                        <td>${evento.fechaEvento}</td>
                                        <td>${evento.nombreLugar}</td>
                                        <td>
                                            <button class="btn btn" data-bs-toggle="modal"
                                                style="background-color: blueviolet;"
                                                data-bs-target="#ActualizarEvento">
                                                <i class="fa-solid fa-pen-to-square mx-1" style="color: aliceblue;"></i>
                                            </button>
                                            <button class="btn btn-danger" data-bs-toggle="modal"
                                                data-bs-target="#eliminarEvento">
                                                <i class="fa-regular fa-circle-xmark mx-1"></i>
                                            </button>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>


                </div>
                </div>

                <div class="modal fade" id="agregarEvento" tabindex="-1" aria-labelledby="agregarEvento"
                    aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header" style="background-color: blueviolet; color: aliceblue">
                                <h5 class="modal-title" id="exampleModalLabel">Agregar Evento</h5>
                                <button type="button" class="btn-close" data-bs-dismiss="modal"
                                    aria-label="Close"></button>
                            </div>
                            <div class="modal-body">
                                <form action="ControllerEvento" method="post">
                                    <div class="row align-items-center">
                                        <!-- Imagen centrada a la par del formulario -->
                                        <div class="col-md-6 d-flex justify-content-center">
                                            <img src="img/evento.png" class="img-fluid rounded" alt="Evento"
                                                style="max-height: 250px;" />
                                        </div>
                                        <div class="col-md-6">
                                            <div class="mb-3">
                                                <label for="fecha" class="form-label">Fecha:</label>
                                                <div class="input-group">
                                                    <span class="input-group-text">
                                                        <i class="bi bi-calendar-date"></i>
                                                    </span>
                                                    <input type="date" class="form-control" id="fecha" name="fecha"
                                                        required />
                                                </div>
                                            </div>
                                            <input type="hidden" name="action" value="agregar" />
                                            <div class="mb-3">
                                                <label for="lugar" class="form-label">Lugar:</label>
                                                <div class="input-group">
                                                    <span class="input-group-text">
                                                        <i class="bi bi-geo-alt"></i>
                                                    </span>
                                                    <select class="form-select" name="lugar" id="lugar" required>
                                                        <c:forEach items="${lugares}" var="lugar">
                                                            <option value="${lugar.idLugar}">${lugar.nombreLugar}
                                                            </option>
                                                        </c:forEach>
                                                    </select>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">
                                            Close
                                        </button>
                                        <button type="submit" class="btn btn-primary">
                                            Agregar
                                        </button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>


                <div class="modal fade" id="eliminarEvento" tabindex="-1" aria-labelledby="eliminarEvento"
                    aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header" style="background-color: blueviolet; color: aliceblue">
                                <h5 class="modal-title" id="exampleModalLabel">Eliminar Evento?</h5>
                                <button type="button" class="btn-close" data-bs-dismiss="modal"
                                    aria-label="Close"></button>
                            </div>
                            <div class="modal-body">
                                <label class="form-label">¿Desea eliminar el evento?</label>
                            </div>
                            <div class="modal-footer">
                                <form>
                                    <button class="btn btn-danger">
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

                <div class="modal fade" id="ActualizarEvento" tabindex="-1" aria-labelledby="ActualizarEvento"
                    aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header" style="background-color: blueviolet; color: aliceblue">
                                <h5 class="modal-title" id="exampleModalLabel">
                                    Actualizar Evento
                                </h5>
                                <button type="button" class="btn-close" data-bs-dismiss="modal"
                                    aria-label="Close"></button>
                            </div>
                            <div class="modal-body">
                                <form>
                                    <div class="mb-3">
                                        <label for="fecha" class="form-label">Fecha:</label>
                                        <input type="date" class="form-control" id="fecha" name="fecha" />
                                    </div>
                                    <div class="mb-3">
                                        <label for="lugar" class="form-label"> Lugar: </label>
                                        <select class="form-select">
                                            <option>Chalchuapa</option>
                                        </select>
                                    </div>
                                </form>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">
                                    Close
                                </button>
                                <button type="button" class="btn btn-success">Actualizar</button>
                            </div>
                        </div>
                    </div>
                </div>
                <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"
                    integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r"
                    crossorigin="anonymous"></script>

                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.min.js"
                    integrity="sha384-BBtl+eGJRgqQAUMxJ7pMwbEyER4l1g+O15P+16Ep7Q9Q+zqX6gSbd85u4mG4QzX+"
                    crossorigin="anonymous"></script>
            </body>

            </html>