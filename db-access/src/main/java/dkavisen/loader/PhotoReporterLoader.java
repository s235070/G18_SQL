package dkavisen.loader;

import java.io.File;
import java.io.FileNotFoundException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

import dkavisen.model.elements.Photo;
import dkavisen.model.elements.Reporter;
import dkavisen.model.elements.Shoots;
import dkavisen.model.relations.PhotoReporter;

public class PhotoReporterLoader {
    public ArrayList<PhotoReporter> from(String filename) throws FileNotFoundException, NumberFormatException, ParseException {
        ArrayList<PhotoReporter> list = new ArrayList<>();
        Scanner scanner = new Scanner(new File(filename));
        SimpleDateFormat dateParser = new SimpleDateFormat("yyyyMMdd");
        while (scanner.hasNextLine()) {
            String[] words = scanner.nextLine().split(";");
            list.add(new PhotoReporter(
                new Reporter(
                    Integer.parseInt(words[2]),
                    words[3],
                    words[4],
                    words[5],
                    Integer.parseInt(words[6]),
                    Integer.parseInt(words[7]),
                    words[8]),
                new Shoots(
                    Integer.parseInt(words[2]),
                    words[0]),
                new Photo(
                    words[0],
                    dateParser.parse(words[1])
            )));
        }
        scanner.close();
        return list;
    }
}
