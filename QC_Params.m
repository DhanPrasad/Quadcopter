% Physical
m  = 0.468;       % mass (kg)
g  = 9.81;        % gravity (m/s^2)
l  = 0.225;       % arm length (m)
Psi = 0;          % No yaw (Xhange this for yaw control)

% Rotor constants
k  = 2.980e-6;    % lift factor (N.s^2/rad^2)
b  = 1.140e-7;    % drag factor (N.m.s^2/rad^2)

% Inertia
Ixx = 4.856e-3;    % Ixx (kg.m^2)
Iyy = 4.856e-3;    % Iyy (kg.m^2)
Izz = 8.801e-3;    % Izz (kg.m^2)

% Drag force coefficients
Ax = 0.25;        % x drag (kg/s)
Ay = 0.25;        % y drag (kg/s)
Az = 0.25;        % z drag (kg/s)

% Gravity vector (for [0 0 g] constant block)
grav = [0; 0; g];

% Drag matrix (for diagonal constant block)
A_drag = [Ax 0  0 ;
           0 Ay 0 ;
           0  0 Az];

% PD gains — hover
KpPhi   = 6;     KdPhi   = 1.75;
KpTheta = 6;     KdTheta = 1.75;
KpPsi   = 6;     KdPsi   = 1.75;
KpZ     = 1.5;   KdZ     = 2.5;

% PD gains — trajectory
KpT = 4;   KdT = 2;
KpR = 1;   KdR = 3;

disp('Quadcopter parameters loaded.')
time = (1:20)'; 
angles = floor((time-1)/5) * 0.01;
%% Path concat
t_start  = 0;
t_end    = str2double(get_param(bdroot, 'StopTime'));   % pulls from Simulink stop time
dt       = 0.5;
mk_size  = 4;
mk_r     = 0;
mk_g     = 0;
mk_b     = 1;
mk_alpha = 1;
 
%% Generate marker matrix
t = (t_start : dt : t_end)';
N = length(t);
traj_markers = zeros(N, 8);
 
for i = 1:N
    [xd, yd, zd]    = CircularTrajectory(t(i));%% Chage here to get different path
    traj_markers(i,:) = [xd, yd, zd, mk_size, mk_r, mk_g, mk_b, mk_alpha];
end
