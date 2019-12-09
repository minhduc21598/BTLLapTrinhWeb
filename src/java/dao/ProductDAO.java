
package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import model.Product;
import model.Type;
import model.Manufacturer;
import model.ProductImage;
import java.util.ArrayList;

public class ProductDAO extends DAO{

    public ProductDAO() {
        getDBConnection();
    }
    
    public ArrayList<Product> getAllProduct(){
        ArrayList<Product> listProduct = new ArrayList<>();
        String sql = "SELECT * FROM sanpham";
        ManufacturerDAO md = new ManufacturerDAO();
        TypeDAO td = new TypeDAO();
        ProductImageDAO pid = new ProductImageDAO();
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                Product product = new Product();
                product.setId(rs.getInt("id"));
                product.setName(rs.getString("tenSP"));
                product.setPrice(rs.getDouble("giaban"));
                product.setImportprice(rs.getDouble("gianhap"));
                product.setSale(rs.getInt("khuyenmai"));
                product.setRemain(rs.getInt("tonkho"));
                product.setSold(rs.getInt("soluongban"));
                product.setHot(rs.getInt("hot"));
                product.setBestseller(rs.getInt("banchay"));
                Type type = td.getType(rs.getInt("id_loai"));
                product.setType(type);
                Manufacturer manufacturer = md.getManufacturer(rs.getInt("id_nhacungcap"));
                product.setManufacturer(manufacturer);
                ArrayList<ProductImage> listImage = pid.getImage(rs.getInt("id"));
                product.setListImage(listImage);
                listProduct.add(product);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return listProduct;
    }
    
    public Product getProduct(int id){
        Product product = new Product();
        String sql = "SELECT * FROM sanpham WHERE id = ?";
        ManufacturerDAO md = new ManufacturerDAO();
        TypeDAO td = new TypeDAO();
        ProductImageDAO pid = new ProductImageDAO();
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
                product.setRemain(rs.getInt("tonkho"));
                product.setSold(rs.getInt("soluongban"));
                product.setHot(rs.getInt("hot"));
                product.setBestseller(rs.getInt("banchay"));
                Type type = td.getType(rs.getInt("id_loai"));
                product.setType(type);
                Manufacturer manufacturer = md.getManufacturer(rs.getInt("id_nhacungcap"));
                product.setManufacturer(manufacturer);
                ArrayList<ProductImage> listImage = pid.getImage(rs.getInt("id"));
                product.setListImage(listImage);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return product;
    }
    
//    public int createProduct(Product product){
//        String sql = "INSERT INTO sanpham(id,tenSP,giaban,gianhap,khuyenmai,tonkho,soluongban,hot,banchay,id_nhacungcap,id_loai) VALUES(?,?,?,?,?,?,?,?,?,?,?,?)";
//        try {
//            PreparedStatement ps = con.prepareStatement(sql);
//            ps.setInt(1, product.getId());
//            ps.setString(2, product.getName());
//            ps.setDouble(3, product.getPrice());
//            ps.setDouble(4, product.getImportprice());
//            ps.setInt(6, product.getRemain());
//            ps.setInt(7, product.getSold());
//            ps.setInt(8, product.getHot());
//            ps.setInt(9, product.getBestseller());
//            ps.setInt(10, product.getManufacturer().getId());
//            ps.setInt(10, product.getType().getId());
//            int rowCount = ps.executeUpdate();
//            return rowCount;
//        } catch (Exception e) {
//            e.printStackTrace();
//            return 0;
//        }
//    }
    public ArrayList<Product> getProductByManu(String name){
        ArrayList<Product> listProduct = new ArrayList<>();
        ManufacturerDAO md = new ManufacturerDAO();
        Manufacturer manu = md.getManuByName(name);
        TypeDAO td = new TypeDAO();
        ProductImageDAO pid = new ProductImageDAO();
        String sql = "SELECT * FROM sanpham WHERE id_nhacungcap = ?";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, manu.getId());
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                Product product = new Product();
                product.setId(rs.getInt("id"));
                product.setName(rs.getString("tenSP"));
                product.setPrice(rs.getDouble("giaban"));
                product.setImportprice(rs.getDouble("gianhap"));
                product.setSale(rs.getInt("khuyenmai"));
                product.setRemain(rs.getInt("tonkho"));
                product.setSold(rs.getInt("soluongban"));
                product.setHot(rs.getInt("hot"));
                product.setBestseller(rs.getInt("banchay"));
                Type type = td.getType(rs.getInt("id_loai"));
                product.setType(type);
                product.setManufacturer(manu);
                ArrayList<ProductImage> listImage = pid.getImage(rs.getInt("id"));
                product.setListImage(listImage);
                listProduct.add(product);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return listProduct;
    }
    
    
}
