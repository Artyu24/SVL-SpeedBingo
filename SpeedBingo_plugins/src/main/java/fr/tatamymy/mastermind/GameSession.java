package fr.tatamymy.mastermind;

import java.util.ArrayList;
import java.util.List;

final class GameSession {
    private final List<MastermindColor> solution;
    private final List<List<MastermindColor>> guesses = new ArrayList<>();

    GameSession(List<MastermindColor> solution) {
        this.solution = List.copyOf(solution);
    }

    GuessResult guess(List<MastermindColor> colors) {
        guesses.add(List.copyOf(colors));
        return MastermindRules.evaluate(solution, colors);
    }

    int attempts() {
        return guesses.size();
    }

    List<MastermindColor> solution() {
        return solution;
    }
}
