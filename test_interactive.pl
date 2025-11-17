% Facts for test case
lights_weak.
turn_over :- fail.

% Rules from car_diagnosis.pl
battery_bad :-
    lights_weak.
battery_bad :-
    radio_weak.

problem(battery) :-
    \+ turn_over,
    battery_bad.

problem(flooded) :-
    turn_over,
    smell_gas.

problem(out_of_gas) :-
    turn_over,
    gas_gauge(empty).
problem(out_of_gas) :-
    turn_over,
    gas_gauge(low).

solution(recharge) :-
    problem(battery).

solution(refuel) :-
    problem(out_of_gas).

solution(wait_5_mins) :-
    problem(flooded).

% Auto-run the query
:- initialization(main).

main :-
    write('?- solution(X).'), nl,
    solution(X),
    write('X = '), write(X), nl,
    halt.
