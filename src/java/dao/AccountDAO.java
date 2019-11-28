package dao;

import dao.DAO;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import model.Account;
import static dao.DAO.con;

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
}