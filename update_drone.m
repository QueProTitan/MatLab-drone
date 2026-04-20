%DRONEUPDATE Handles main drone behavior and managing
%   Deals with targeting, movement, binding to grid, and 
%(Input)
    %drones
    %fire
%(Output)
    %drones
    %fire
function [drones,fire] = update_drone(drones,fire,params,t)
for i = 1:length(drones)

    %Assign target
    drones(i).Target = TargetAssignment(fire, drones(i));

    %Move toward target
    current = drones(i).Position;
    target  = drones(i).Target;

    step = sign(target - current);
    newPos = current + step;

    % enforce bounds
    newPos = max(newPos, [1 1]);
    newPos = min(newPos, size(fire.intensity));

    %Collision avoidance
    [newPos, drones] = detect_avoidance(newPos, drones, i);

    %Update distance
    drones(i).Distance = drones(i).Distance + norm(newPos - current);

    %Update position
    drones(i).Position = newPos;

    %Suppress fire if close
    if fire.intensity(newPos(1), newPos(2)) > params.extinguishThresh

        fire.intensity(newPos(1), newPos(2)) = 0;

        drones(i).CellsPutOut = drones(i).CellsPutOut + 1;

        event = 'EXTINGUISH';

    else
        event = 'MOVE';
    end

    %Logging
    drones(i).ActiveTime = drones(i).ActiveTime + params.dt;

    drones(i).Log.Pos(end+1,:) = newPos;
    drones(i).Log.Time(end+1,1) = t;
    drones(i).Log.Event{end+1,1} = event;

end

end