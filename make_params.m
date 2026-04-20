%PARAMS Summary of this function goes here
%   Detailed explanation goes here

function params = make_params()

params.gridSize = [30 30]; %Sets to grid size and time step desire
params.dt = 1;
params.maxTime = 200;

params.extinguishThresh = 0.2;

params.numDrones = 5;

end