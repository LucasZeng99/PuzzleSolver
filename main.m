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


distanceToC = distanceToCursor(sample, target);
distanceFromO = distanceFromExpected(sample, target);
% TODO: remove manual move and apply automove for '1'.
disp(distanceToC);
disp(distanceFromO);

sample = automove(sample, target, distanceToC, distanceFromO);

%{
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
%}
drawout(sample, d);