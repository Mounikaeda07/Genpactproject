package bank;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class AdminLoginDAO {
    private static final String LOGIN_QUERY = "SELECT * FROM cust_reg_form WHERE email = ? AND password = ?";

    private Connection getConnection() throws SQLException, ClassNotFoundException {
        Class.forName("com.mysql.cj.jdbc.Driver");
        return DriverManager.getConnection("jdbc:mysql://localhost:3306/custregform", "root", "akkimouni@7");
    }

    public boolean validateAdmin(String email, String password) throws SQLException, ClassNotFoundException {
        try (Connection con = getConnection();
             PreparedStatement ps = con.prepareStatement(LOGIN_QUERY)) {
            ps.setString(1, email);
            ps.setString(2, password);
            try (ResultSet rs = ps.executeQuery()) {
                return rs.next(); // If a record is found, the admin is valid
            }
        }
    }
}



