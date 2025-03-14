%% rollDice.m
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
