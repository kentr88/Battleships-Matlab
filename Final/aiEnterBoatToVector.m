function [playerVec, boatEntered] = aiEnterBoatToVector(playerVec, boatNo, yPos, xPos, ymove, xmove)
%check for other boats
    boatEntered = false;
    noBoat = true;
    
    
    %make sure there are no other boats in the proposed positions
    for ycheck = yPos:sign(ymove):(yPos + ymove - sign(ymove))
        for xcheck = xPos:sign(xmove):(xPos + xmove - sign(xmove))
            if (playerVec(ycheck, xcheck) > 0)
                noBoat = false;
            end
        end
    end

    %if no other boats in that position
    if (noBoat)
        %enter into vector
        for ycheck = yPos:sign(ymove):(yPos + ymove - sign(ymove))
            for xcheck = xPos:sign(xmove):(xPos + xmove - sign(xmove))
                playerVec(ycheck, xcheck) = boatNo;
            end
        end
        %set boat entered to true
        boatEntered = true;
           
    end %end of other boats in that position statement
end