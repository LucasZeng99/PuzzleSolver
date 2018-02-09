function sample = automove(sample, num,...
    distancetocursor, distancefromexpected)
    
    row = distancefromexpected(1);
    col = distancefromexpected(2);
    num_pos = getNumPos(sample, num);
    cursor_pos = getCursor(sample);
    while row ~= 0
        path = [0];
        cursor_pos = getCursor(sample);
        disp('in the main movement....')
       if row > 0
           direction = [1, 0];        
       else
           if row < 0
               direction = [-1, 0];
           end
       end
       path = findPath(sample, cursor_pos, num_pos, direction);
       
       if path ~= 0    
           for i = length(path):-1:1
              onestep = zeros(1,2);
              fprintf('path is: \n')
              disp(path);
              fprintf('path(%d) is: ', i);
              disp(path(i));
              disp('\n');

              [onestep(1), onestep(2)] = find(sample == path(i));
              onestep = onestep - cursor_pos;
              sample = check_swap(sample, cursor_pos, onestep(1), onestep(2));
              cursor_pos = getCursor(sample);
           end
       end
       new_distance =  distanceFromExpected(sample, num);
       row = new_distance(1);
       
    end
end

function path = findPath(sample, cursor_pos, num_pos, direction)
    path = [0];
    disp('finding path...');
    target_pos = num_pos + direction;
    path_vec = target_pos - cursor_pos;
    if path_vec(1)
       if num_pos(2) == cursor_pos(2)
          if cursor_pos(2) < size(sample, 2)
              if cursor_pos(1) <= target_pos(1)
              path = sample(cursor_pos(1):target_pos(1), cursor_pos(2)+1);
              else
                  path = sample(target_pos(1):cursor_pos(1), cursor_pos(2)+1);
              end
          end
       else
           if cursor_pos(1) <= target_pos(1)
              path = sample(cursor_pos(1):target_pos(1), cursor_pos(2));
           else
                  path = sample(target_pos(1):cursor_pos(1), cursor_pos(2));
           end
       end
    end
end