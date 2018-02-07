function [sample, valid] = move(sample, d, key)
    [target(1), target(2)] = find(sample == d.^2);
    switch key
        case 'w'
            [sample, valid] = check_swap(sample, target, -1, 0);
        case 's'
            [sample, valid] = check_swap(sample, target, 1, 0);
        case 'a'
            [sample, valid] = check_swap(sample, target, 0, -1);
        case 'd'
            [sample, valid] = check_swap(sample, target, 0, 1);
    end
end



