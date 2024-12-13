package silCap;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;
import java.sql.SQLException;

public class CreateDatabase {

    public static void main(String[] args) {
        // URL JDBC para conectar ao banco H2 (em modo embutido ou servidor)
        String url = "jdbc:h2:~/test";  // Banco de dados no diretório do usuário
        // Se desejar em outro diretório, como /home/nb050/test, use:
        // String url = "jdbc:h2:/home/nb050/test";

        String user = "sa";  // Usuário padrão
        String password = "";  // Senha padrão

        // Comando SQL para criar a tabela
        String createTableSQL = "CREATE TABLE IF NOT EXISTS users ("
                                + "id INT PRIMARY KEY AUTO_INCREMENT, "
                                + "user VARCHAR(50) NOT NULL, "
                                + "senha VARCHAR(50) NOT NULL,"
                                + "email VARCHAR(50) NOT NULL);";

        try (Connection conn = DriverManager.getConnection(url, user, password);
             Statement stmt = conn.createStatement()) {
            
            // Criar a tabela no banco de dados
            stmt.execute(createTableSQL);
            System.out.println("Tabela 'usuarios' criada com sucesso!");


        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
