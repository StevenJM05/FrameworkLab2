/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package modelosDAO;

import db.cn;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
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
    public EventoDAO() throws ClassNotFoundException {
        CN = new cn();
    }

    public List listar() {
        ArrayList<Evento> eventos = new ArrayList<>();

        String sql = "SELECT e.ID_Evento, e.Fecha_Evento, e.Lugar_ID, l.Nombre_Lugar FROM Eventos e INNER JOIN Lugares l ON e.Lugar_ID = l.ID_Lugar;";

        try {
            con = CN.getCon();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();

            while (rs.next()) {
                Evento evento = new Evento();
                evento.setIdEvento(rs.getInt("ID_Evento"));
                evento.setFechaEvento(rs.getString("Fecha_Evento"));
                evento.setLugarId(rs.getInt("Lugar_ID"));
                evento.setNombreLugar(rs.getString("Nombre_Lugar"));
                eventos.add(evento);
            }
        } catch (Exception e) {

        }
        return eventos;
    }

    public boolean agregar(Evento evento) {
        String sql = "insert into eventos(Fecha_Evento, Lugar_ID) values(?, ?)";
        try {
            con = CN.getCon();
            ps = con.prepareStatement(sql);
            ps.setString(1, evento.getFechaEvento().toString());
            ps.setInt(2, evento.getLugarId());
            int filaAfectadas = ps.executeUpdate();
            return filaAfectadas > 0;

        } catch (SQLException e) {
            System.out.println(e);
            e.printStackTrace(); // Manejo básico de excepciones
            return false;
        } finally {
        }
    }

    public boolean actualizar(Evento evento) {
        String sql = "update Eventos set Fecha_Evento=?, Lugar_ID=?, where ID_Evento=?";
        try {
            con = CN.getCon();
            ps = con.prepareStatement(sql);
            ps.setString(1, evento.getFechaEvento().toString());
            ps.setInt(2, evento.getLugarId());
            ps.setInt(3, evento.getIdEvento());
            int filaAfectadas = ps.executeUpdate();
            return filaAfectadas > 0;

        } catch (Exception e) {
            e.printStackTrace(); // Manejo básico de excepciones
            return false;
        } finally {
        }
    }

    public boolean eliminar(Evento evento) {
        try {
            String sql = "delete from Eventos where ID_Evento=?";
            con = CN.getCon();
            ps = con.prepareStatement(sql);
            ps.setInt(1, evento.getIdEvento());
            int filaAfectadas = ps.executeUpdate();
            return filaAfectadas > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        } finally {
        }
    }

}
