function fire_grid = InitFire1()
fire_grid = zeros(30);
mid = floor(30/2);
fire_grid(mid-1:mid+1, mid-1:mid+1) = 1;
end