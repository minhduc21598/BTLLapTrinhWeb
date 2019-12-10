
package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import model.Product;
import model.Type;
import model.Manufacturer;
import model.ProductImage;
import java.util.ArrayList;

public class ProductDAO extends DAO{

    public ProductDAO() {
        getDBConnection();
    }
    
    public static int deleteProduct(int id) {
        String sql = "DELETE FROM sanpham WHERE id = ?";
        try {
            PreparedStatement ps = con.prepareCall(sql);
            ps.setInt(1, id);
            int temp = ps.executeUpdate();
            return temp;
        } catch (Exception e) {
            e.printStackTrace();
            return 0;
        }
    }

    public boolean updateProduct(Product sp) {
        try {
            String sql = "UPDATE sanpham SET tenSP = ? ,giaban = ?, gianhap = ?,khuyenmai = ?, tonkho = ?, soluongban = ?, hot = ?, banchay = ?, id_nhacungcap = ?, id_loai = ? WHERE id = ?";
            PreparedStatement ps = con.prepareCall(sql);
            ps.setString(1, sp.getName());
            ps.setDouble(2, sp.getPrice());
            ps.setDouble(3, sp.getImportprice());
            ps.setInt(4, sp.getSale());
            ps.setInt(5, sp.getRemain());
            ps.setInt(6, sp.getSold());
            ps.setInt(7, sp.getHot());
            ps.setInt(8, sp.getBestseller());
            ps.setInt(9, sp.getManufacturer().getId());
            ps.setInt(10, sp.getType().getId());
            ps.setInt(11, sp.getId());
            int temp = ps.executeUpdate();
            return temp == 1;
        } catch (Exception e) {
            return false;
        }
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
    
    public ArrayList<Product> getProductByName(String name) {
        ArrayList<Product> listProduct = new ArrayList<>();
        ManufacturerDAO md = new ManufacturerDAO();
        TypeDAO td = new TypeDAO();
        ProductImageDAO pid = new ProductImageDAO();
        String sql = "SELECT * FROM sanpham WHERE tenSP LIKE '%" + name + "%'";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
//            ps.setString(1, "%" + name + "%");
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
    
    public boolean addProduct(Product sp) {
        String sql = "INSERT INTO sanpham(tenSP,giaban,gianhap,khuyenmai,tonkho,soluongban,hot,banchay,id_nhacungcap,id_loai) VALUE(?,?,?,?,?,?,?,?,?,?)";
        try {
            PreparedStatement ps = con.prepareCall(sql);
            ps.setString(1, sp.getName());
            ps.setDouble(2, sp.getPrice());
            ps.setDouble(3, sp.getImportprice());
            ps.setInt(4, sp.getSale());
            ps.setInt(5, sp.getRemain());
            ps.setInt(6, sp.getSold());
            ps.setInt(7, sp.getHot());
            ps.setInt(8, sp.getBestseller());
            ps.setInt(9, sp.getManufacturer().getId());
            ps.setInt(10, sp.getType().getId());
            int temp = ps.executeUpdate();
            return temp == 1;
        } catch (Exception e) {
            return false;
        }
    }
    
}
