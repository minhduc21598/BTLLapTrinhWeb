
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
    
    public ArrayList<Shipment> getShipment(int idUser){
        ArrayList<Shipment> listShipment = new ArrayList<>();
        String sql = "SELECT * FROM donhang WHERE id_nguoidung = ? AND trangthai = ?";
        ProductDAO pd = new ProductDAO();
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, idUser);
            ps.setInt(2, 0);
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
