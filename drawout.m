function [] = drawout(sample, d)
    for row = 1:d
       fprintf('|');
       for col = 1:d
           if sample(row, col) == d.^2
               fprintf(' _');
           else
               fprintf('%2d', sample(row, col));
           end
           fprintf('|');
       end
       fprintf('\n');
    end
    fprintf('\n');
end