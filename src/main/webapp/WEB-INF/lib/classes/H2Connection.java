import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class H2DatabaseConnection {

    // Configuração do banco H2
    private static final String URL = "jdbc:h2:mem:testdb;DB_CLOSE_DELAY=-1;DB_CLOSE_ON_EXIT=FALSE";
    private static final String USER = "sa";
    private static final String PASSWORD = "";
    private static final String DRIVER = "org.h2.Driver";

    // Método para obter a conexão com o banco de dados
    public static Connection getConnection() throws SQLException {
        try {
            // Carregar o driver JDBC do H2
            Class.forName(DRIVER);
            return DriverManager.getConnection(URL, USER, PASSWORD);
        } catch (ClassNotFoundException e) {
            throw new SQLException("Driver do H2 não encontrado", e);
        }
    }
}
