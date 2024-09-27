<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
    <title>Title</title>
</head>
<style>
    * {
        box-sizing: border-box;
    }

    body {
        font-family: Arial, sans-serif;
        background-color: #f4f4f4;
        margin: 0;
        padding: 0;
    }

    .container {
        max-width: 800px;
        margin: 30px auto;
        padding: 20px;
        background-color: #fff;
        border-radius: 8px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    }

    h3 {
        margin-bottom: 15px;
        color: #333;
    }

    h3 span {
        color: #666;
    }

    .form-section, .table-section {
        margin-bottom: 30px;
    }

    .input-group {
        margin-bottom: 15px;
    }

    .input-group label {
        display: block;
        margin-bottom: 5px;
        font-weight: bold;
    }

    .input-group input {
        width: 100%;
        padding: 10px;
        border: 1px solid #ccc;
        border-radius: 5px;
    }

    .btn-agregar, .btn-eliminar {
        background-color: #007bff;
        color: #fff;
        border: none;
        padding: 10px 20px;
        border-radius: 5px;
        cursor: pointer;
    }

    .btn-agregar:hover, .btn-eliminar:hover {
        background-color: #0056b3;
    }

    .table-section h3 {
        background-color: #e9f2ff;
        padding: 10px;
        border-radius: 5px;
        margin-bottom: 15px;
    }

    table {
        width: 100%;
        border-collapse: collapse;
        margin-bottom: 15px;
    }

    table thead {
        background-color: #333;
        color: #fff;
    }

    table th, table td {
        padding: 10px;
        text-align: left;
        border: 1px solid #ccc;
    }

    table tbody tr:nth-child(even) {
        background-color: #f9f9f9;
    }

    .btn-edit, .btn-delete {
        background-color: #fff;
        border: none;
        cursor: pointer;
        font-size: 18px;
    }

    .btn-edit:hover {
        color: #007bff;
    }

    .btn-delete:hover {
        color: #dc3545;
    }

    .btn-eliminar {
        background-color: #dc3545;
    }

    .btn-eliminar:hover {
        background-color: #c82333;
    }

</style>
<body>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
 <%@page contentType="text/html" pageEncoding="UTF-8"%>
<header>
    <nav class="navbar navbar-expand-sm navbar-light bg-primary">
        <div class="container-fluid">
            <a class="navbar-brand" href="#">EXAMEN FRAMEWORKS</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarID"
                aria-controls="navbarID" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarID">
                <div class="navbar-nav">
                    <a class="nav-link active" aria-current="page" href="index.html">Volver al index</a>
                    <a class="nav-link active" aria-current="page" href="ControllerLugares">Ir a lugares</a>
                    <a class="nav-link active" aria-current="page" href="ControllerEvento">Ir a eventos</a>
                    
                </div>
            </div>
        </div>
    </nav>
</header>
<div class="container">
    

    

    <div class="form-section">
        <h3>Información requerida: <span>Para registrar una nueva persona</span></h3>
        <form action="ControllerPersona" method="post" >

            <div class="input-group">
                <label>Nombre Lugar</label>
                <input type="text" name="nombre" placeholder="Ingrese el nombre">
            </div>
            <div class="input-group">
                <label>Dirección</label>
                <input type="text" name="direccion" placeholder="Ingrese la direccion">
            </div>
            <div class="input-group">
                <label>Capacidad</label>
                <input type="number" name="capacidad" placeholder="Ingrese la capacidad">
            </div>
            <button type="submit" name="action" value="agregar" class="btn-agregar">Agregar registro</button>
        </form>

    </div>

    <div class="table-section">
        <h3>Consulta General de personas</h3>
        <table>
            <thead>
            <tr>
                <th>ID</th>
                <th>DUI</th>
                <th>Nombre</th>
                <th>Apellido</th>
                <th>Acciones</th>
            </tr>
            </thead>
            <tbody>


                <c:forEach items = "${consulta}" var = "lugares">
            <tr>
                <td >
                    ${lugares.idLugar}  
                </td>
                
                <td>${lugares.nombreLugar}</td>
                <td>${lugares.direccion}</td>
                <td>${lugares.capacidad}</td>
                <td>
                    <form action="ControllerPersona" method="post">
                        <input type="hidden" name="id" value="">
                        <button class="btn-edit" name="action" value="actualizar">✏</button>
                    </form>

                </td>
            </tr>
            </c:forEach>
          

        </table>
        <form action="ControllerPersona" method="get">
            <input type="hidden" name="id" value="">
            <button type="submit" name="action" value="eliminar" class="btn-eliminar">Eliminar registro</button>
        </form> 

    </div>
</div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4" crossorigin="anonymous"></script>
</body>
</html>