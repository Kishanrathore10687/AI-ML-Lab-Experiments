% Experiment 11: Map Coloring Problem

% Available colors
color(red).
color(green).
color(blue).

% Assign colors to regions of the map
map_coloring(Map) :-
    Map = [wa-WA, nt-NT, sa-SA, q-Q, nsw-NSW, v-V, t-T],

    color(WA),
    color(NT),
    color(SA),
    color(Q),
    color(NSW),
    color(V),
    color(T),

    WA \= NT,
    WA \= SA,
    NT \= SA,
    NT \= Q,
    SA \= Q,
    SA \= NSW,
    SA \= V,
    Q \= NSW,
    NSW \= V.