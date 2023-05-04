% Zadani c. 42:
% Napiste program resici ukol dany predikatem u42(VIN), kde promenna VIN  
% obsahuje prirozene cislo. Predikat prevede toto cislo na oktalove cislo
% (cislo v osmickove soustave).  

% Testovaci predikaty:
u42_1 :- u42(113).	% 161
u42_2 :- u42(1024).                                              % 2000
u42_3 :- u42(1).                                                 % 1
u42_r :- write('Zadej VIN: '),read(VIN),u42(VIN).

% Reseni:
u42(VIN) :-
VIN >= 0, % Check if VIN is non-negative
octal(VIN, OCT), % Convert VIN to octal representation
% reverse_list(OCT, reversed),
num(OCT, RES),
write(RES), nl. % Print the octal representation

% Base case: 0 in decimal is 0 in octal
octal(0, [0]) :- !.

% Recursive case: convert VIN to octal representation
octal(VIN, OCT) :-
VIN > 0,
QUOT is VIN // 8, % Compute quotient
REM is VIN mod 8, % Compute remainder
octal(QUOT, REST), % Convert quotient to octal
append_custom(REST, [REM], OCT). % Combine remainder and quotient

% Pow cases
pow(_,0,1).
pow(N,P,RES) :-
    Tp is P - 1, % Pow iteration 
    pow(N, Tp, Temp), % Compute rest
    RES is N * Temp. % Combine rest and current

% List to number converteer ( [1,2,3,4] to 1234 )
num([], 0). % 0 if list is empty
num([H|T], RES) :- 
    length(T,N),
    pow(10, N, K),
    num(T, VAL),
    RES is H * K + VAL.

append_custom([], List2, List2).
append_custom([Head|Tail], List2, [Head|Result]) :-
    append_custom(Tail, List2, Result).


