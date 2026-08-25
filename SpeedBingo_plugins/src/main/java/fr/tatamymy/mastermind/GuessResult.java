package fr.tatamymy.mastermind;

public record GuessResult(int correctPositions, int misplacedColors) {
    public boolean won(int codeLength) {
        return correctPositions == codeLength;
    }
}
