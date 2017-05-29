import java.util.List;
import java.util.Arrays;

public class PangramChecker {

    public boolean isPangram(String input) {
        List<String> characters = Arrays.asList(input.split(""));

        List<String> missingCharacters = Arrays.asList((Arrays.asList("abcdefghijklmnopqrstuvwxyz".split(""))).stream()
            .filter(c -> !characters.contains(c))
            .toArray(String[]::new));

        return missingCharacters.size() == 0;
    }

}
