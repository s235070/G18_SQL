package dkavisen;

import dkavisen.loader.PhotoReporterLoader;
import dkavisen.model.relations.PhotoReporter;
import dkavisen.uploader.PhotoReporterUploader;
import dkavisen.model.elements.Shoots;
import dkavisen.model.elements.Photo;
import dkavisen.model.elements.Reporter;

import java.io.FileNotFoundException;
import java.text.ParseException;
import java.util.ArrayList;

class Main {
    public static void main(String[] args) {
        PhotoReporterLoader loader = new PhotoReporterLoader();
        PhotoReporterUploader uploader = new PhotoReporterUploader();

        try {
            ArrayList<PhotoReporter> list = loader.from("uploads.csv");
            list.stream().forEach(uploader::upload);
        } catch (FileNotFoundException | ParseException e) {
            e.printStackTrace();
        }
    }
}
