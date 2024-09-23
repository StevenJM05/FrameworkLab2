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
    private Date fechaEvento;
    private int lugarId;

    public Lugar(int idLugar, Date fechaEvento, int lugarId) {
        this.idLugar = idLugar;
        this.fechaEvento = fechaEvento;
        this.lugarId = lugarId;
    }

    public Lugar() {
    }

    public int getIdLugar() {
        return idLugar;
    }

    public void setIdLugar(int idLugar) {
        this.idLugar = idLugar;
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
