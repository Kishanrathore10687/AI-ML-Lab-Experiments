% Experiment 9: Hill Climbing Algorithm

% Connections between nodes
hill_edge(a, b).
hill_edge(a, c).
hill_edge(b, d).
hill_edge(b, e).
hill_edge(c, f).
hill_edge(e, g).
hill_edge(f, g).

% Heuristic values for reaching the goal g
heuristic(a, 5).
heuristic(b, 4).
heuristic(c, 2).
heuristic(d, 6).
heuristic(e, 1).
heuristic(f, 1).
heuristic(g, 0).

% Connections in both directions
hill_connected(X, Y) :-
    hill_edge(X, Y).

hill_connected(X, Y) :-
    hill_edge(Y, X).

% Start the hill climbing search
hill_climbing(Start, Goal, Path) :-
    heuristic(Start, H),
    climb(Start, Goal, [Start], H, RevPath),
    reverse(RevPath, Path).

% Stop when the goal is reached
climb(Goal, Goal, Path, _, Path).

% Move to the neighbor with the lowest heuristic value
climb(Current, Goal, Visited, CurrentH, Path) :-
    findall(H-Next,
        (hill_connected(Current, Next),
         \+ member(Next, Visited),
         heuristic(Next, H),
         H < CurrentH),
        Neighbors),
    sort(Neighbors, [NextH-Next|_]),
    climb(Next, Goal, [Next|Visited], NextH, Path).