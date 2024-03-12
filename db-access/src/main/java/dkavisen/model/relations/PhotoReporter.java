package dkavisen.model.relations;

import dkavisen.model.elements.Photo;
import dkavisen.model.elements.Reporter;
import dkavisen.model.elements.Shoots;

public record PhotoReporter(
    Reporter reporter,
    Shoots shoots,
    Photo photo
) {}
