function [xBomb, yBomb, aiCurrentMove] = aiBombPosition2(otherPlayerVec, aiCurrentMove, aiInitialPos, aiLastPos)
%AI's stratergy 
%0: has not hit ship - do random
%1: hit - try north
%2: no hit with north - try east
%3: no hit with east - try south
%4: no hit with west - reset ai current move to 0
% if any hits - set AI current move to 10 + the direction (north 11, east 12, etc)
% keep going until miss, then set AI current move to 20 + opposite
% direction (north 13, east 14 etc)
%bomb from initial hit offset by direction
%if miss reset current ai move to 0


    if aiCurrentMove == 0
        %generate random
        [xBomb, yBomb] = aiBombPosition1(otherPlayerVec);
        return;
    end

    %stage 1 - find right direction
    if aiCurrentMove == 1
        %try north - check able to go north
        if aiInitialPos(2) > 1 && otherPlayerVec(aiInitialPos(2)-1, aiInitialPos(1)) >= 0
            xBomb = aiInitialPos(1);
            yBomb = aiInitialPos(2) - 1;
            %Output ai bomb position
            fprintf("AI bomb position %s%d \n", char(xBomb + 64), yBomb);
            return;
        else
            aiCurrentMove = 2;  %try east
        end
    end

    if aiCurrentMove == 2
        %try east - check able to go east
        if aiInitialPos(1) < 10 && otherPlayerVec(aiInitialPos(2), aiInitialPos(1)+1) >= 0
            xBomb = aiInitialPos(1) + 1;
            yBomb = aiInitialPos(2);
            %Output ai bomb position
            fprintf("AI bomb position %s%d \n", char(xBomb + 64), yBomb);
            return;
        else
            aiCurrentMove = 3;  %try south
        end  
    end

    if aiCurrentMove == 3
        %try south - check able to go south
        if aiInitialPos(2) < 10 && otherPlayerVec(aiInitialPos(2)+1, aiInitialPos(1)) >= 0
            xBomb = aiInitialPos(1);
            yBomb = aiInitialPos(2) + 1;
            %Output ai bomb position
            fprintf("AI bomb position %s%d \n", char(xBomb + 64), yBomb);
            return;
        else
            aiCurrentMove = 4;
        end
    end
    
    if aiCurrentMove == 4
        %try west - check if able to go west
        if aiInitialPos(1) > 1 && otherPlayerVec(aiInitialPos(2), aiInitialPos(1)-1) >= 0
            xBomb = aiInitialPos(1) - 1;
            yBomb = aiInitialPos(2);
            %Output ai bomb position
            fprintf("AI bomb position %s%d \n", char(xBomb + 64), yBomb);
            return;
        else
            %reset
            aiCurrentMove = 0;
            [xBomb, yBomb] = aiBombPosition1(otherPlayerVec);
            return;
        end
    end

    %stage 2 - continue in direction
    if aiCurrentMove == 11
        %try north
        if aiLastPos(2) > 1 && otherPlayerVec(aiLastPos(2)-1, aiLastPos(1)) >= 0
            xBomb = aiLastPos(1);
            yBomb = aiLastPos(2) - 1;
            %Output ai bomb position
            fprintf("AI bomb position %s%d \n", char(xBomb + 64), yBomb);
            return;
        else
            %hit top of board, try other direction
            aiCurrentMove = 23;
        end
    elseif aiCurrentMove == 12
        %try east
        if aiLastPos(1) < 10  && otherPlayerVec(aiLastPos(2), aiLastPos(1)+1) >= 0
            xBomb = aiLastPos(1) + 1;
            yBomb = aiLastPos(2);
            %Output ai bomb position
            fprintf("AI bomb position %s%d \n", char(xBomb + 64), yBomb);
            return;
        else
            %try west from start
            aiCurrentMove = 24;
        end
    elseif aiCurrentMove == 13
        %try south
        if aiLastPos(2) < 10 && otherPlayerVec(aiLastPos(2)+1, aiLastPos(1)) >= 0
            xBomb = aiLastPos(1);
            yBomb = aiLastPos(2) + 1;
            %Output ai bomb position
            fprintf("AI bomb position %s%d \n", char(xBomb + 64), yBomb);
            return;
        else
            %north
            aiCurrentMove = 21;
        end
    elseif aiCurrentMove == 14
        %try west
        if aiLastPos(1) > 1 && otherPlayerVec(aiLastPos(2), aiLastPos(1)-1) >= 0
            xBomb = aiLastPos(1) - 1;
            yBomb = aiLastPos(2);
            %Output ai bomb position
            fprintf("AI bomb position %s%d \n", char(xBomb + 64), yBomb);
            return;
        else
            %east
            aiCurrentMove = 22;
        end
    end
    

    %stage 3 - opposite direction from first hit
    if aiCurrentMove == 21
        %try north of initial
        if aiInitialPos(2) > 1 && otherPlayerVec(aiInitialPos(2)-1, aiInitialPos(1)) >= 0
            xBomb = aiInitialPos(1);
            yBomb = aiInitialPos(2) - 1;
            %Output ai bomb position
            fprintf("AI bomb position %s%d \n", char(xBomb + 64), yBomb);
            return;
        else
            %reset
            aiCurrentMove = 0;
            %generate random
            [xBomb, yBomb] = aiBombPosition1(otherPlayerVec);
            return;
        end
    elseif aiCurrentMove == 22
        %try east of initial
        if aiInitialPos(1) < 10 && otherPlayerVec(aiInitialPos(2), aiInitialPos(1)+1) >= 0
            xBomb = aiInitialPos(1) + 1;
            yBomb = aiInitialPos(2);
            %Output ai bomb position
            fprintf("AI bomb position %s%d \n", char(xBomb + 64), yBomb);
            return;
        else
            %reset
            aiCurrentMove = 0;
            %generate random
            [xBomb, yBomb] = aiBombPosition1(otherPlayerVec);
            return;
        end
    elseif aiCurrentMove == 23
        %try south of initial 
        if aiInitialPos(2) < 10  && otherPlayerVec(aiInitialPos(2)+1, aiInitialPos(1)) >= 0
            xBomb = aiInitialPos(1);
            yBomb = aiInitialPos(2) + 1;
            %Output ai bomb position
            fprintf("AI bomb position %s%d \n", char(xBomb + 64), yBomb);
            return;
        else
            %reset
            aiCurrentMove = 0;
            %generate random
            [xBomb, yBomb] = aiBombPosition1(otherPlayerVec);
            return;
        end
    elseif aiCurrentMove == 24
        %try west of initial
        if aiInitialPos(1) > 1  && otherPlayerVec(aiInitialPos(2), aiInitialPos(1)-1) >= 0
            xBomb = aiInitialPos(1) - 1;
            yBomb = aiInitialPos(2);
            %Output ai bomb position
            fprintf("AI bomb position %s%d \n", char(xBomb + 64), yBomb);
            return;
        else
            %reset
            aiCurrentMove = 0;
            %generate random
            [xBomb, yBomb] = aiBombPosition1(otherPlayerVec);
            return;
        end
    else
        %reset
        aiCurrentMove = 0;
        %generate random
        [xBomb, yBomb] = aiBombPosition1(otherPlayerVec);
        return;
    end

end