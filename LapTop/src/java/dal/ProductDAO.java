package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Product;

/**
 *
 * @author asus
 */
public class ProductDAO extends DBContext {

    public List<Product> getAll() {
        String sql = "select * from product";
        List<Product> list = new ArrayList<>();
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Product p = new Product(rs.getInt("id_pro"),
                        rs.getInt("id_cat"),
                        rs.getString("name_pro"),
                        rs.getString("images"),
                        rs.getInt("quantity"),
                        rs.getDouble("price"),
                        rs.getString("supplier"),
                        rs.getString("infor"),
                        rs.getInt("sell_ID"));
                list.add(p);
            }

        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    //get list of product from category id
    public List<Product> getListProByCat(String id) {
        String sql = "select * from product where id_cat='" + id + "'";
        List<Product> list = new ArrayList<>();
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Product p = new Product(rs.getInt("id_pro"),
                        rs.getInt("id_cat"),
                        rs.getString("name_pro"),
                        rs.getString("images"),
                        rs.getInt("quantity"),
                        rs.getDouble("price"),
                        rs.getString("supplier"),
                        rs.getString("infor"),
                        rs.getInt("sell_ID"));
                list.add(p);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    //get newest product
    public Product getLast() {
        String sql = "select top 1 *from product\n"
                + "order by id_pro desc";

        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Product p = new Product(rs.getInt("id_pro"),
                        rs.getInt("id_cat"),
                        rs.getString("name_pro"),
                        rs.getString("images"),
                        rs.getInt("quantity"),
                        rs.getDouble("price"),
                        rs.getString("supplier"),
                        rs.getString("infor"),
                        rs.getInt("sell_ID"));
                return p;
            }

        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;

    }
    //get product byid

    public Product getProductById(int id) {
        String sql = "select * from product where id_pro=?";

        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Product p = new Product(rs.getInt("id_pro"),
                        rs.getInt("id_cat"),
                        rs.getString("name_pro"),
                        rs.getString("images"),
                        rs.getInt("quantity"),
                        rs.getDouble("price"),
                        rs.getString("supplier"),
                        rs.getString("infor"),
                        rs.getInt("sell_ID"));
                return p;
            }

        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;

    }

    public List<Product> searchByName(String txtSearch) {
        String sql = "select*from product where name_pro like ? ";
        List<Product> list = new ArrayList<>();
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, "%" + txtSearch + "%");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Product p = new Product(rs.getInt("id_pro"),
                        rs.getInt("id_cat"),
                        rs.getString("name_pro"),
                        rs.getString("images"),
                        rs.getInt("quantity"),
                        rs.getDouble("price"),
                        rs.getString("supplier"),
                        rs.getString("infor"),
                        rs.getInt("sell_ID"));
                list.add(p);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Product> getListProBySellID(int id) {
        String sql = "select * from product where sell_ID=?";
        List<Product> list = new ArrayList<>();
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Product p = new Product(
                        rs.getInt("id_pro"),
                        rs.getInt("id_cat"),
                        rs.getString("name_pro"),
                        rs.getString("images"),
                        rs.getInt("quantity"),
                        rs.getDouble("price"),
                        rs.getString("supplier"),
                        rs.getString("infor"),
                        rs.getInt("sell_ID"));
                list.add(p);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public int delete(int id) {
        String sql = "delete product where id_pro=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);

            return st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
        return 0;

    }
    //check exist id

    public boolean existedPro(int id) {
        String sql = "select * from product where id_pro=?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                return true;
            }
        } catch (SQLException e) {
            System.out.println("e");
        }
        return false;
    }

    //get page product
    public List<Product> pagingProduct(int index) {
        String sql = "select * from product order by id_pro OFFSET ? ROWS FETCH NEXT 5 ROWS ONLY";
        List<Product> list = new ArrayList<>();
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, (index - 1) * 5);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Product p = new Product(rs.getInt("id_pro"),
                        rs.getInt("id_cat"),
                        rs.getString("name_pro"),
                        rs.getString("images"),
                        rs.getInt("quantity"),
                        rs.getDouble("price"),
                        rs.getString("supplier"),
                        rs.getString("infor"),
                        rs.getInt("sell_ID"));
                list.add(p);
            }

        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;

    }
     public int count() {
        String query = "select COUNT (*) from product ";
        try {
           
           PreparedStatement ps = connection.prepareStatement(query);
              ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception e) {

        }
        return 0;
    }

    public int countByCid(String cid) {
        String query = "select COUNT (*) from product where id_cat = ? ";
        try {
            
          PreparedStatement  ps = connection.prepareStatement(query);
            ps.setString(1, cid);
             ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception e) {

        }
        return 0;
    }

    public int countBySearchName(String name) {
        String query = "select COUNT (*) from product where name_pro like ?";
        try {
           
             PreparedStatement ps = connection.prepareStatement(query);
            ps.setString(1, "%" + name + "%");
             ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception e) {

        }
        return 0;
    }


    //add new product
    public void addPro(
          int id_pro, int id_cat,String name_pro,String images,int quantity,double price,String supplier,String infor,int sell_id) {
        String sql = "INSERT [dbo].[product] ([id_pro], [id_cat], [name_pro], [images], [quantity], [price], [supplier], [infor],[sell_ID]) VALUES(?,?,?,?,?,?,?,?,?)";

        try {
            PreparedStatement ps = connection.prepareStatement(sql);

             ps.setInt(1, id_pro);
            ps.setInt(2, id_cat);
            ps.setString(3,name_pro);
            ps.setString(4, images);
            ps.setInt(5, quantity);
            ps.setDouble(6, price);
            ps.setString(7,supplier);
            ps.setString(8, infor);
            ps.setInt(9, sell_id);
            ps.executeUpdate();

        } catch (SQLException e) {
            System.out.println(e);
        }
    }

