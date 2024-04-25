function [x, y] = aiBombPosition3(otherPlayerVec, currentBoat)
%check if last bomb was boat
    if currentBoat > 0
        %search for that boat
        for i = 1:size(otherPlayerVec, 1)
            for j = 1:size(otherPlayerVec, 2)
                if otherPlayerVec(i, j) == currentBoat
                    %return variables for that boat
                    x = j;
                    y = i;

                    %Output ai bomb position
                    fprintf("AI bomb position %s%d \n", char(x + 64), y);
                    return;
                end
            end
        end
    else
        %test random, to see if will be hit
        r = randi(4);

        %search for boats
        for i = 1:size(otherPlayerVec, 1)
            for j = 1:size(otherPlayerVec, 2)
                if r == 1
                    if otherPlayerVec(i, j) > 0
                        %return variables for that boat
                        x = j;
                        y = i;
    
                        %Output ai bomb position
                        fprintf("AI bomb position %s%d \n", char(x + 64), y);
                        return;
                    end
                else
                    if otherPlayerVec(i, j) == 0
                        %return variables for that boat
                        x = j;
                        y = i;
    
                        %Output ai bomb position
                        fprintf("AI bomb position %s%d \n", char(x + 64), y);
                        return;
                    end
                end  
            end
        end
    end
end