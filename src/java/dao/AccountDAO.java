package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import model.Account;

public class AccountDAO extends DAO{

    public AccountDAO() {
        getDBConnection();
    }

    public Account checkAccount(String name, String pass) {
        Account ac = new Account();
        String sql = "SELECT * FROM taikhoan WHERE tendangnhap = ? AND matkhau = ?";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, name);
            ps.setString(2, pass);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                ac.setId(rs.getInt("id_nguoidung"));
                ac.setUsername(name);
                ac.setPassword(pass);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return ac;
    }
    
    public int createAccount(Account account){
        String sql = "INSERT INTO taikhoan(tendangnhap,matkhau,id_nguoidung) VALUES(?,?,?)";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, account.getUsername());
            ps.setString(2, account.getPassword());
            ps.setInt(3, account.getId());
            int rowCount = ps.executeUpdate();
            return rowCount;
        } catch (Exception e) {
            e.printStackTrace();
            return 0;
        }
    }
    
    public int updateAccount(int id, String pass){
        String sql = "UPDATE taikhoan SET matkhau = ? WHERE id_nguoidung = ?";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, pass);
            ps.setInt(2, id);
            int rowCount = ps.executeUpdate();
            return rowCount;
        } catch (Exception e) {
            e.printStackTrace();
            return 0;
        }
    }
}