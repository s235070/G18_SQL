package dkavisen.input.output;
import java.sql.*;
import java.util.Scanner;

public class DatabaseQueryExecutor {
    public void printQuery(){
        final String dbURL = "jdbc:mysql://localhost:3306/project";
        final String user = "root";
        final String password = "mypassword";

        try (
            Connection connection = DriverManager.getConnection(dbURL, user, password);
            Statement stmt = connection.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
            Scanner scanner = new Scanner(System.in);
        ) {
            System.out.println("\n*** Connected to the database. ***");

            String sqlQuery;
            while (true) {
                System.out.println("\nEnter a SELECT SQL query or type 'exit' to quit:");
                sqlQuery = scanner.nextLine();
                System.out.println();

                if ("exit".equalsIgnoreCase(sqlQuery)) {
                    System.out.println("Exiting...");
                    break;
                }

                try {
                    ResultSet rs = stmt.executeQuery(sqlQuery);
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
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
