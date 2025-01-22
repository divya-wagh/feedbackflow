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
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/feedbackapp","root","Diva19@7@03");
			
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
		
		
		/*
		 * resp.setContentType("text/html"); PrintWriter writer = resp.getWriter();
		 * writer.println("<h1>Feedback servlet working<h1>"); writer.println("""
		 * <h2>Your form details that you have submitted</h2> <h3>Email address %s</h3>
		 * <h3>Phone number %s</h3> <h3>Feedback message %s</h3>
		 * 
		 * """.formatted(email,phone,feedbackMessage));
		 */
	}
	
}
