import java.util.List;
import java.util.Arrays;

public class RnaTranscription {
    public String transcribeLetter(String letter) {
        switch (letter) {
            case "G":
                return "C";
            case "C":
                return "G";
            case "T":
                return "A";
            case "A":
                return "U";
        }

        return "";
    }

    public String transcribe(String dnaStrand) {
        List<String> nucleotides = Arrays.asList(dnaStrand.split(""));
        String complements = nucleotides.stream()
            .map(s -> this.transcribeLetter(s))
            .reduce("", (p, s) -> p + s);
        return complements;
    }
}
