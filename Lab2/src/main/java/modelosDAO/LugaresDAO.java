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
import modelos.Lugares;

/**
 *
 * @author MINED
 */
public class LugaresDAO {

    private cn CN;
    private Connection con;
    private PreparedStatement ps;
    private ResultSet rs;

    public LugaresDAO() throws ClassNotFoundException {
        CN = new cn();
    }

    public List Listar() {
        ArrayList<Lugares> lista = new ArrayList<>();
        String sql;
        sql = "select * from Lugares";

        try {
            con = CN.getCon();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();

            while (rs.next()) {
                Lugares lugares = new Lugares();
                lugares.setIdLugar(rs.getInt("ID_Lugar"));
                lugares.setNombreLugar(rs.getString("Nombre_Lugar"));
                lugares.setDireccion(rs.getString("Direccion"));
                lugares.setCapacidad(rs.getInt("Capacidad"));
                lista.add(lugares);

            }
        } catch (Exception e) {

        }
        return lista;
    }

    ;
    
    public boolean agregar(Lugares lugares) {
        String sql = "insert into Lugares(Nombre_Lugar, Direccion, Capacidad) values(?, ?, ?)";
        try {
            con = CN.getCon();
            ps = con.prepareStatement(sql);
            ps.setString(1, lugares.getNombreLugar());
            ps.setString(2, lugares.getDireccion());
            ps.setInt(3, lugares.getCapacidad());
            int filaAfectadas = ps.executeUpdate();
            return filaAfectadas > 0;

        } catch (Exception e) {
            e.printStackTrace(); // Manejo básico de excepciones
            return false;
        } finally {
        }
    }

    public boolean actualizar(Lugares lugares) {
        String sql = "update Lugares set Nombre_Lugar=?, Direccion=?, Capacidad=? where ID_Lugar=?";
        try {
            con = CN.getCon();
            ps = con.prepareStatement(sql);
            ps.setString(1, lugares.getNombreLugar());
            ps.setString(2, lugares.getDireccion());
            ps.setInt(3, lugares.getCapacidad());
            ps.setInt(4, lugares.getIdLugar());

            int filaAfectadas = ps.executeUpdate();
            return filaAfectadas > 0;

        } catch (Exception e) {
            e.printStackTrace(); // Manejo básico de excepciones
            return false;
        } finally {
        }
    }

    public boolean eliminar(int id) {
        try {
            String sql = "delete from Lugares where ID_Lugar=?";
            con = CN.getCon();
            ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            int filaAfectadas = ps.executeUpdate();
            return filaAfectadas > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        } finally {
        }
    }

}
