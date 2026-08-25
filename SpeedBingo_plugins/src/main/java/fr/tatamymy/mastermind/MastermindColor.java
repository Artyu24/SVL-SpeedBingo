package fr.tatamymy.mastermind;

import java.text.Normalizer;
import java.util.Arrays;
import java.util.Locale;
import java.util.Optional;

public enum MastermindColor {
    VIOLET("violet", "purple"),
    BLANC("blanc", "white"),
    BLEU("bleu", "blue"),
    ROSE("rose", "pink"),
    JAUNE("jaune", "yellow"),
    ORANGE("orange"),
    BLEU_CLAIR("bleu_clair", "bleuclair", "light_blue", "lightblue"),
    VERT_CLAIR("vert_clair", "vertclair", "lime"),
    MARRON("marron", "brown"),
    ROUGE("rouge", "red");

    private final String[] names;

    MastermindColor(String... names) {
        this.names = names;
    }

    public String displayName() {
        return names[0].replace('_', ' ');
    }

    public static Optional<MastermindColor> parse(String input) {
        String normalized = normalize(input);
        return Arrays.stream(values())
                .filter(color -> Arrays.stream(color.names).anyMatch(name -> normalize(name).equals(normalized)))
                .findFirst();
    }

    private static String normalize(String value) {
        return Normalizer.normalize(value, Normalizer.Form.NFD)
                .replaceAll("\\p{M}", "")
                .toLowerCase(Locale.ROOT)
                .replace('-', '_')
                .replace(' ', '_');
    }
}
