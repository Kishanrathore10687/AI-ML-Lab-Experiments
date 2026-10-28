% Experiment 7: Greedy Best-First Search

% Graph connections
edge(a, b).
edge(a, c).
edge(b, d).
edge(b, e).
edge(c, f).
edge(e, g).
edge(f, g).

% Heuristic values for reaching goal g
heuristic(a, 5).
heuristic(b, 4).
heuristic(c, 2).
heuristic(d, 6).
heuristic(e, 1).
heuristic(f, 1).
heuristic(g, 0).

% Start the search
greedy_search(Start, Goal, Path) :-
    greedy([[Start]], Goal, [], RevPath),
    reverse(RevPath, Path).

% Find the path with the lowest heuristic value
best_path([Path|Paths], BestPath) :-
    best_path(Paths, Path, BestPath).

best_path([], BestPath, BestPath).

best_path([Path|Paths], CurrentBest, BestPath) :-
    Path = [Node|_],
    CurrentBest = [CurrentNode|_],
    heuristic(Node, H),
    heuristic(CurrentNode, CurrentH),
    (H < CurrentH ->
        NextBest = Path
    ;
        NextBest = CurrentBest
    ),
    best_path(Paths, NextBest, BestPath).

% Perform Greedy Best-First Search
greedy(Paths, Goal, Visited, Path) :-
    best_path(Paths, BestPath),
    select(BestPath, Paths, Remaining),
    BestPath = [Current|_],
    (Current == Goal ->
        Path = BestPath
    ;
        findall([Next|BestPath],
            (edge(Current, Next),
             \+ member(Next, Visited),
             \+ member(Next, BestPath)),
            NewPaths),
        append(Remaining, NewPaths, UpdatedPaths),
        greedy(UpdatedPaths, Goal, [Current|Visited], Path)
    ).