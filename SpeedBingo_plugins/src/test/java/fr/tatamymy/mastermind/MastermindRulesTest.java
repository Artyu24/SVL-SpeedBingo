package fr.tatamymy.mastermind;

import org.junit.jupiter.api.Test;

import java.util.List;

import static org.junit.jupiter.api.Assertions.assertEquals;

class MastermindRulesTest {
    @Test
    void acceptsDuplicateColorsInSolution() {
        GuessResult result = MastermindRules.evaluate(
                colors("rouge", "rouge", "bleu", "jaune", "blanc"),
                colors("rouge", "bleu", "rouge", "jaune", "blanc")
        );
        assertEquals(new GuessResult(3, 2), result);
    }

    @Test
    void doesNotCountAColorMoreOftenThanItExistsInSolution() {
        GuessResult result = MastermindRules.evaluate(
                colors("rouge", "bleu", "jaune", "blanc", "vert_clair"),
                colors("rouge", "rouge", "rouge", "rouge", "rouge")
        );
        assertEquals(new GuessResult(1, 0), result);
    }

    @Test
    void countsDuplicateMisplacedColorsOnlyOncePerAvailableOccurrence() {
        GuessResult result = MastermindRules.evaluate(
                colors("rouge", "rouge", "bleu", "bleu", "jaune"),
                colors("bleu", "bleu", "rouge", "rouge", "rouge")
        );
        assertEquals(new GuessResult(0, 4), result);
    }

    private static List<MastermindColor> colors(String... values) {
        return java.util.Arrays.stream(values)
                .map(value -> MastermindColor.parse(value).orElseThrow())
                .toList();
    }
}
