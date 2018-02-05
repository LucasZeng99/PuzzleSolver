clear; clc;
game_on = 1;

% initialize a square
d = round(str2num(input('Dimension:','s')));
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
key = 0;
while game_on
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
       sample = move(sample, d, key);
    end


    % ------draw out matrix----

    drawout(sample, d);
end
