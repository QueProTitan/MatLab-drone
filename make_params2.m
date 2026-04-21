%PARAMS Summary of this function goes here
%   Detailed explanation goes here

function params = make_params2()

params.gridSize = [30 30];
params.dt = 1;
params.maxTime = 200;

params.extinguishThresh = 0.2;

params.numDrones = 5;

% FIRE PARAMS merged with make_params()
params.decay_rate = 0.05;
params.spread_rate = 0.1;

end