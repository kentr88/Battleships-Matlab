function aiVec = getAiBoatPosition(aiVec, boatSpaces)
    %loop through boat positions
    for boat = 1:length(boatSpaces)
        %decide direction, x or y
        direction = randi(2);
        
        %switch statement for 2 directions
        switch(direction)
            case 1
                boatEntered = false;
                %while loop
                while ~boatEntered
                    %create random variables for positions
                    yPos = randi(size(aiVec, 2) - boatSpaces(boat) + 1);
                    xPos = randi(size(aiVec, 1));
    
                    %try put into vector - south
                    [aiVec, boatEntered] = aiEnterBoatToVector(aiVec, boat, yPos, xPos, boatSpaces(boat), 1);
    
                    %will go again if it tries to put a boat in the same
                    %position
                end
                
            case 2
                boatEntered = false;
                %while loop
                while ~boatEntered
                    %create random variables for positions
                    xPos = randi(size(aiVec, 1) - boatSpaces(boat) + 1);
                    yPos = randi(size(aiVec, 2));
                    
                    %testing and debugging
                    %disp([2, xPos, yPos]);
    
                    %try put into vector - south
                    [aiVec, boatEntered] = aiEnterBoatToVector(aiVec, boat, yPos, xPos, 1, boatSpaces(boat));
    
                    %will go again if it tries to put a boat in the same
                    %position
                end
        end
    end
end