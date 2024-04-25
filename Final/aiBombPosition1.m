function [x, y] = aiBombPosition1(otherPlayerVec)
%generate a valid bomb position for AI

%keep trying until valid positions
    validInput = false;
    while ~validInput
        x = randi(size(otherPlayerVec, 1));
        y = randi(size(otherPlayerVec, 2));

        if otherPlayerVec(y, x) >= 0
            %set valid input to true to end loop
            validInput = true;
        end
    end

    %Output ai bomb position
    fprintf("AI bomb position %s%d \n", char(x + 64), y);
end