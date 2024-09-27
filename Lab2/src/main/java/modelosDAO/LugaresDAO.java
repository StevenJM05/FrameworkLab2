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

    
   public LugaresDAO() throws ClassNotFoundException{
        CN = new cn(); 
    }
    
    
    public List Listar(){
        ArrayList<Lugares> lista = new ArrayList<>();
        String sql;
        sql = "select * from Lugares";
        
        try{
            con = CN.getCon();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            
            while(rs.next()){
                Lugares lugares = new Lugares();
               lugares.setIdLugar(rs.getInt("ID_Lugar"));
               lugares.setNombreLugar(rs.getString("Nombre_Lugar"));
               lugares.setDireccion(rs.getString("Direccion"));
               lugares.setCapacidad(rs.getInt("Capacidad"));
               lista.add(lugares);
               
            }
        }
        catch(Exception e){
            
        }
        return lista;
    };
    
    
}
