/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package modelos;

import java.sql.Date;

/**
 *
 * @author steve
 */
public class Lugar {
    private int idLugar;
     private String nombreLugar;
    private String direccion;
    private int capacidad;

    public Lugar() {
    }

    public Lugar(int idLugar, String nombreLugar, String direccion, int capacidad) {
        this.idLugar = idLugar;
        this.nombreLugar = nombreLugar;
        this.direccion = direccion;
        this.capacidad = capacidad;
    }

    public int getIdLugar() {
        return idLugar;
    }

    public void setIdLugar(int idLugar) {
        this.idLugar = idLugar;
    }

    public String getNombreLugar() {
        return nombreLugar;
    }

    public void setNombreLugar(String nombreLugar) {
        this.nombreLugar = nombreLugar;
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public int getCapacidad() {
        return capacidad;
    }

    public void setCapacidad(int capacidad) {
        this.capacidad = capacidad;
    }

   
    
    
}
