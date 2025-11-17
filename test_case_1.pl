% Test Case 1: Weak lights + car does not turn over
% Expected: solution(X) = recharge

:- initialization(main).

% Override the facts for this test
:- dynamic(turn_over/0).
:- dynamic(lights_weak/0).
:- dynamic(radio_weak/0).
:- dynamic(smell_gas/0).
:- dynamic(gas_gauge/1).

% Test setup: car does NOT turn over, lights ARE weak
lights_weak.
turn_over :- fail.

% Include the rules from car_diagnosis.pl
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

% Main test
main :-
    write('Test Case 1: Weak lights + car does not turn over'), nl,
    write('Expected: X = recharge'), nl,
    write('Actual: '),
    (solution(X) -> 
        (write('X = '), write(X), nl) 
    ; 
        write('No solution found'), nl
    ),
    halt.
