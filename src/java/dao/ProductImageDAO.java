
package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import model.ProductImage;
import java.util.ArrayList;

public class ProductImageDAO extends DAO{

    public ProductImageDAO() {
        getDBConnection();
    }
    
    public ArrayList<ProductImage> getImage(int idProduct){
        ArrayList<ProductImage> listImage = new ArrayList<>();
        String sql = "SELECT * FROM anh WHERE id_sanpham = ?";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, idProduct);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                ProductImage image = new ProductImage();
                image.setId(rs.getInt("id"));
                image.setUrl(rs.getString("url"));
                listImage.add(image);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return listImage;
    }
}
