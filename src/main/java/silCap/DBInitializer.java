package silCap;

import java.sql.Connection;
import java.sql.Statement;
import java.sql.SQLException;

public class DBInitializer {

    public static void initializeDatabase() {
        try (Connection conn = DBManager.getConnection()) {
            Statement stmt = conn.createStatement();
            // Criar tabela de usuários
            String createTableSQL = "CREATE TABLE IF NOT EXISTS users (" +
                                    "id INT AUTO_INCREMENT PRIMARY KEY, " +
                                    "nome VARCHAR(100), " +
                                    "senha VARCHAR(100), " +
                                    "email VARCHAR(100));";
            stmt.execute(createTableSQL);
            System.out.println("Tabela 'usuarios' criada com sucesso.");
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
