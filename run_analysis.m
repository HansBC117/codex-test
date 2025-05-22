
% Load data
data = load('Exercise_A_raw_pressures.mat');

% Define parameters
encoder_resolution = 0.5; % degrees
TDC_shift = 0.5; % degrees after max motored pressure
atm_pressure = 1.013; % bar
gain = 10; % bar/V

% Call function
[corrected_cycles, avg_pressure, rep_pressure, Theta, V_theta, P_rep] = process_cylinder_pressure( ...
    data.motored_pressure_signal, data.fired_pressure_signal, encoder_resolution, TDC_shift, atm_pressure, gain);

% Plot results
figure;
plot(Theta, avg_pressure, 'r', 'LineWidth', 2);
hold on;
plot(Theta, rep_pressure, 'b', 'LineWidth', 2);
xlabel('Crank Angle Degree (CAD)');
ylabel('Pressure (bar)');
legend('Average Cycle', 'Representative Cycle');
title('Cylinder Pressure vs Crank Angle');
grid on;


% Plot p-V diagram
figure;
plot(V_theta * 1e6, P_rep / 1e5, 'k');  % cm^3 vs bar
xlabel('Volume [cm^3]');
ylabel('Pressure [bar]');
title('p-V Diagram');
grid on;

% Plot log-log p-V diagram
figure;
loglog(V_theta, P_rep, 'm');
xlabel('Log Volume [m^3]');
ylabel('Log Pressure [Pa]');






