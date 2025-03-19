% playYahtzeeGame
% Main function integrating all components of the Yahtzee game
% Gideon Buddenhagen

function playYahtzeeGame()
    disp('🎲 Starting Yahtzee Game...');

    % Step 1: Get final dice after Liliana's function (user determines rerolls)
    finalDice = rollDice(); 

    % Step 2: Calculate all scores using Sawyer's function
    scoreArray = score;

    % Step 3: Choose the best scoring category
    [bestCategory, bestScore] = chooseBestCategory(scoreArray);

    % Step 4: Display results
    fprintf('\nFinal Dice: [%d %d %d %d %d]\n', finalDice);
    fprintf('Best Scoring Category: %s\n', bestCategory);
    fprintf('Score Awarded: %d\n', bestScore);
    disp('🎮 Game Over.');

end
