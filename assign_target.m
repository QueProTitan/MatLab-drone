%TARGETASSIGN Picks most appropriate fire to supress
%   Reads intensities of fires and put's highest intensity at top of list
%(Input)
    %fire
    %drone

%(Output)
    %target

    function target = TargetAssignment(fire,drone)

[intensityMax, idx] = max(fire.intensity(:));

if intensityMax < 0.1
    target = drone.Position; % no fire worth chasing
    return
end

[x, y] = ind2sub(size(fire.intensity), idx);
target = [x y];

end
TargetAssignment