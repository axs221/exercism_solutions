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
        return IntStream
            .range(0, left.length())
            .reduce(0, (p, i) -> {
                if (left.charAt(i) == right.charAt(i))
                    return p;
                return p += 1;
            });
    }

}
