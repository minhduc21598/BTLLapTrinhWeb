package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import model.User;
import java.sql.Date;

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
    
    public int createUser(User user){
        int returnValue = 0;
        String sql = "INSERT INTO nguoidung(hoten,diachi,ngaysinh,email,sdt,kieu) VALUES(?,?,?,?,?,?)";
        try {
            PreparedStatement ps = con.prepareStatement(sql, PreparedStatement.RETURN_GENERATED_KEYS);
            ps.setString(1, user.getName());
            ps.setString(2, user.getAddress());
            ps.setDate(3, new Date(user.getDateofbirth().getTime()));
            ps.setString(4, user.getEmail());
            ps.setString(5, user.getPhonenum());
            ps.setInt(6, user.getType());
            ps.executeUpdate();
            ResultSet rs = ps.getGeneratedKeys();
            if(rs.next()) returnValue = rs.getInt(1);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return returnValue;
    }    
    
    public int updateUser(User user){
        String sql = "UPDATE nguoidung SET hoten = ?, diachi = ?, ngaysinh = ?, email = ?, sdt = ? WHERE id = ?";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, user.getName());
            ps.setString(2, user.getAddress());
            ps.setDate(3, new Date(user.getDateofbirth().getTime()));
            ps.setString(4, user.getEmail());
            ps.setString(5, user.getPhonenum());
            ps.setInt(6, user.getId());
            int rowCount = ps.executeUpdate();
            return rowCount;
        } catch (Exception e) {
            e.printStackTrace();
            return 0;
        }
    }
}