//    public void updateProduct(int id_cat, String name_pro, String images, int quantity, double price, String supplier, String infor, int id_pro) {
//        String sql = "update product set id_cat=?,name_pro=?,images=?,quantity=?,price=?,supplier=?,infor=? where id_pro=?";
//               
//
//        try {
//            PreparedStatement ps = connection.prepareStatement(sql);
//            ps.setInt(8, id_pro);
//            ps.setInt(1, id_cat);
//            ps.setString(2, name_pro);
//            ps.setString(3, images);
//            ps.setInt(4, quantity);
//            ps.setDouble(4, price);
//            ps.setString(6, supplier);
//            ps.setString(7, infor);
//
//            ps.executeUpdate();
//
//        } catch (SQLException e) {
//            System.out.println(e);
//        }
//    }
    public int update(Product d) {
        String sql = "update product set id_cat=?"
                + ",name_pro=?,images=?,quantity=?,price=?,supplier=?,infor=?,sell_ID=? where id_pro=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(9, d.getId_pro());
            st.setInt(1, d.getId_cat());

            st.setString(2, d.getName_pro());
            st.setString(3, d.getImages());
            st.setInt(4, d.getQuantity());
            st.setDouble(5, d.getPrice());
            st.setString(6, d.getSupplier());
            st.setString(7, d.getInfor());
            st.setInt(8, d.getSell_ID());
            return st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
        return 0;
    }

    public List<Product> getProductByPage(List<Product> list,
            int start, int end) {
        List<Product> t = new ArrayList<>();
        for (int i = start; i < end; i++) {
            t.add(list.get(i));
        }
        return t;
    }

    //get total page
    public int gatTotalPage() {
        String sql = "select count(*) from product ";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException e) {
            System.out.println("e");
        }

        return 0;

    }
    public List<Product> getProductIndexByID(String index) {
        List<Product> list = new ArrayList<>();
        String query = "with x as (select ROW_NUMBER() over (order by id_pro desc) as r,\n"
                + "id_pro,name_pro,images,price,infor,id_cat,quantity,supplier,sell_ID from product ) \n"
                + "select x.id_pro, x.name_pro, x.images, x.price, x.infor,x.id_cat,x.quantity,x.supplier,x.sell_ID from x where r between ?*6-5 and ?*6";
        try {
           
           PreparedStatement ps = connection.prepareStatement(query);
            ps.setString(1, index);
            ps.setString(2, index);
             ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                 Product p = new Product(rs.getInt("id_pro"),
                        rs.getInt("id_cat"),
                        rs.getString("name_pro"),
                        rs.getString("images"),
                        rs.getInt("quantity"),
                        rs.getDouble("price"),
                        rs.getString("supplier"),
                        rs.getString("infor"),
                        rs.getInt("sell_ID"));
                list.add(p);
            }
        } catch (Exception e) {
        }
        return list;
    }
    public List<Product> getProductIndexBySearchName(String name, String index) {
        List<Product> list = new ArrayList<>();
        String query = "with x as (select ROW_NUMBER() over (order by id_pro desc) as r,\n"
                + "id_pro,name_pro,images,price,infor,id_cat,quantity,supplier,sell_ID from product where [name_pro] like ? ) \n"
                + "select x.id_pro, x.name_pro, x.images, x.price, x.infor,x.id_cat,x.quantity,x.supplier,x.sell_ID from x where r between ?*6-5 and ?*6";
        try {
            //mo ket noi voi sql
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setString(1, "%" + name + "%");
            ps.setString(2, index);
            ps.setString(3, index);
             ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                 Product p = new Product(rs.getInt("id_pro"),
                        rs.getInt("id_cat"),
                        rs.getString("name_pro"),
                        rs.getString("images"),
                        rs.getInt("quantity"),
                        rs.getDouble("price"),
                        rs.getString("supplier"),
                        rs.getString("infor"),
                        rs.getInt("sell_ID"));
                list.add(p);
            }
        } catch (SQLException e) {
        }
        return list;
    }
    public List<Product> getProductByCate(String cid, String index) {
        List<Product> list = new ArrayList<>();
        String query = "with x as (select ROW_NUMBER() over (order by id_pro desc) as r,\n"
                + "id_pro,name_pro,images,price,infor,id_cat,quantity,supplier,sell_ID from product where id_cat = ? ) \n"
                + "select x.id_pro, x.name_pro, x.images, x.price, x.infor,x.id_cat,x.quantity,x.supplier,x.sell_ID from x where r between ?*6-5 and ?*6";
        try {
            //mo ket noi voi sql
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setString(1,  cid );
            ps.setString(2, index);
            ps.setString(3, index);
             ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                 Product p = new Product(rs.getInt("id_pro"),
                        rs.getInt("id_cat"),
                        rs.getString("name_pro"),
                        rs.getString("images"),
                        rs.getInt("quantity"),
                        rs.getDouble("price"),
                        rs.getString("supplier"),
                        rs.getString("infor"),
                        rs.getInt("sell_ID"));
                list.add(p);
            }
        } catch (SQLException e) {
        }
        return list;
    }

    public static void main(String[] args) {
        ProductDAO d = new ProductDAO();
//        List<Product> list = d.pagingProduct(3);
//        for (Product p : list) {
//            System.out.println(p);
//        }

    }
}
