package dkavisen.examples;

import java.util.Date;

public class PhotoAndReporter {
	private final ReporterExample reporter;
	private final PhotoExample photo;

	public PhotoAndReporter(String title, Date date, Integer cpr, String firstName, String lastName, String streetName, Integer civicNumber, Integer zipCode, String country) {
		reporter = new ReporterExample(cpr, firstName, lastName, streetName, civicNumber, zipCode, country);
		photo = new PhotoExample(title, date);
	}

	public ReporterExample getReporter() {
		return reporter;
	}

	public PhotoExample getPhoto() {
		return photo;
	}
}
