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
public class Evento {
    private int idEvento;
    private Date fechaEvento;
    private int lugarId;
    private String nombreLugar;

    public Evento(int idEvento, Date fechaEvento, int lugarId, String nombreLugar) {
        this.idEvento = idEvento;
        this.fechaEvento = fechaEvento;
        this.lugarId = lugarId;
        this.nombreLugar = nombreLugar;
    }

    public Evento() {
    }

    public String getNombreLugar() {
        return nombreLugar;
    }

    public void setNombreLugar(String nombreLugar) {
        this.nombreLugar = nombreLugar;
    }

    

    public int getIdEvento() {
        return idEvento;
    }

    public void setIdEvento(int idEvento) {
        this.idEvento = idEvento;
    }

    public Date getFechaEvento() {
        return fechaEvento;
    }

    public void setFechaEvento(Date fechaEvento) {
        this.fechaEvento = fechaEvento;
    }

    public int getLugarId() {
        return lugarId;
    }

    public void setLugarId(int lugarId) {
        this.lugarId = lugarId;
    }

   

    
    
    
}
