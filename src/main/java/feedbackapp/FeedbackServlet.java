package feedbackapp;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/feedback")
public class FeedbackServlet extends HttpServlet{
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String email = req.getParameter("email");
		String phone = req.getParameter("phone");
		String feedbackMessage = req.getParameter("feedback_message");
		
		try {
			
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/feedbackapp","root","");
			
			String query = "insert into feedbacks(email, phone, message) values(?,?,?)";
			PreparedStatement pstmt = con.prepareStatement(query);
			pstmt.setString(1, email);
			pstmt.setString(2, phone);
			pstmt.setString(3, feedbackMessage);
			pstmt.executeUpdate();
			con.close();
			
			resp.setContentType("text/html");
            PrintWriter out = resp.getWriter();
            out.println("<script type=\"text/javascript\">");
            out.println("alert('Feedback submitted successfully!');");
            out.println("window.location='feedback.jsp';");
            out.println("</script>");
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
}
