function score = yahtzeeScorer(finalDice)
    score = zeros(1, 13); % Scorecard for all 13 categories, ready to be called later %
    yahtzeeBonus = 0; % Tracks extra Yahtzee bonuses (optional Yahtzee rule) %

    for r = 1:size(finalDice, 1) % should run 13 times, but here in case of extra yahtzees %
        dice = sort(finalDice(r, :)); % new variable 'dice' which is just rolls sorted %
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
