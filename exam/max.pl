% find max value in a list

max([H],H).
max([H|T], OUTER) :- max(T,INNER), INNER > H, OUTER is INNER.
max([H|T], OUTER) :- OUTER is H.
