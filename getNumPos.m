function num_pos = getNumPos(sample, target_num)
    num_pos = zeros(1, 2);
    [num_pos(1), num_pos(2)] = find(sample == target_num);
end