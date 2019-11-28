
package model;

import java.io.Serializable;
import java.util.Date;

public class User implements Serializable{
    
    private int id;
    private String hoten;
    private String diachi;
    private Date ngaysinh;
    private String email;
    private String sdt;
    private int kieu;

    public User() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getHoten() {
        return hoten;
    }

    public void setHoten(String hoten) {
        this.hoten = hoten;
    }

    public String getDiachi() {
        return diachi;
    }

    public void setDiachi(String diachi) {
        this.diachi = diachi;
    }

    public Date getNgaysinh() {
        return ngaysinh;
    }

    public void setNgaysinh(Date ngaysinh) {
        this.ngaysinh = ngaysinh;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getSdt() {
        return sdt;
    }

    public void setSdt(String sdt) {
        this.sdt = sdt;
    }

    public int getKieu() {
        return kieu;
    }

    public void setKieu(int kieu) {
        this.kieu = kieu;
    }
    
}
