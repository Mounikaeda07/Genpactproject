package bank;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class adminloginDAO {



	

	public class AdminLoginDAO {
	    private String jdbcURL = "jdbc:mysql://localhost:3306/admin_login";
	    private String jdbcUsername = "root";
	    private String jdbcPassword = "akkimouni@7";

	    private static final String SELECT_ADMIN_SQL = "SELECT * FROM adminlogin WHERE username = ? AND password = ?";

	    protected Connection getConnection() throws ClassNotFoundException, SQLException {
	        Class.forName("com.mysql.cj.jdbc.Driver");
	        return DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
	    }

	    public boolean validate(String adminId, String password) throws ClassNotFoundException {
	        boolean status = false;

	        try (Connection connection = getConnection();
	             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ADMIN_SQL)) {
	            preparedStatement.setString(1, adminId);
	            preparedStatement.setString(2, password);

	            ResultSet rs = preparedStatement.executeQuery();
	            status = rs.next();
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	        return status;
	    }
	}


}
