
function sample = cursorReady(sample, distancetocursor, direction)
    cursor_pos = getCursor(sample);
    if direction == 1  
        while distancetocursor(2) ~= 0
            if distancetocursor(2)>0
                    sample = check_swap(sample, cursor_pos, 0, -1);
            else
                if distancetocursor(2)<0
                    sample = check_swap(sample, cursor_pos, 0, 1);
                end
            end            
            distancetocursor = distanceToCursor(sample, 1);
            cursor_pos = getCursor(sample);
        end
    else
        if direction == 2
            
        end
    end
end