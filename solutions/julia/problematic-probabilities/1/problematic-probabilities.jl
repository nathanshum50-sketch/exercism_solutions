function rationalize(successes, trials)
    return successes.//trials
end

function probabilities(successes, trials)
    return float.(successes./trials)
end

function checkmean(successes, trials)
    rational = sum(successes.//trials)//length(trials)
    sum(probabilities(successes, trials))/length(trials) == float(rational) && return true
    return rational
end

function checkprob(successes, trials)
    rational = prod(successes)//prod(trials)
    prod(probabilities(successes, trials)) == float(rational) && return true
    return rational
end
