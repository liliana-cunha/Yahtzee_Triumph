
%Liliana Cunha - dice rolling functions
function finalDice = rollDice()
   numDice = 5; % Number of dice to roll
   maxRolls = 3; % Max number of rolls (initial roll + 2 re-rolls)
   dice = randi([1,6], 1, numDice); % First roll
   disp("Roll 1:");
   disp(dice);
   for roll = 2:maxRolls
       reRolls = UserReRollChoice(dice); % Getting user input for which dice to re-roll
       % Stop if the player decides not to re-roll
       if ~any(reRolls)
           disp("You chose not to re-roll.");
           break;
       end
      
       % Re-roll only the selected dice
       dice = DiceRoll(dice, reRolls);
       disp("Roll " + roll + ":");
       disp(dice);
   end
  
   finalDice = dice; % Final result after up to 3 rolls
   disp("Final result:");
   disp(finalDice);
end

function newDice = DiceRoll(currentDice, reRolls)
   newDice = currentDice; % Keep existing dice values
   newDice(reRolls) = randi([1,6], 1, sum(reRolls)); % Only re-roll selected dice
end
function reRolls = UserReRollChoice(dice)
   % Ask the user which dice to re-roll
   disp("Enter the positions of the dice you want to RE-ROLL (1-5), separated by spaces, then press 'Enter'");
   disp("For example, enter '1 3 4' to RE-ROLL dice in positions 1, 3, and 4.");
   disp("If you'd prefer not to re-roll, press 'Enter'");
   userInput = input('', 's');
  
   % Initialize reRolls as false (keeping all dice by default)
   reRolls = false(1, length(dice));
   if ~isempty(userInput)
       rollAgain = str2num(userInput); % Convert input string to numeric array
      
       % Validate indices
       rollAgain = rollAgain(rollAgain >= 1 & rollAgain <= length(dice));
       % Mark selected dice for re-roll
       reRolls(rollAgain) = true;
   end
end


%Sawyer Strasberg - scoring code
function score = yahtzeeScorer(finalDice)
    score = zeros(1, 13); % Scorecard for all 13 categories, ready to be called later %
    yahtzeeBonus = 0; % Tracks extra Yahtzee bonuses (optional Yahtzee rule) %

    for r = 1:size(finalDice, 1) % should run 13 times, but here in case of extra yahtzees %
        dice = sort(finalDice(r, :)); % new variable 'dice' which is just finalDice sorted %
        counts = histcounts(dice, 1:7); % gives amount of each number in dice. other functions will use this %
        scores = [50 * (any(counts == 5)), ... % checks for Yahtzee
                  40 * (isequal(counts(1:5), [1 1 1 1 1]) || isequal(counts(2:6), [1 1 1 1 1])), ... % checks for Large Straight
                  30 * any(all([counts(1:4); counts(2:5); counts(3:6)] >= 1, 1)), ... % checks for Small Straight
                  25 * (any(counts == 3) && any(counts == 2)), ... % checks for Full House
                  sum(dice) * any(counts >= 4), ... % checks for Four of a Kind
                  sum(dice) * any(counts >= 3), ... % checks for Three of a Kind
                  counts .* (1:6)]; % sums the bins elementwise for Ones - Sixes

                  % output should be a 13x1 array of scores for every individual turn %

        loss = [50, 40, 30, 25, sum(dice), sum(dice), 5, 10, 15, 20, 25, 30] - scores;
        loss(score > 0) = inf; % ignore the filled categories
        [~, idx] = min(loss); % find the score with the least point loss, without any ties %
        score(idx) = scores(idx); % assigns best score to output variable %

        if idx == 1 && score(1) == 50 && r > 1 % extra Yahtzee calculation
            yahtzeeBonus = yahtzeeBonus + 100;
        end
    end

    if sum(score(7:12)) >= 63, score = score + [35, zeros(1, 12)]; end % upper section bonus, +35 if ≥ 65 %
    score(1) = score(1) + yahtzeeBonus; % add Yahtzee bonuses to score
end

%%finalDice = []; % place holder, this won't actually affect anything. just resets finalDice for the next turn %
 %%function score = yahtzeeScorer(finalDice)

 %Gideon Buddenhagen - choosing best category - This function is made to choose the highest-scoring category
function [bestCategory, bestScore] = chooseBestCategory(scoreArray)
    % Input will be:
    % scoreArray - 1x13 array from yahtzeeScorer.m containing scores for
    % all categories

    % Output will be:
    % bestCategory - string of best scoring category
    % bestScore - Numerical score of that category 

    % Yahtzee category names matching to the 1x13 scoring array

    categories = {...
        'Yahtzee', 'Large Straight', 'Small Straight', 'Full House', ...
        'Four of a Kind', 'Three of a Kind', 'Ones', 'Twos', 'Threes', ...
        'Fours', 'Fives', 'Sixes', 'Upper Section Bonus'};

    % Find the highest scoring category
    [bestScore, idx] = max(scoreArray);
    bestCategory = categories{idx};
end


% playYahtzeeGame
% Main function integrating all components of the Yahtzee game
% Gideon Buddenhagen

function playYahtzeeGame()
    disp('🎲 Starting Yahtzee Game...');

    % Step 1: Get final dice after Liliana's function (user determines rerolls)
    finalDice = rollDice(); 

    % Step 2: Calculate all scores using Sawyer's final value
    score = yahtzeeScorer(finalDice);
  
    % Step 3: Choose the best scoring category
    [bestCategory, bestScore] = chooseBestCategory(scoreArray);

    % Step 4: Display results
    fprintf('\nFinal Dice: [%d %d %d %d %d]\n', finalDice);
    fprintf('Best Scoring Category: %s\n', bestCategory);
    fprintf('Score Awarded: %d\n', bestScore);
    disp('🎮 Game Over.');

end

