package fr.tatamymy.mastermind;

import java.util.EnumMap;
import java.util.List;
import java.util.Map;

public final class MastermindRules {
    private MastermindRules() {
    }

    public static GuessResult evaluate(List<MastermindColor> solution, List<MastermindColor> guess) {
        if (solution.size() != guess.size()) {
            throw new IllegalArgumentException("La solution et la proposition doivent avoir la même taille.");
        }

        int correct = 0;
        Map<MastermindColor, Integer> remainingSolution = new EnumMap<>(MastermindColor.class);
        Map<MastermindColor, Integer> remainingGuess = new EnumMap<>(MastermindColor.class);

        for (int index = 0; index < solution.size(); index++) {
            MastermindColor expected = solution.get(index);
            MastermindColor proposed = guess.get(index);
            if (expected == proposed) {
                correct++;
            } else {
                remainingSolution.merge(expected, 1, Integer::sum);
                remainingGuess.merge(proposed, 1, Integer::sum);
            }
        }

        int misplaced = 0;
        for (MastermindColor color : MastermindColor.values()) {
            misplaced += Math.min(
                    remainingSolution.getOrDefault(color, 0),
                    remainingGuess.getOrDefault(color, 0)
            );
        }
        return new GuessResult(correct, misplaced);
    }
}
