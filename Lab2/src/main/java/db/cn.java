package db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class cn {
    private Connection con;

    public cn() throws ClassNotFoundException {
        try {
            // Cargar el driver MySQL
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/lab2", "root", "");
            if (con != null) {
                System.out.println("Conexión exitosa a la base de datos.");
            }
        } catch (SQLException e) {
            System.err.println("Error de SQL: " + e.getMessage());
        } catch (ClassNotFoundException e) {
            System.err.println("Driver no encontrado: " + e.getMessage());
        } catch (Exception e) {
            System.err.println("Error: " + e);
        }
    }

    public Connection getCon() {
        return con;
    }
}
