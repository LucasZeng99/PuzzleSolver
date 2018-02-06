function sample = move(sample, d, key)
    [target_r, target_c] = find(sample == d.^2);
    target = [target_r, target_c];
    switch key
        case 'w'
            sample = check_swap(sample, target, -1, 0);
        case 's'
            sample = check_swap(sample, target, 1, 0);
        case 'a'
            sample = check_swap(sample, target, 0, -1);
        case 'd'
            sample = check_swap(sample, target, 0, 1);
    end
end



