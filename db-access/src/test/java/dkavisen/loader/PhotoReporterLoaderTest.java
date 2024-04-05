package dkavisen.loader;

import dkavisen.model.relations.PhotoReporter;
import org.junit.jupiter.api.Test;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.net.URL;
import java.nio.file.Files;
import java.nio.file.Path;
import java.text.ParseException;
import java.util.ArrayList;

import static org.junit.jupiter.api.Assertions.*;
import static org.junit.jupiter.api.Assertions.assertTrue;
import static org.junit.jupiter.api.Assertions.fail;

class PhotoReporterLoaderTest {

    @Test
    void testFromSuccess() {
        try {
            // Prepare a temporary test file
            String tempFileContent = "photoId;date;reporterId;firstName;lastName;email;phone;yearOfBirth;numberOfPhotos;comment\n"
                    + "1;20240101;101;John;Doe;john.doe@example.com;5551234;1980;5;Great shots";
            Path tempFilePath = Files.createTempFile("photo_reporter_test", ".csv");
            File tempFile = tempFilePath.toFile();
            tempFile.deleteOnExit(); // Ensure the file is deleted after tests
            Files.writeString(tempFilePath, tempFileContent);

            PhotoReporterLoader loader = new PhotoReporterLoader();
            ArrayList<PhotoReporter> result = loader.from(tempFile.getAbsolutePath());

            // Assertions
            assertFalse(result.isEmpty(), "The result should not be empty.");
            assertEquals(1, result.size(), "There should be one PhotoReporter object in the list.");
            // Add more detailed assertions here
        } catch (IOException e) {
            fail("Failed to create or write to the temporary file.");
        } catch (Exception e) {
            fail("An unexpected exception occurred: " + e.getMessage());
        }
    }

    @Test
    void testFromFileNotFoundException() {
        PhotoReporterLoader loader = new PhotoReporterLoader();
        assertThrows(FileNotFoundException.class, () -> loader.from("nonexistent.csv"),
                "FileNotFoundException should be thrown for a nonexistent file.");
    }

    @Test
    void testFromDateParseException() {
        PhotoReporterLoader loader = new PhotoReporterLoader();
        // Get the file from the resources folder
        ClassLoader classLoader = getClass().getClassLoader();
        URL resource = classLoader.getResource("invalid_date_format.csv");
        assertNotNull(resource, "Resource file not found.");

        File file = new File(resource.getFile());
        assertThrows(ParseException.class, () -> loader.from(file.getAbsolutePath()),
                "ParseException should be thrown for unparsable dates.");
    }


    @Test
    void testFromEmptyFile() throws IOException, ParseException {
        // Create an empty temp file
        Path tempFilePath = Files.createTempFile("empty_file_test", ".csv");
        File tempFile = tempFilePath.toFile();
        tempFile.deleteOnExit();

        PhotoReporterLoader loader = new PhotoReporterLoader();
        ArrayList<PhotoReporter> result = loader.from(tempFile.getAbsolutePath());

        assertTrue(result.isEmpty(), "The result should be empty for an empty file.");
    }

}
