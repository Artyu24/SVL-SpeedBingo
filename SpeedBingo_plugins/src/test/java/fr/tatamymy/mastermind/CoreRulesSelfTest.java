package fr.tatamymy.mastermind;

import java.util.Arrays;
import java.util.Collections;
import java.util.List;

public final class CoreRulesSelfTest {
    public static void main(String[] args) {
        verify(
                new GuessResult(3, 2),
                evaluate("rouge rouge bleu jaune blanc", "rouge bleu rouge jaune blanc"),
                "solution avec deux rouges"
        );
        verify(
                new GuessResult(1, 0),
                MastermindRules.evaluate(
                        colors("rouge bleu jaune blanc vert_clair"),
                        Collections.nCopies(5, MastermindColor.ROUGE)
                ),
                "une couleur proposée trop de fois"
        );
        verify(
                new GuessResult(0, 4),
                evaluate("rouge rouge bleu bleu jaune", "bleu bleu rouge rouge rouge"),
                "plusieurs doublons mal placés"
        );
        System.out.println("Tous les tests de doublons sont valides.");
    }

    private static GuessResult evaluate(String solution, String guess) {
        return MastermindRules.evaluate(colors(solution), colors(guess));
    }

    private static List<MastermindColor> colors(String values) {
        return Arrays.stream(values.split(" "))
                .map(value -> MastermindColor.parse(value).orElseThrow())
                .toList();
    }

    private static void verify(GuessResult expected, GuessResult actual, String scenario) {
        if (!expected.equals(actual)) {
            throw new AssertionError(scenario + " : attendu " + expected + ", obtenu " + actual);
        }
    }
}
