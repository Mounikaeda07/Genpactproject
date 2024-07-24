package bank;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.math.BigDecimal;
import java.sql.SQLException;
import java.time.LocalDate;





@WebServlet("/register")
public class AdmindashboardServlet extends HttpServlet {
    private AdmindashboardDAO customerDAO;

    public void init() {
        customerDAO = new AdmindashboardDAO();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String fullName = request.getParameter("full_name");
        String address = request.getParameter("address");
        String mobileNo = request.getParameter("mobile_no");
        String email = request.getParameter("email");
        String accountType = request.getParameter("account_type");
        BigDecimal balance = new BigDecimal(request.getParameter("balance"));
        LocalDate dob = LocalDate.parse(request.getParameter("dob"));
        String idProof = request.getParameter("id_proff");
        String idProofNumber = request.getParameter("id_proff_number");

        Admindashboard customer = new Admindashboard();
        customer.setFullName(fullName);
        customer.setAddress(address);
        customer.setMobileNo(mobileNo);
        customer.setEmail(email);
        customer.setAccountType(accountType);
        customer.setBalance(balance);
        customer.setDob(dob);
        customer.setIdProof(idProof);
        customer.setIdProofNumber(idProofNumber);

        customerDAO.registerCustomer(customer);

        response.sendRedirect("success.html");
    }
}
