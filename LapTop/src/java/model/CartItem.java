package model;

import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author asus
 */
public class CartItem {
    private ArrayList<Item> items;

    public CartItem() {
        items=new ArrayList<>();
    }

    public CartItem(ArrayList<Item> items) {
        this.items = items;
    }
     public List<Item> getItems() {
        return items;
    }
    //get item by id:
    public Item getItemById(int id){
        for (Item i : items) {
            if(i.getProduct().getId_pro()==id){
                return i;
            }
        }
        return null;        
    }
    //lay so luong cua san pham
    public int getQuantityById(int id){
        return getItemById(id).getQuantity();
    }
    //them item
    public void addItem(Item t){
        //co trong gio r
        if(getItemById(t.getProduct().getId_pro())!=null){
            Item i= getItemById(t.getProduct().getId_pro());
            i.setQuantity(i.getQuantity()+t.getQuantity());
            
        }else{
            // chua co item trong gio thi add
            items.add(t);
        }
    }
    // xoa san pham
    public void removeItem(int id){
        if(getItemById(id)!=null){
            items.remove(getItemById(id));
        }
    }
    //get total money
    public double getToTalMoney(){
        double total=0;
        for (Item i : items) {
            total+=i.getPrice()*i.getQuantity();
        }
        return total;
    }
    
    
}
