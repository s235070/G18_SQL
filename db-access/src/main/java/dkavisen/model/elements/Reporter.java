package dkavisen.model.elements;

public record Reporter(
    Integer cpr,
    String firstName,
    String lastName,
    String streetName,
    Integer civicNumber,
    Integer zipCode,
    String country
) {}
