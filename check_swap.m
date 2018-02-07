function [sample, valid] = check_swap(sample, cursor, shift_r, shift_c)
    try 
        sample = swap(sample, cursor, shift_r, shift_c);
        valid = 1;
    catch ME
        if (strcmp(ME.identifier,'MATLAB:badsubscript'))
            valid = 0;
            % pass
        end
    end
end

function sample = swap(sample, cursor, shift_r, shift_c)
    tmp = sample(cursor(1)+shift_r, cursor(2)+shift_c);
    sample(cursor(1)+shift_r, cursor(2)+shift_c) = sample(cursor(1), cursor(2));
    sample(cursor(1), cursor(2)) = tmp;
end