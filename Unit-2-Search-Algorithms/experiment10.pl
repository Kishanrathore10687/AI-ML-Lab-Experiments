% Experiment 10: Simulated Annealing

:- use_module(library(random)).

% Calculate the value of a state
objective(X, Score) :-
    Score is 100 - (X - 7) * (X - 7).

% Find neighboring states
neighbor(X, Y) :-
    Y is X + 1,
    Y =< 10.

neighbor(X, Y) :-
    Y is X - 1,
    Y >= 0.

% Choose a random neighbor
random_neighbor(X, Y) :-
    findall(N, neighbor(X, N), Neighbors),
    random_member(Y, Neighbors).

% Decide whether to accept a new state
accept_move(Delta, _) :-
    Delta >= 0,
    !.

accept_move(Delta, Temp) :-
    Probability is exp(Delta / Temp),
    random(R),
    R < Probability.

% Start simulated annealing
simulated_annealing(Start, Best, BestScore) :-
    objective(Start, Score),
    anneal(Start, Score, Start, Score, 10.0, 100,
           Best, BestScore).

% Stop when the temperature is low or steps are finished
anneal(_, _, Best, BestScore, Temp, Steps, Best, BestScore) :-
    (Steps =< 0 ; Temp < 0.01),
    !.

% Search for a better solution
anneal(Current, CurrentScore, Best, BestScore,
       Temp, Steps, FinalBest, FinalScore) :-

    random_neighbor(Current, Next),
    objective(Next, NextScore),

    Delta is NextScore - CurrentScore,

    (accept_move(Delta, Temp) ->
        NewCurrent = Next,
        NewCurrentScore = NextScore
    ;
        NewCurrent = Current,
        NewCurrentScore = CurrentScore
    ),

    (NextScore > BestScore ->
        NewBest = Next,
        NewBestScore = NextScore
    ;
        NewBest = Best,
        NewBestScore = BestScore
    ),

    NewTemp is Temp * 0.95,
    NewSteps is Steps - 1,

    anneal(NewCurrent, NewCurrentScore,
           NewBest, NewBestScore,
           NewTemp, NewSteps, FinalBest, FinalScore).