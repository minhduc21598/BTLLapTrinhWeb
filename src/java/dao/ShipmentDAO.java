
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
}
