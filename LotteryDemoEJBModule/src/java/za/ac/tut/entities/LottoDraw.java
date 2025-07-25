package za.ac.tut.entities;

import jakarta.persistence.*;
import java.io.Serializable;
import java.time.LocalDateTime;
import java.util.List;

@Entity
public class LottoDraw implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    private LocalDateTime drawDate;

    @ElementCollection(fetch = FetchType.EAGER)
    private List<Integer> drawNumbers;

    private Double totalPool;

    public LottoDraw() {}

    public LottoDraw(LocalDateTime drawDate, List<Integer> drawNumbers, Double totalPool) {
        this.drawDate = drawDate;
        this.drawNumbers = drawNumbers;
        this.totalPool = totalPool;
    }

    // Getters and setters
    public Long getId() { return id; }
    public LocalDateTime getDrawDate() { return drawDate; }
    public void setDrawDate(LocalDateTime drawDate) { this.drawDate = drawDate; }

    public List<Integer> getDrawNumbers() { return drawNumbers; }
    public void setDrawNumbers(List<Integer> drawNumbers) { this.drawNumbers = drawNumbers; }

    public Double getTotalPool() { return totalPool; }
    public void setTotalPool(Double totalPool) { this.totalPool = totalPool; }

    public void addToPool(Double amount) {
        this.totalPool += amount;
    }
}
