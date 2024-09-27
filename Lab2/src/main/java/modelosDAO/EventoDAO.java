/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package modelosDAO;

import db.cn;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import modelos.Evento;

/**
 *
 * @author steve
 */
public class EventoDAO {
     private cn CN;
    private Connection con;
    private PreparedStatement ps;
    private ResultSet rs;
    
    //SELECT
    public EventoDAO()  throws ClassNotFoundException {
        CN = new cn();
    }
    
    public List listar(){
        ArrayList<Evento> eventos = new ArrayList<>();
        
        String sql = "SELECT e.ID_Evento, e.Fecha_Evento, e.Lugar_ID, l.Nombre_Lugar FROM Eventos e INNER JOIN Lugares l ON e.Lugar_ID = l.ID_Lugar;";
        try {
            con = CN.getCon();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();

            
            while (rs.next()) {
                Evento evento = new Evento();
                evento.setIdEvento(rs.getInt("ID_Evento"));
                evento.setFechaEvento(rs.getDate("Fecha_Evento"));
                evento.setLugarId(rs.getInt("Lugar_ID"));
                evento.setNombreLugar(rs.getString("Nombre_Lugar"));
                eventos.add(evento);
            }
        } catch (Exception e) {

        }
        return eventos;
    }
}
