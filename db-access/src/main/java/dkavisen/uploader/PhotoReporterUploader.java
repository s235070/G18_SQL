package dkavisen.uploader;

import dkavisen.loader.PhotoReporterLoader;
import dkavisen.model.relations.PhotoReporter;
import dkavisen.uploader.PhotoReporterUploader;
import dkavisen.model.elements.Shoots;
import dkavisen.model.elements.Photo;
import dkavisen.model.elements.Reporter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.SQLIntegrityConstraintViolationException;
import java.sql.Statement;
import java.util.Scanner;

public class PhotoReporterUploader {
    public void upload(PhotoReporter photoReporter, Connection connection){

        String sql = "INSERT INTO photo (pTitle, shotDate) VALUES (?, ?)";

        try (
            // Establishing connection
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
        ) {

            preparedStatement.setString(1, photoReporter.photo().title());
            preparedStatement.setDate(2, new java.sql.Date(photoReporter.photo().date().getTime()));

            preparedStatement.executeUpdate(); // Execute the query for photos

            sql = "INSERT INTO journalist  (cpr, fname, lname, street, civic, city, zip, country) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
            PreparedStatement preparedStatement2 = connection.prepareStatement(sql);
            preparedStatement2.setInt(1, photoReporter.reporter().cpr());
            preparedStatement2.setString(2, photoReporter.reporter().firstName());
            preparedStatement2.setString(3, photoReporter.reporter().lastName());
            preparedStatement2.setString(4, photoReporter.reporter().streetName());
            preparedStatement2.setInt(5, photoReporter.reporter().civicNumber());
            preparedStatement2.setString(6, null);
            preparedStatement2.setInt(7, photoReporter.reporter().zipCode());
            preparedStatement2.setString(8, photoReporter.reporter().country());

            preparedStatement2.executeUpdate(); // Execute the query for reporter

            sql = "INSERT INTO shoots  (cpr, pTitle) VALUES (?, ?)";
            PreparedStatement preparedStatement1 = connection.prepareStatement(sql);
            preparedStatement1.setInt(1, photoReporter.shoots().cpr());
            preparedStatement1.setString(2, photoReporter.shoots().pTitle());

            preparedStatement1.executeUpdate(); // Execute the query for shoots

        }catch (SQLIntegrityConstraintViolationException e) {
            System.out.println("File Already Uploaded: " + photoReporter.photo().title());
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}


