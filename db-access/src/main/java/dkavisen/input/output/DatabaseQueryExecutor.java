package dkavisen.input.output;
import java.sql.*;

public class DatabaseQueryExecutor {
    public static void printQuery(String table, String password){
        final String url = "jdbc:mysql://localhost:3306/project";
        final String user = "root";

        try (
            // Establishing connection
            Connection connection = DriverManager.getConnection(url, user, password);
            Statement stmt = connection.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
        ) {
            System.out.println();

            try {
                ResultSet rs = stmt.executeQuery("SELECT * FROM " + table + ";");
                ResultSetMetaData rsmd = rs.getMetaData();
                int columnsNumber = rsmd.getColumnCount();
                int[] columnWidths = new int[columnsNumber];

                for (int i = 1; i <= columnsNumber; i++) {
                    columnWidths[i - 1] = rsmd.getColumnName(i).length();
                    }
                while (rs.next()) {
                    for (int i = 1; i <= columnsNumber; i++) {
                        columnWidths[i - 1] = Math.max(columnWidths[i - 1], rs.getString(i) != null ? rs.getString(i).length() : 0);
                    }
                }

                rs.beforeFirst();

                for (int i = 1; i <= columnsNumber; i++) {
                    System.out.print(String.format("%-" + columnWidths[i - 1] + "s  ", rsmd.getColumnName(i)));
                }
                System.out.println();

                while (rs.next()) {
                    for (int i = 1; i <= columnsNumber; i++) {
                        String columnValue = rs.getString(i) == null ? "NULL" : rs.getString(i);
                        System.out.print(String.format("%-" + columnWidths[i - 1] + "s  ", columnValue));
                    }
                    System.out.println();
                }
            } catch (SQLException e) {
                System.out.println("Error executing query: " + e.getMessage());
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
