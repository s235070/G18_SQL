package dkavisen.model.elements;

public record Reporter(
    Integer cpr,
    String firstName,
    String lastName,
    String streetName,
    Integer civicNumber,
    Integer zipCode,
    String country
) {
    @Override
    public String toString() {
        final String D = ";";

        return cpr + D + firstName + D + lastName + D + streetName + D + civicNumber + D + zipCode + D + country;
    }
}
