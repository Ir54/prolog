% --- Dynamic declarations (can be modified at runtime) ---
:- dynamic(turn_over/0).
:- dynamic(lights_weak/0).
:- dynamic(radio_weak/0).
:- dynamic(smell_gas/0).
:- dynamic(gas_gauge/1).

% --- Facts about the car's condition ---
turn_over.
lights_weak.
radio_weak.
smell_gas.
gas_gauge(low).

% --- Rules for detecting problems ---

problem(battery) :-
    \+ turn_over,
    battery_bad.

battery_bad :-
    lights_weak.
battery_bad :-
    radio_weak.

problem(flooded) :-
    turn_over,
    smell_gas.

problem(out_of_gas) :-
    turn_over,
    gas_gauge(empty).
problem(out_of_gas) :-
    turn_over,
    gas_gauge(low).

% --- Recommended actions based on problem ---

solution(recharge) :-
    problem(battery).

solution(refuel) :-
    problem(out_of_gas).

solution(wait_5_mins) :-
    problem(flooded).
