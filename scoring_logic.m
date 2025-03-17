function score = yahtzeeScorer(rolls)
    score = zeros(1, 13); % Scorecard for 13 categories
    yahtzeeBonus = 0; % Tracks extra Yahtzee bonuses

    for r = 1:size(rolls, 1) % Process each roll
        dice = sort(rolls(r, :));
        counts = histcounts(dice, 1:7);
        scores = [50 * (any(counts == 5)), ... % Yahtzee
                  40 * (isequal(counts(1:5), [1 1 1 1 1]) || isequal(counts(2:6), [1 1 1 1 1])), ... % Large Straight
                  30 * any(all([counts(1:4); counts(2:5); counts(3:6)] >= 1, 1)), ... % Small Straight
                  25 * (any(counts == 3) && any(counts == 2)), ... % Full House
                  sum(dice) * any(counts >= 4), ... % Four of a Kind
                  sum(dice) * any(counts >= 3), ... % Three of a Kind
                  counts .* (1:6)]; % Upper section (Ones - Sixes)

        loss = [50, 40, 30, 25, sum(dice), sum(dice), 5, 10, 15, 20, 25, 30] - scores;
        loss(score > 0) = inf; % Ignore filled categories
        [~, idx] = min(loss);
        score(idx) = scores(idx);

        if idx == 1 && score(1) == 50 && r > 1 % Extra Yahtzee
            yahtzeeBonus = yahtzeeBonus + 100;
        end
    end

    if sum(score(7:12)) >= 63, score = score + [35, zeros(1, 12)]; end % Upper section bonus
    score(1) = score(1) + yahtzeeBonus; % Add Yahtzee bonuses
end


rolls = [];
 function score = yahtzeeScorer(rolls)