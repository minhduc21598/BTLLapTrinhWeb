
package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import model.Type;

public class TypeDAO extends DAO{

    public TypeDAO() {
        getDBConnection();
    }
    
    public Type getType(int id){
        Type type = new Type();
        String sql = "SELECT * FROM loai WHERE id = ?";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                type.setId(rs.getInt("id"));
                type.setType(rs.getString("loai"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return type;
    }
    
}
