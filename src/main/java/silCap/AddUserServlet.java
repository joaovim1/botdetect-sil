package silCap;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/addUser")
public class AddUserServlet extends HttpServlet {


	protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String user = request.getParameter("user");
        String email = request.getParameter("email");
        String senha = request.getParameter("senha");

        try (Connection conn = DBManager.getConnection()) {
            String sql = "INSERT INTO usuarios (nome, email) VALUES (?, ?)";
            try (PreparedStatement stmt = conn.prepareStatement(sql)) {
                stmt.setString(1, user);
                stmt.setString(2, email);
                stmt.executeUpdate();
                response.sendRedirect("listUsers.jsp"); // Redireciona para a lista de usuários
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
