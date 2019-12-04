package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import model.User;

public class UserDAO extends DAO {

    public UserDAO() {
        getDBConnection();
    }

    public User checkUser(int id) {
        User user = new User();
        String sql = "SELECT * FROM nguoidung WHERE id = ?";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                user.setId(rs.getInt("id"));
                user.setName(rs.getString("hoten"));
                user.setAddress(rs.getString("diachi"));
                user.setDateofbirth(rs.getDate("ngaysinh"));
                user.setEmail(rs.getString("email"));
                user.setPhonenum(rs.getString("sdt"));
                user.setType(rs.getInt("kieu"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return user;
    }
}
