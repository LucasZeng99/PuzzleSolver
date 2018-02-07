function [sample, target] = automove(sample, target,...
    distancetocursor, distancefromexpected)
    %d from origin: which direction should be moved: negative d(1) requires
    %cursor to arrive at -1 0
    % negative d(2) requires cursor to arrive at 0 -1
    
    %{          
          d(1)FromO/cursorToBe      d(2)FromO/cursorToBe
              -         -1 0            -        0 -1
              +          1 0            +        0  1
        %}
    cursor_pos = getCursor(sample);
        disp(distancefromexpected(1));
        sample = cursorReady(sample, distancetocursor, 1);
        sample = check_swap(sample, cursor_pos, distancefromexpected(1), distancefromexpected(2));
        distancetocursor = distanceToCursor(sample, 1);
        distancefromexpected = distanceFromExpected(sample, 1);
end
