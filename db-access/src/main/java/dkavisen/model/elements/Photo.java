package dkavisen.model.elements;

import java.text.SimpleDateFormat;
import java.util.Date;

public record Photo (
    String title,
    Date date
) {
    @Override
    public String toString() {
        final String D = ";";
        final SimpleDateFormat dateFormatter = new SimpleDateFormat("yyyyMMdd");

        return title +D + dateFormatter.format(date);
    }
}
