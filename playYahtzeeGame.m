%This is our final Yahtzee game! Type playYahtzeeGame to begin!

function playYahtzeeGame()
    disp('🎲 Starting Yahtzee Game...');

    % Step 1: Get final dice after Liliana's function (user determines rerolls)
    finalDice = rollDice(); 

    % Step 2: Calculate all scores using Sawyer's function
    score = yahtzeeScorer(finalDice);

    % Step 3: Choose the best scoring category
    [bestCategory, bestScore] = chooseBestCategory(score);

    % Step 4: Display results
    fprintf('\nFinal Dice: [%d %d %d %d %d]\n', finalDice);
    fprintf('Best Scoring Category: %s\n', bestCategory);
    fprintf('Score Awarded: %d\n', bestScore);
    disp('🎮 Game Over.');

end
