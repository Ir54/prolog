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
