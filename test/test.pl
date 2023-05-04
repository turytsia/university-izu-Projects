
sreverse(LIST):-
    reverse(LIST, RESULT),
    lprint(RESULT).

lprint([]).
lprint([H|T]):-
    write(H),
    lprint(T).

% reverse list
reverse([], []).
reverse([H|T], RESULT) :-
    reverse(T, RES),
    append(RES, [H], RESULT).
