function distance = distanceToCursor(sample, target_num)
    cursor_pos = getCursor(sample);
    [target_pos(1), target_pos(2)] = find(sample == target_num);
    distance = -target_pos + cursor_pos;
end