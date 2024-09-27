<%-- 
    Document   : eventos
    Created on : Sep 26, 2024, 5:50:14 PM
    Author     : steve
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
    <head>
        <title>Eventos</title>
        <!-- Required meta tags -->
        <meta charset="utf-8" />
        <meta
            name="viewport"
            content="width=device-width, initial-scale=1, shrink-to-fit=no"
        />

        <!-- Bootstrap CSS v5.2.1 -->
        <link
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
            rel="stylesheet"
            integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
            crossorigin="anonymous"
        />
    </head>

    <body>
        <header>
            <!-- place navbar here -->
        </header>
        <main>
            
            <div class="container">
                <div class="card">
                    <div class="card-header">
                        <h1>Eventos</h1>
                    </div>
                    <div class="card-body">
                        <div
                            class="table-responsive-md"
                        >
                            <table
                                class="table table-success"
                            >
                                <thead>
                                    <tr>
                                        <th scope="col">ID</th>
                                        <th scope="col">Fecha</th>
                                        <th scope="col">ID Lugar</th>
                                        <th scope="col">Nombre del lugar</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    
                                    <c:forEach items="${eventos}" var="eventos">
                                        <tr>
                                            <td>
                                                <c:out value="${eventos.ID_Evento}"></c:out>
                                            </td>
                                            <td>
                                                <c:out value="${eventos.Fecha_Evento}"></c:out>
                                            </td>
                                            <td>
                                                <c:out value="${eventos.Lugar_ID}"></c:out>
                                            </td>
                                            <td>
                                                <c:out value="${eventos.Nombre_Lugar}"></c:out>
                                            </td>
                                        </tr>
                                        
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>
                        
                        
                    </div>
                </div>
            </div>
            
        </main>
        <footer>
            <!-- place footer here -->
        </footer>
        <!-- Bootstrap JavaScript Libraries -->
        <script
            src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"
            integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r"
            crossorigin="anonymous"
        ></script>

        <script
            src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.min.js"
            integrity="sha384-BBtl+eGJRgqQAUMxJ7pMwbEyER4l1g+O15P+16Ep7Q9Q+zqX6gSbd85u4mG4QzX+"
            crossorigin="anonymous"
        ></script>
    </body>
</html>

