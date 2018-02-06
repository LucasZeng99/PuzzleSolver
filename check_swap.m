function sample = check_swap(sample, target, shift_r, shift_c)
    try 
        sample = swap(sample, target, shift_r, shift_c);
    catch ME
        if (strcmp(ME.identifier,'MATLAB:badsubscript'))
            % pass
        end
    end
end

function sample = swap(sample, target, shift_r, shift_c)
    tmp = sample(target(1)+shift_r, target(2)+shift_c);
    sample(target(1)+shift_r, target(2)+shift_c) = sample(target(1), target(2));
    sample(target(1), target(2)) = tmp;
end