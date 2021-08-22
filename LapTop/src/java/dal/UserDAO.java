package dal;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.User;

/**
 *
 * @author asus
 */
public class UserDAO extends DBContext {

    public User login(String username, String password) {
        String sql = "select*from [user] where username=? and password=? ";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            
            ps.setString(1, username);
            ps.setString(2, password);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                return new User(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getDate(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getString(8),
                        rs.getString(9),
                        rs.getString(10));
            }
        
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;

    }
    public boolean checkAcc(String username) {
        String sql = "select * from [user] where  username='" + username + "'" ;

        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return true;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return false;
    }

    public void signup(User user) {
        String sql = "insert into [user] values(?,?,?,?,?,?,?,?,?,0)";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, user.getId_user());
            ps.setString(2, user.getUsername());
            ps.setString(3, user.getPassword());
            ps.setDate(4, user.getDob());
            ps.setString(5, user.getGender());
            ps.setString(6, user.getEmail());
            ps.setString(7, user.getPhone());
            ps.setString(8, user.getAddress());
            ps.setString(9, user.getRole());
            ps.executeUpdate();

        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void updateAcc(User user) {
        String sql = "update [user] set [username]=?,[password]=?,dob=?,gender=?,email=?,phone=?,[address]=?,[role]=?,[block]=0 \n"
                + "where id_user=?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);

            ps.setInt(9, user.getId_user());
            ps.setString(1, user.getUsername());
            ps.setString(2, user.getPassword());
            ps.setDate(3, user.getDob());
            ps.setString(4, user.getGender());
            ps.setString(5, user.getEmail());
            ps.setString(6, user.getPhone());
            ps.setString(7, user.getAddress());
            ps.setString(8, user.getRole());
            ps.executeUpdate();

        } catch (SQLException e) {
            System.out.println(e);
        }      
    }

    public User getAcc(String name) {
        User user = new User();
        String sql = "select * from [user] where  username='" + name + "'";

        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                int id_user = rs.getInt("id_user");
                String username = rs.getString("username");
                String password = rs.getString("password");
                Date dob = rs.getDate("dob");
                String gender = rs.getString("gender");
                String email = rs.getString("email");
                String phone = rs.getString("phone");
                String address = rs.getString("address");
                String role = rs.getString("role");
                user = new User(id_user, username, password, dob, gender, email, phone, address, role,"0");
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return user;
    }
    public  List<User> getAllUser() {
        User user = new User();
        String sql = "select * from [user] where [block]=0 and role=2 or role=3";

        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
             List<User> list= new ArrayList<>();
            while (rs.next()) {
               
                int id_user = rs.getInt("id_user");
                String username = rs.getString("username");
                String password = rs.getString("password");
                Date dob = rs.getDate("dob");
                String gender = rs.getString("gender");
                String email = rs.getString("email");
                String phone = rs.getString("phone");
                String address = rs.getString("address");
                String role = rs.getString("role");
                user = new User(id_user, username, password, dob, gender, email, phone, address, role,"0");
                list.add(user);
            }
            return list;
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
       
    }
    public void blockAccount(String aid) {
        String query = "UPDATE [user] SET block = 1 WHERE id_user = ?";

        try {
            
             PreparedStatement ps = connection.prepareStatement(query);
            ps.setString(1, aid);
            ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void unBlockAccount(String aid) {
        String query = "UPDATE [user] SET block = 0 WHERE id_user = ?";

       try {
            
             PreparedStatement ps = connection.prepareStatement(query);
            ps.setString(1, aid);
            ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public User getAccBlock(String user) {
        String sql = "select * \n"
                + "from [user]\n"
                + "where [username] like ? and block = 1";
            
       try {
            PreparedStatement ps = connection.prepareStatement(sql);
            
            ps.setString(1, user);
           
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                 return new User(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getDate(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getString(8),
                        rs.getString(9),
                        rs.getString(10));
               
            }
        
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }
     public List<User> getAllAccBlock() {
        List<User> list = new ArrayList<>();
        String query = "select * from [user]\n"
                + "where block = 1";
        try {
           
             PreparedStatement ps = connection.prepareStatement(query);
             ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                User u=new User(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getDate(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getString(8),
                        rs.getString(9),
                        rs.getString(10)); 
                list.add(u);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }
    public static void main(String[] args) {
        UserDAO u= new UserDAO();
//        System.out.println(u.login("duc", "123"));
//        System.out.println(u.getAllUser());
        System.out.println(u.getAllAccBlock());
    }

}
