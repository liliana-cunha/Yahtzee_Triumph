% chooseBestCategory
% This function is made to choose the highest-scoring category
% Gideon Buddenhagen

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
