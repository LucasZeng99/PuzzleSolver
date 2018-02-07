function cursor = getCursor(sample)
    cursor = zeros(1,2);
    cursor_num = size(sample, 2).^2;
    [cursor(1), cursor(2)] = find(sample == cursor_num);
end