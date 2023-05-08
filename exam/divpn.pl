%Prolog. divpn(L,L2,L1). Kde L je seznam, 
%L2 je seznam záporných čísel z L a 
%L1 je seznam kladných čísel z L. 
%(Pozor 0 není ani kladné, ani záporné, prostě se vynechá)

divpn([],[],[]).
divpn([H|T],[H|L2],L1) :- H < 0, divpn(T, L2, L1).
divpn([H|T],L2,[H|L1]) :- H > 0, divpn(T, L2, L1).
divpn([_|T],L2,L1) :- divpn(T,L2,L1).
