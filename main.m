clear; clc;
game_on = 1;

% initialize a square
d = round(str2double(input('Dimension:','s')));
clc;
len = d.^2; % total number of elements of the matrix.
sample = 1:1:len;

for i = 1:len
    tmp = sample(i);
    target = randi(len, 1);
    sample(i) = sample(target);
    sample(target) = tmp;
end

sample = reshape(sample, d, d);

% draw the square first
drawout(sample, d);

% game starts
key = 0; target = 1;

while game_on
    distance = distanceFromCursor(sample, 1);
    distanceToOrigin = distanceFromExpected(sample, 1);
    % TODO: remove manual move and apply automove for '1'.
    disp(distance);
    disp(distanceToOrigin);
    key = input('move in [wasd]:(q to quit)','s');

    % ------exit----------
    if key == 'q'
       game_on = 0;
    end

    % ------key validation--------
    if length(key) > 1
        key = key(1);
    else
        if length(key) < 1
            continue;
        end
    end

    % ------move----------
    if any(key == ['w', 'a', 's', 'd'])
       [sample, valid] = move(sample, d, key);
       if ~valid
          continue; 
       end
    end

    % ------automove------
    %[sample, target, valid, distance] = automove(sample, target, distance);
    % ------draw out matrix----

    drawout(sample, d);
end


function [sample, target, valid, distance] = automove(sample, target_num, distance)
    new_distance = calcDistance(sample, target_num);
end

function distance = distanceFromCursor(sample, target_num)
    cursor = size(sample, 2).^2;
    [cursor_loc(1), cursor_loc(2)] = find(sample == cursor);
    [target_loc(1), target_loc(2)] = find(sample == target_num);
    distance = -target_loc + cursor_loc;
end

function distance = distanceFromExpected(sample, target_num)
    d = size(sample, 2);
    expected_loc(1) = 1 + floor(target_num./d);
    expected_loc(2) = target_num - d*floor(target_num./d);
    [present_loc(1), present_loc(2)] = find(sample == target_num);
    distance = expected_loc - present_loc;
end