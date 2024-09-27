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
import modelos.Lugar;

/**
 *
 * @author steve
 */
public class LugarDAO {

    private cn CN;
    private Connection con;
    private PreparedStatement ps;
    private ResultSet rs;

    public LugarDAO() throws ClassNotFoundException {
        CN = new cn();
    }

    public List listar() {
        ArrayList<Lugar> lista = new ArrayList<>();

        String sql = "";
        try {
            con = CN.getCon();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();

            while (rs.next()) {
                Lugar lugar = new Lugar();
                lugar.setIdLugar(rs.getInt("setIdLugar"));
                lugar.setNombreLugar(rs.getString("setNombreLugar"));
                lugar.setDireccion(rs.getString("setDireccion"));
                lugar.setCapacidad(rs.getInt("setCapacidad"));
                lista.add(lugar);
            }
        } catch (Exception e) {

        }

        return lista;
    }

}
