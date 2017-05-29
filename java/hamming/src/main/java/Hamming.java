import java.util.List;
import java.util.Arrays;
import java.util.stream.IntStream;

public class Hamming {
    String left;
    String right;

    Hamming(String leftStrand, String rightStrand) {
        left = leftStrand;
        right = rightStrand;

        if (leftStrand.length() != rightStrand.length()) {
            throw new java.lang.IllegalArgumentException();
        }
    }

    int getHammingDistance() {
        char[] leftChars = left.toCharArray();
        char[] rightChars = right.toCharArray();

        int distance = IntStream.range(0, leftChars.length)
            .reduce(0, (p, i) -> {
                if (leftChars[i] == rightChars[i]) {
                    return p;
                }

                return p += 1;
            });

        return distance;
    }

}
