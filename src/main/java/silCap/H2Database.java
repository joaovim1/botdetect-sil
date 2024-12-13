package silCap;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class H2Database {

    // Configurações de conexão com o banco H2
    private static final String JDBC_URL = "jdbc:h2:/home/nb050/workspaceCap/silCap/src/main/java/test"; // Diretório absoluto
    private static final String USER = "sa"; // Usuário padrão do H2
    private static final String PASSWORD = ""; // Senha padrão é vazia
    
    // Método para obter uma conexão com o banco H2
    public static Connection getConnection() throws SQLException {
        try {
            // Carregar o driver H2 (não é necessário nas versões mais recentes do H2, pois o Driver é carregado automaticamente)
            Class.forName("org.h2.Driver");
            return DriverManager.getConnection(JDBC_URL, USER, PASSWORD);
        } catch (ClassNotFoundException e) {
            throw new SQLException("Driver H2 não encontrado.", e);
        }
    }
}
