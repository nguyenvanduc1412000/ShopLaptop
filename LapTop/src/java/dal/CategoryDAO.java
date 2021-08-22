package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Category;

/**
 *
 * @author asus
 */
public class CategoryDAO extends DBContext {
    public List<Category> getAllCat() {
        String sql = "select * from category";
        List<Category> list = new ArrayList<>();
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Category c = new Category(rs.getInt("id_cat"),
                        rs.getString("name_cat"),
                        rs.getString("describe"));
                list.add(c);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }
     
//    public static void main(String[] args) {
//        CategoryDAO c= new CategoryDAO();
//        System.out.println(c.getAllCat().get(0).getName_cat());
//    }
}
