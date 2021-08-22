package model;

/**
 *
 * @author asus
 */
public class Order {
    private int id;
    private String date;
    private int uid;
    private double totalMoney;

    public Order() {
    }

    public Order(int id, String date, int uid, double totalMoney) {
        this.id = id;
        this.date = date;
        this.uid = uid;
        this.totalMoney = totalMoney;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public int getUid() {
        return uid;
    }

    public void setUid(int uid) {
        this.uid = uid;
    }

    public double getTotalMoney() {
        return totalMoney;
    }

    public void setTotalMoney(double totalMoney) {
        this.totalMoney = totalMoney;
    }
    
    
}
