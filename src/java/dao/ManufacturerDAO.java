
package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import model.Manufacturer;

public class ManufacturerDAO extends DAO{

    public ManufacturerDAO() {
        getDBConnection();
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
}
