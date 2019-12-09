
package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import model.Shipment;
import model.Product;

public class ShipmentDAO extends DAO{

    public ShipmentDAO() {
        getDBConnection();
    }
    
    public ArrayList<Shipment> getAllShipment(int idUser, int status){
        ArrayList<Shipment> listShipment = new ArrayList<>();
        String sql = "SELECT * FROM donhang WHERE id_nguoidung = ? AND trangthai = ?";
        ProductDAO pd = new ProductDAO();
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, idUser);
            ps.setInt(2, status);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                Shipment shipment = new Shipment();
                shipment.setId(rs.getInt("id"));
                shipment.setQuantity(rs.getInt("soluong"));
                shipment.setTotal(rs.getDouble("tongtien"));
                shipment.setStatus(rs.getInt("trangthai"));
                Product product = pd.getProduct(rs.getInt("id_sanpham"));
                shipment.setProduct(product);
                listShipment.add(shipment);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return listShipment;
    }
    
    public Shipment getShipment(int id){
        Shipment shipment = new Shipment();
        String sql = "SELECT * FROM donhang WHERE id = ?";
        ProductDAO pd = new ProductDAO();
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if(rs.next()){
                shipment.setId(rs.getInt("id"));
                shipment.setQuantity(rs.getInt("soluong"));
                shipment.setTotal(rs.getDouble("tongtien"));
                shipment.setStatus(rs.getInt("trangthai"));
                Product product = pd.getProduct(rs.getInt("id_sanpham"));
                shipment.setProduct(product);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return shipment;
    }
    
    public int createShipmentInCart(Shipment shipment){
        String sql = "INSERT INTO donhang(soluong,tongtien,trangthai,id_sanpham,id_nguoidung) VALUES(?,?,?,?,?)";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, shipment.getQuantity());
            ps.setDouble(2, shipment.getTotal());
            ps.setInt(3, shipment.getStatus());
            ps.setInt(4, shipment.getProduct().getId());
            ps.setInt(5, shipment.getUser().getId());
            int rowCount = ps.executeUpdate();
            return rowCount;
        } catch (Exception e) {
            e.printStackTrace();
            return 0;
        }
    }
    
    public int updateShipmentQuantity(Product product, int idUser){
        String sql = "UPDATE donhang SET soluong = soluong + 1, tongtien = tongtien + ? WHERE id_sanpham = ? AND id_nguoidung = ?";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setDouble(1, product.getPrice());
            ps.setInt(2, product.getId());
            ps.setInt(3, idUser);
            int rowCount = ps.executeUpdate();
            return rowCount;
        } catch (Exception e) {
            e.printStackTrace();
            return 0;
        }
    }
    
    public int changeShipmentQuantity(int soluong, double productPrice, int idShipment){
        String sql = "UPDATE donhang SET soluong = ?, tongtien = ? * ? WHERE id = ?";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, soluong);
            ps.setInt(2, soluong);
            ps.setDouble(3, productPrice);
            ps.setInt(4, idShipment);
            int rowCount = ps.executeUpdate();
            return rowCount;
        } catch (Exception e) {
            e.printStackTrace();
            return 0;
        }
    }
    
    public int updateShipmentStatus(int idShipment, int status){
        String sql = "UPDATE donhang SET trangthai = ? WHERE id = ?";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, status);
            ps.setInt(2, idShipment);
            int rowCount = ps.executeUpdate();
            return rowCount;
        } catch (Exception e) {
            e.printStackTrace();
            return 0;
        }
    }
    
    public int deleteShipment(int idShipment){
        String sql = "DELETE FROM donhang WHERE id = ?";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, idShipment);
            int rowCount = ps.executeUpdate();
            return rowCount;
        } catch (Exception e) {
            e.printStackTrace();
            return 0;
        }
    }
}
