%DRONEAVOID Detecs if nearby drones will collide
%   Detailed explanation goes here
%(Input)
    %NewPos
    %drones
    %idx

%(Output)
    %NewPos
    %drones

    function [newPos, drones] = detect_avoidance(newPos, drones, idx)

for j = 1:length(drones)

    if j == idx
        continue
    end

    if isequal(newPos, drones(j).Position)

        % simple avoidance: stay put
        newPos = drones(idx).Position;

        drones(idx).NearMiss = drones(idx).NearMiss + 1;
        return

    end
end

end