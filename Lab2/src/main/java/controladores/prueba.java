/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controladores;

import db.cn;

/**
 *
 * @author steve
 */
public class prueba {
    public static void main(String[] args) {
        try {
            cn connection = new cn();  // Llamamos al constructor de la clase 'cn' para establecer la conexión
            if (connection.getCon() != null) {
                System.out.println("Conexión a la base de datos establecida correctamente.");
            } else {
                System.out.println("No se pudo establecer la conexión.");
            }
        } catch (ClassNotFoundException e) {
            System.err.println("Error al cargar el driver: " + e.getMessage());
        } catch (Exception e) {
            e.printStackTrace();  // Para imprimir cualquier otro error
        }
    }
}
