
package dao;

import static dao.DAO.con;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import model.User;

public class UserDAO extends DAO{

    public UserDAO() {
        getDBConnection();
    }
    
    public User checkUser(int id){
        User user = new User();
        String sql = "SELECT * FROM nguoidung WHERE id = ?";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                user.setId(rs.getInt("id"));
                user.setHoten(rs.getString("hoten"));
                user.setDiachi(rs.getString("diachi"));
                user.setNgaysinh(rs.getDate("ngaysinh"));
                user.setEmail(rs.getString("email"));
                user.setSdt(rs.getString("sdt"));
                user.setKieu(rs.getInt("kieu"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return user;
    }
}
