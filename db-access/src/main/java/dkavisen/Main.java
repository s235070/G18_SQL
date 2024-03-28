package dkavisen;

import dkavisen.input.output.DatabaseQueryExecutor;
import dkavisen.loader.PhotoReporterLoader;
import dkavisen.model.relations.PhotoReporter;
import dkavisen.uploader.PhotoReporterUploader;

import java.io.FileNotFoundException;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.Scanner;

class Main {
    public static void main(String[] args) {
        PhotoReporterLoader loader = new PhotoReporterLoader();
        PhotoReporterUploader uploader = new PhotoReporterUploader();
        Scanner scanner = new Scanner(System.in);

        System.out.println("Which file do you want to upload from?");
        try {
            ArrayList<PhotoReporter> list = loader.from(scanner.nextLine() + ".csv");
            list.stream().forEach(uploader::upload);
            System.out.println("Upload successfully completed");
        } catch (FileNotFoundException | ParseException e) {
            System.out.println("Something went wrong! " + e.getMessage());
        }

        System.out.println("Now running SELECT queries, name the table to be queried");
        System.out.println("Exit by writing \"exit\"");
        while (true) {
            String line = scanner.nextLine();
            if (line.equalsIgnoreCase("exit")) break;
            else DatabaseQueryExecutor.printQuery(line);
        }

        System.out.println("Now exiting program...");
        scanner.close();
    }
}
