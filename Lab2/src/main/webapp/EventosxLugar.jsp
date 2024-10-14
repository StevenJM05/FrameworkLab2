<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@page contentType="text/html" pageEncoding="UTF-8" %>
        <!DOCTYPE html>
        <html lang="es">

        <head>
            <meta charset="UTF-8" />
            <meta name="viewport" content="width=device-width, initial-scale=1.0" />
            <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" />
            <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css" />
            <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
            <link rel="stylesheet" href="style.css" />
            <title>Eventos por Lugar</title>
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
                        <a href="ControllerLugares"><i class='bx bxs-flag-alt icon'></i> Lugares</a>
                    </li>
                </ul>
            </div>

            <!-- Main content -->
            <div class="main-content">
                <div class="container mt-5">
                    <div class="table-container">

                        <div class="header">
                            <c:if test="${not empty eventos && eventos.size() > 0}">
                                <h2>Eventos en el Lugar: ${eventos[0].nombreLugar}</h2>
                            </c:if>
                            <div class="buttons">
                                <button class="filter-button">Filtros</button>
                                <button class="new-ticket-button" data-bs-toggle="modal"
                                    data-bs-target="#agregarEvento">
                                    + Nuevo Evento
                                </button>
                            </div>
                        </div>




                        <!-- Mensaje de alerta -->
                        <c:if test="${not empty mensaje}">
                            <div class="alert alert-info">${mensaje}</div>
                        </c:if>

                        <!-- Tabla de eventos -->

                        <table>
                            <thead>
                                <tr>
                                    <th>#</th>
                                    <th>Fecha del Evento</th>
                                    <th>Lugar del evento</th>

                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach items="${eventos}" var="evento">
                                    <tr>
                                        <td>${evento.idEvento}</td>
                                        <td>${evento.fechaEvento}</td>
                                        <td>${evento.nombreLugar}</td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>


                        <!-- Mensaje cuando no hay eventos -->
                        <c:if test="${empty eventos}">
                            <div class="alert alert-warning">No hay eventos disponibles para este lugar.</div>
                        </c:if>
                    </div>
                </div>
            </div>

            <div class="modal fade" id="agregarEvento" tabindex="-1" aria-labelledby="agregarEvento" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header" style="background-color: blueviolet; color: aliceblue">
                            <h5 class="modal-title" id="exampleModalLabel">Agregar Evento en <c:if
                                    test="${not empty eventos && eventos.size() > 0}">
                                    ${eventos[0].nombreLugar}
                                </c:if>
                            </h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                            <form action="ControllerEvento" method="post">
                                <div class="mb-3">
                                    <label for="fecha" class="form-label">Fecha:</label>
                                    <input type="date" class="form-control" id="fecha" name="fecha" />
                                </div>
                                <input type="hidden" name="action" value="agregar">
                                <input type="hidden" name="lugar" value="${idLugar}">
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">
                                Close
                            </button>
                            <button type="submit" class="btn btn-primary">Agregar</button>
                        </div>
                    </div>
                    </form>
                </div>
            </div>




            <!-- Scripts de Bootstrap y Popper -->
            <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"></script>
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.min.js"></script>
        </body>

        </html>