 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css" />
    <title>Eventos por Lugar</title>
</head>
<body>
    <div class="container mt-5">
        <h2>Eventos en el Lugar: ${eventos.nombreLugar}}</h2>
        
        <c:if test="${not empty mensaje}">
            <div class="alert alert-info">${mensaje}</div>
        </c:if>

        <table class="table table-striped">
            <thead>
                <tr>
                    <th>ID Evento</th>
                    <th>Fecha del Evento</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${eventos}" var="evento">
                    <tr>
                        <td>${evento.idEvento}</td>
                        <td>${evento.fechaEvento}</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>

        <c:if test="${empty eventos}">
            <div class="alert alert-warning">No hay eventos disponibles para este lugar.</div>
        </c:if>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.min.js"></script>
</body>
</html>
