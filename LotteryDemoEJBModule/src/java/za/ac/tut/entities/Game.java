package za.ac.tut.entities;

import jakarta.persistence.*;
import java.io.Serializable;
import java.time.LocalDateTime;
import java.util.Arrays;
import java.util.List;

@Entity
public class Game implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    private LocalDateTime playedAt;
    private Double wagerAmount;

    @ElementCollection(fetch = FetchType.EAGER)
    private List<Integer> chosenNumbers; 

    private int matchedNumbers;
    private Double winnings;

    @ManyToOne
    private UsernameTBL player;

    @Enumerated(EnumType.STRING)
    private Result outcome;

    @ManyToOne
    private LottoDraw draw;

    public Game() {
    }

    public Game(LocalDateTime playedAt, Double wagerAmount, List<Integer> chosenNumbers, int matchedNumbers,
            Double winnings, UsernameTBL player, LottoDraw draw, Result outcome) {
        this.playedAt = playedAt;
        this.wagerAmount = wagerAmount;
        this.chosenNumbers = chosenNumbers;
        this.matchedNumbers = matchedNumbers;
        this.winnings = winnings;
        this.player = player;
        this.draw = draw;
        this.outcome = outcome;
    }

    public Result getOutcome() {
        return outcome;
    }

    public void setOutcome(Result outcome) {
        this.outcome = outcome;
    }

    public LottoDraw getDraw() {
        return draw;
    }

    public void setDraw(LottoDraw draw) {
        this.draw = draw;
    }

    // Getters and Setters
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public LocalDateTime getPlayedAt() {
        return playedAt;
    }

    public void setPlayedAt(LocalDateTime playedAt) {
        this.playedAt = playedAt;
    }

    public Double getWagerAmount() {
        return wagerAmount;
    }

    public void setWagerAmount(Double wagerAmount) {
        this.wagerAmount = wagerAmount;
    }

    public List<Integer> getChosenNumbers() {
        return chosenNumbers;
    }

    public void setChosenNumbers(List<Integer> chosenNumbers) {
        this.chosenNumbers = chosenNumbers;
    }

    public int getMatchedNumbers() {
        return matchedNumbers;
    }

    public void setMatchedNumbers(int matchedNumbers) {
        this.matchedNumbers = matchedNumbers;
    }

    public Double getWinnings() {
        return winnings;
    }

    public void setWinnings(Double winnings) {
        this.winnings = winnings;
    }

    public UsernameTBL getPlayer() {
        return player;
    }

    public void setPlayer(UsernameTBL player) {
        this.player = player;
    }

    public enum Result {
        WIN, PARTIAL, LOSS
    }

    @Override
    public String toString() {
        return "Game{"
                + "id=" + id
                + ", playedAt=" + playedAt
                + ", wagerAmount=" + wagerAmount
                + ", chosenNumbers=" + chosenNumbers
                + ", matchedNumbers=" + matchedNumbers
                + ", winnings=" + winnings
                + ", player=" + player.getUsername()
                + '}';
    }
}
