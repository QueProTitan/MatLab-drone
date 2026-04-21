function drones = init_drones(params)

for i = 1:params.numDrones

    drones(i).ID = i;
    drones(i).Position = [randi(params.gridSize(1)), randi(params.gridSize(2))];
    drones(i).Target = drones(i).Position;

    drones(i).CellsPutOut = 0;
    drones(i).Distance = 0;
    drones(i).NearMiss = 0;
    drones(i).ActiveTime = 0;

    drones(i).Log.Pos = drones(i).Position;
    drones(i).Log.Time = 0;
    drones(i).Log.Event = {'INIT'};

end

end