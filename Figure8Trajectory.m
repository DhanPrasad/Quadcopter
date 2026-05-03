function [xd, yd, zd] = Figure8Trajectory(u)
xd = 0;
yd = 0;
zd = 0;

% Phase 1: Climb from (0,0,0) to (0,0,10) in 10 seconds
if u < 10
    xd = 0;
    yd = 0;
    zd = u;
end


if u >= 10
    tau   = u - 10;
    omega = 2 * pi / 40;   % rad/s  —  period = 40 s
    R     = 6;              % m      —  lobe radius

    xd =  R * sin(2*omega * tau);
    yd =  R * sin(omega * tau);
    zd = 10;
end