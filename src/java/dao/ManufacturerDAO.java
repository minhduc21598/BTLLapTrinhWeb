
package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import model.Manufacturer;
import java.util.ArrayList;

public class ManufacturerDAO extends DAO{

    public ManufacturerDAO() {
        getDBConnection();
    }
    
    public static ArrayList<Manufacturer> getAllManufacturer(){
        ArrayList<Manufacturer> listManu = new ArrayList<>();
        String sql = "SELECT * FROM nhacungcap";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                Manufacturer manu = new Manufacturer();
                manu.setId(rs.getInt("id"));
                manu.setName(rs.getString("ten"));
                manu.setAddress(rs.getString("diachi"));
                manu.setEmail(rs.getString("email"));
                manu.setPhonenum(rs.getString("sdt"));
                listManu.add(manu);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return listManu;
    }
    
    public Manufacturer getManufacturer(int id){
        Manufacturer manufacturer = new Manufacturer();
        String sql = "SELECT * FROM nhacungcap WHERE id = ?";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                manufacturer.setId(rs.getInt("id"));
                manufacturer.setName(rs.getString("ten"));
                manufacturer.setAddress(rs.getString("diachi"));
                manufacturer.setEmail(rs.getString("email"));
                manufacturer.setPhonenum(rs.getString("sdt"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return manufacturer;
    }
    
    public Manufacturer getManuByName(String name){
        Manufacturer manufacturer = new Manufacturer();
        String sql = "SELECT * FROM nhacungcap WHERE ten = ?";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, name);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                manufacturer.setId(rs.getInt("id"));
                manufacturer.setName(rs.getString("ten"));
                manufacturer.setAddress(rs.getString("diachi"));
                manufacturer.setEmail(rs.getString("email"));
                manufacturer.setPhonenum(rs.getString("sdt"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return manufacturer;
    }
}
