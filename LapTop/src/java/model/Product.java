package model;

/**
 *
 * @author asus
 */
public class Product {
    
    private int id_pro;
    private int id_cat;
    private String name_pro;
    private String images;
    private int quantity;
    private Double price;
    private String supplier;
    private String infor;
    private int sell_ID;
    public Product() {
    }

    public Product(int id_pro, int id_cat, String name_pro, String images, int quantity, Double price, String supplier, String infor, int sell_ID) {
        this.id_pro = id_pro;
        this.id_cat = id_cat;
        this.name_pro = name_pro;
        this.images = images;
        this.quantity = quantity;
        this.price = price;
        this.supplier = supplier;
        this.infor = infor;
        this.sell_ID = sell_ID;
    }

    public int getId_pro() {
        return id_pro;
    }

    public void setId_pro(int id_pro) {
        this.id_pro = id_pro;
    }

    public int getId_cat() {
        return id_cat;
    }

    public void setId_cat(int id_cat) {
        this.id_cat = id_cat;
    }

    public String getName_pro() {
        return name_pro;
    }

    public void setName_pro(String name_pro) {
        this.name_pro = name_pro;
    }

    public String getImages() {
        return images;
    }

    public void setImages(String images) {
        this.images = images;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public Double getPrice() {
        return price;
    }

    public void setPrice(Double price) {
        this.price = price;
    }

    public String getSupplier() {
        return supplier;
    }

    public void setSupplier(String supplier) {
        this.supplier = supplier;
    }

    public String getInfor() {
        return infor;
    }

    public void setInfor(String infor) {
        this.infor = infor;
    }

    public int getSell_ID() {
        return sell_ID;
    }

    public void setSell_ID(int sell_ID) {
        this.sell_ID = sell_ID;
    }

   
    @Override
    public String toString() {
        return "Product{" + "id_pro=" + id_pro + ", id_cat=" + id_cat + ", name_pro=" + name_pro + ", images=" + images + ", quantity=" + quantity + ", price=" + price + ", supplier=" + supplier + ", infor=" + infor + '}'
                +"sell_ID"+sell_ID;
    }
    
}
