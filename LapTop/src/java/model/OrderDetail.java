package model;

/**
 *
 * @author asus
 */
public class OrderDetail {
    private int  oid,pid;
    private int quantity;
    private double price;
    private String fname,lname,phone,address;

    public OrderDetail() {
    }

    public OrderDetail(int oid, int pid, int quantity, double price, String fname, String lname, String phone, String address) {
        this.oid = oid;
        this.pid = pid;
        this.quantity = quantity;
        this.price = price;
        this.fname = fname;
        this.lname = lname;
        this.phone = phone;
        this.address = address;
    }

    public int getOid() {
        return oid;
    }

    public void setOid(int oid) {
        this.oid = oid;
    }

    public int getPid() {
        return pid;
    }

    public void setPid(int pid) {
        this.pid = pid;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getFname() {
        return fname;
    }

    public void setFname(String fname) {
        this.fname = fname;
    }

    public String getLname() {
        return lname;
    }

    public void setLname(String lname) {
        this.lname = lname;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

  

    
}
