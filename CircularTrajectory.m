function [xd, yd, zd] = CircularTrajectory(u)

xd = 0;
yd = 0;
zd = 0;

% Climb from (0,0,0) to (0,0,10) in 10 seconds
if u < 10
    xd = 0;
    yd = 0;
    zd = u;
end

% Translate from (0,0,10) to (10,0,10) in 4 seconds
if u >= 10 && u < 14
    xd = 2.5 * (u - 10);
    yd = 0;
    zd = 10;
end

% Circular path of radius 10 at height 10
if u >= 14
    xd = 10 * cos(2*pi*(u - 14)/55);
    yd = 10 * sin(2*pi*(u - 14)/55);
    zd = 10;
end