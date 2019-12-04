
package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import model.Product;
import model.Type;
import model.Manufacturer;

public class ProductDAO extends DAO{

    public ProductDAO() {
        getDBConnection();
    }
    
    public Product getProduct(int id){
        Product product = new Product();
        String sql = "SELECT * FROM sanpham WHERE id = ?";
        ManufacturerDAO md = new ManufacturerDAO();
        TypeDAO td = new TypeDAO();
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if(rs.next()){
                product.setId(rs.getInt("id"));
                product.setName(rs.getString("tenSP"));
                product.setPrice(rs.getDouble("giaban"));
                product.setImportprice(rs.getDouble("gianhap"));
                product.setSale(rs.getInt("khuyenmai"));
                product.setSaleprice(rs.getDouble("giaKM"));
                product.setRemain(rs.getInt("tonkho"));
                product.setSold(rs.getInt("soluongban"));
                product.setHot(rs.getInt("hot"));
                product.setBestseller(rs.getInt("banchay"));
                Type type = td.getType(rs.getInt("id_loai"));
                product.setType(type);
                Manufacturer manufacturer = md.getManufacturer(rs.getInt("id_nhacungcap"));
                product.setManufacturer(manufacturer);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return product;
    }
}
