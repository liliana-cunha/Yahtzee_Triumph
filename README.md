# Yahtzee_Triumph
# MATLAB Yahtzee Project

## Overview
This is a MATLAB simulation of **Yahtzee**, where the computer plays a full game automatically — rolling dice, evaluating scores, and choosing optimal categories according to official game rules. The game is text-based, focusing on logic and scoring without user interaction.

---

## Team Members
- Liliana Cunha
- Sawyer Strasberg
- Gideon Buddenhagen

---

## Project Structure

| File Name                     | Purpose                                                  | Owner   |
|------------------------------|---------------------------------------------------------|---------|
| `rollDice.m`                  | Simulates dice rolls and re-rolls.                      | Liliana |
| `decideReroll.m`              | Analyzes dice and determines re-roll strategy.          | Liliana |
| `scoreFixedPatterns.m`       | Scores fixed patterns (e.g., Full House, Yahtzee).      | Sawyer  |
| `scoreStraights.m`           | Scores straights (Small and Large Straight).            | Gideon  |
| `chooseBestCategory.m`       | Chooses the highest scoring category.                  | Gideon  |
| `playYahtzeeGame.m`          | Runs the game by integrating all components.            | Gideon & Group |

---

## How to Run the Program

1. Clone this repository:
```bash
git clone https://github.com/your-repo/matlab-yahtzee.git
```

2. Open MATLAB and navigate to the project folder.

3. Run the main game script:
```matlab
playYahtzeeGame
```

4. The game will output:
- Dice rolls and re-roll decisions.
- Chosen scoring category and earned points.
- Final total score.

---

## Division of Labor

### Liliana Cunha
- Dice rolling & re-rolling logic.
- Pattern recognition for re-rolls.
- Dice value storage and formatted output.

### Sawyer Strasberg
- Scoring for fixed patterns: Three/Four-of-a-Kind, Full House, Yahtzee, Chance.
- Returning available scores for selection.

### Gideon Buddenhagen
- Scoring for straights.
- Optimal category selection logic.
- Game flow management, final integration, and output formatting.

---

## Timeline
| Date         | Task                                            |
|--------------|-------------------------------------------------|
| March 10-12  | Finalize tasks and GitHub setup.                |
| March 13-15  | Dice rolling & re-rolling logic.                |
| March 16-17  | Scoring logic (Fixed Patterns & Straights).     |
| March 18-19  | Game integration, formatting, and debugging.    |
| March 20     | Final testing and submission.                   |

---

## Deliverables
- Fully functional MATLAB Yahtzee game.
- Sample game output (dice rolls, category selections, final score).
- Well-documented code with explanations of each function.

---

## Collaboration Workflow
- Separate branches for each component:
  - `liliana-dice-logic`
  - `sawyer-scoring`
  - `gideon-straights-gameflow`
- Regular merges and testing to main branch.

---

