package bank;



import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;




	public class AdmindashboardDAO {

	    private static final String INSERT_CUSTOMER_QUERY = "INSERT INTO customers (full_name, address, mobile_no, email, account_type, balance, dob, id_proof, id_proof_number) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";

	    public void addCustomer(Customer customer) {
	        try (Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bankingSystem", "root", "akkimouni@7");
	             PreparedStatement ps = con.prepareStatement(INSERT_CUSTOMER_QUERY)) {
	            
	            ps.setString(1, customer.getFullName());
	            import time.LocalDate;

	            class Customer {
	                private String fullName;
	                private String address;
	                private String mobileNo;
	                private String email;
	                private String accountType;
	                private double balance;
	                private LocalDate dob;
	                private String idProof;
	                private String idProofNumber;

	                // Constructor, Getters, and Setters

	                // Example Constructor
	                public Customer(String fullName, String address, String mobileNo, String email, String accountType, double balance, LocalDate dob, String idProof, String idProofNumber) {
	                    this.fullName = fullName;
	                    this.address = address;
	                    this.mobileNo = mobileNo;
	                    this.email = email;
	                    this.accountType = accountType;
	                    this.balance = balance;
	               
	                    this.idProof = idProof;
	                    this.idProofNumber = idProofNumber;
	                }

	                // Getters and Setters
	            }

	            ps.setString(3, customer.getMobileNo());
	            ps.setString(4, customer.getEmail());
	            ps.setString(5, customer.getAccountType());
	            ps.setDouble(6, customer.getBalance());
	            ps.setDate(7, java.sql.Date.valueOf(customer.getDob()));
	            ps.setString(8, customer.getIdProofNumber());
	            ps.setString(9, customer.getIdProofNumber());
	            
	            ps.executeUpdate();
	            
	            System.out.println("Customer added successfully!");

	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	    }

		public void registerCustomer(Admindashboard customer) {
			// TODO Auto-generated method stub
			
		}
	}
