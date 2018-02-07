function distance = distanceFromExpected(sample, target_num)
    d = size(sample, 2);
    expected_pos(1) = 1 + floor(target_num./d);
    expected_pos(2) = target_num - d*floor(target_num./d);
    [present_pos(1), present_pos(2)] = find(sample == target_num);
    distance = expected_pos - present_pos;
end