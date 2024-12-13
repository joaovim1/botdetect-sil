package silCap;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBManager {

    private static final String URL = "jdbc:h2:mem:testdb"; // ou "jdbc:h2:./data/testdb" para disco
    private static final String USER = "sa";
    private static final String PASSWORD = "";

    // Método para obter a conexão com o banco de dados
    public static Connection getConnection() throws SQLException {
        return DriverManager.getConnection(URL, USER, PASSWORD);
    }
}
