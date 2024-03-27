package dkavisen.input.output;
import java.sql.*;
import java.util.Scanner;

public class DatabaseQueryExecutor {
    public void printQuery() {
        final String dbURL = "jdbc:mysql://localhost:3306/project";
        final String user = "root";
        final String password = "mypassword";

        // SQL query placeholder
        String sqlQuery;

        try (
            Connection connection = DriverManager.getConnection(dbURL, user, password);
            Statement stmt = connection.createStatement();
            Scanner scanner = new Scanner(System.in);
        ) {
            while (true) {
                System.out.println("\nEnter a SELECT SQL query");
                sqlQuery = scanner.nextLine();

                try {
                    ResultSet rs = stmt.executeQuery(sqlQuery);
                    ResultSetMetaData rsmd = rs.getMetaData();
                    int columnsNumber = rsmd.getColumnCount();

                    for (int i = 1; i <= columnsNumber; i++) {
                        if (i > 1) System.out.print(",  ");
                        System.out.print(rsmd.getColumnName(i));
                    }
                    System.out.println();

                    while (rs.next()) {
                        for (int i = 1; i <= columnsNumber; i++) {
                            if (i > 1) System.out.print(",  ");
                            System.out.print(rs.getString(i));
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
