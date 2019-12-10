
package model;

import java.io.Serializable;
import java.util.ArrayList;

public class Product implements Serializable{
    
    private int id;
    private String name;
    private double price;
    private double importprice;
    private int sale;

    public Product(int id, String name, double price, double importprice, int sale, int remain, int sold, int hot, int bestseller, int type, int manufacturer) {
        this.id = id;
        this.name = name;
        this.price = price;
        this.importprice = importprice;
        this.sale = sale;
        this.remain = remain;
        this.sold = sold;
        this.hot = hot;
        this.bestseller = bestseller;
        this.type.setId(type);
        this.manufacturer.setId(manufacturer);
        this.listImage = listImage;
    }
    private int remain;
    private int sold;
    private int hot;
    private int bestseller;
    private Type type;
    private Manufacturer manufacturer;
    private ArrayList<ProductImage> listImage;

    public Product() {
    }

    public Product(int parseInt, String TenSP, double parseDouble, double parseDouble0, int parseInt0, int parseInt1, int parseInt2, int parseInt3, int parseInt4) {
        this.id = parseInt;
        this.name = TenSP;
        this.price = parseDouble;
        this.importprice = parseDouble0;
        this.sale = parseInt0;
        this.remain = parseInt1;
        this.sold = parseInt2;
        this.hot = 1;
        this.bestseller = 0;
        this.type.setId(parseInt3);
        this.manufacturer.setId(parseInt4);
        this.listImage = listImage;
    }
    
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public double getImportprice() {
        return importprice;
    }

    public void setImportprice(double importprice) {
        this.importprice = importprice;
    }

    public int getSale() {
        return sale;
    }

    public void setSale(int sale) {
        this.sale = sale;
    }

    public int getRemain() {
        return remain;
    }

    public void setRemain(int remain) {
        this.remain = remain;
    }

    public int getSold() {
        return sold;
    }

    public void setSold(int sold) {
        this.sold = sold;
    }

    public int getHot() {
        return hot;
    }

    public void setHot(int hot) {
        this.hot = hot;
    }

    public int getBestseller() {
        return bestseller;
    }

    public void setBestseller(int bestseller) {
        this.bestseller = bestseller;
    }

    public Type getType() {
        return type;
    }

    public void setType(Type type) {
        this.type = type;
    }

    public Manufacturer getManufacturer() {
        return manufacturer;
    }

    public void setManufacturer(Manufacturer manufacturer) {
        this.manufacturer = manufacturer;
    }

    public ArrayList<ProductImage> getListImage() {
        return listImage;
    }

    public void setListImage(ArrayList<ProductImage> listImage) {
        this.listImage = listImage;
    }
    
}
