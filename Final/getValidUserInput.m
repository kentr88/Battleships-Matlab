function [x, y] = getValidUserInput(otherPlayerVec, name)
%get a valid bomb position from the user


    %keep trying until player enters valid positions
    validInput = false;
    while ~validInput
        positionInput = input(([char(name) ', enter a position to attack (e.g.A10): ']), 's');
        

        %blank string
        if positionInput == ""
            continue
        end

        %convert to x and y position inputs
        tempX = positionInput(1)*1; %convert char to ASCII number
        %convert to 1-10 number, allowing for capital and lower case
        %letters
        if tempX >= 97
            x = tempX - 96;
        else
            x = tempX - 64;
        end
        y = str2double(positionInput(2:length(positionInput)));

        %check entered position is within board
        if (x >= 1 && x <= 10 && y >= 1 && y<= 10)
            %check if area has already been bombed
            if otherPlayerVec(y, x) >= 0
                %set valid input to true to end loop
                validInput = true;
            else
                %tell playeer what was there
                if otherPlayerVec(y, x) == -1
                    disp('Position has already been bombed, nothing was there');
                else
                    disp('Position has already been bombed, something is there');
                end
            end  
        else
            disp('Invalid position');
        end
    end
end