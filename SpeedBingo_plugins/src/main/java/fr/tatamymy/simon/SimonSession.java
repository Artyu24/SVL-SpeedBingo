package fr.tatamymy.simon;

import java.util.ArrayList;
import java.util.List;
import java.util.random.RandomGenerator;

final class SimonSession {
    enum Answer { CORRECT, ROUND_COMPLETE, WRONG }
    private final List<Integer> sequence = new ArrayList<>();
    private int answerIndex;
    private boolean acceptingInput;

    void addRandom(RandomGenerator random) {
        sequence.add(random.nextInt(1, 5));
        answerIndex = 0;
        acceptingInput = false;
    }
    Answer answer(int value) {
        if (!acceptingInput || value != sequence.get(answerIndex)) return Answer.WRONG;
        answerIndex++;
        if (answerIndex == sequence.size()) { acceptingInput = false; return Answer.ROUND_COMPLETE; }
        return Answer.CORRECT;
    }
    List<Integer> sequence() { return List.copyOf(sequence); }
    int round() { return sequence.size(); }
    boolean acceptingInput() { return acceptingInput; }
    void startInput() { answerIndex = 0; acceptingInput = true; }
}
