function [playerVec, boatData] = getBoatPosition(playerVec, gameBoardImage, boatNames, boatSpaces)
%reference for multiple options in switch statement
%https://au.mathworks.com/matlabcentral/answers/397114-wildcard-or-multiple-conditions-on-switch-case

    %loop through boat options
    for boat = 1:length(boatNames)
        fprintf("Enter boat position for %s which has a length of %d\n", boatNames(boat), boatSpaces(boat));
        
        boatEntered = false;
        %repeat while the boat hasn't been entered
        while(~boatEntered)
            %get boat position
            positionInput = input('Enter boat position (A1-J10): ', 's');
            
            %blank string error
            if positionInput == ""
                continue;
            end
    
            %convert to x and y position inputs
            tempX = positionInput(1)*1; %convert char to ASCII number
            %convert to 1-10 number, allowing for capital and lower case
            %letters
            if tempX >= 97
                xPos = tempX - 96;
            else
                xPos = tempX - 64;
            end
            yPos = str2double(positionInput(2:length(positionInput)));
            
            %input direction to place boat
            direction = input('Enter direction of boat(N,E,S,W): ', 's');
    
            %check entered position is within board
            if (xPos >= 1 && xPos <= 10 && yPos >= 1 && xPos <= 10)
                %check boat direction and put boat into vector
                switch direction
                    case {'N', 'n'}
                        %check if boat is in range
                        if (yPos >= (boatSpaces(boat)))
                            %use enter boat function to put boat into position
                            %in array
                            [playerVec, boatEntered] = enterBoatToVector(playerVec, boat, yPos, xPos, -boatSpaces(boat), 1);

                            %check boat didn't clash
                            if boatEntered == 1
                                %update image data
                                [gameBoardImage, boatData] = drawBoatsOnBoard(gameBoardImage, playerVec, boat, boat);
    
                                %close any open images
                                close;
    
                                %open new image
                                imshow(gameBoardImage);
                            end

                        else
                            disp('Boat will not fit on board');
                        end %end of boat in range statement
                    case {'E', 'e'}
                        %check if boat is in range
                        if (xPos <= size(playerVec, 1) - boatSpaces(boat) + 1)
                            %use enter boat function to put boat into position
                            %in array
                            [playerVec, boatEntered] = enterBoatToVector(playerVec, boat, yPos, xPos, 1, boatSpaces(boat));

                            %check boat didn't clash
                            if boatEntered == 1
                                %update image data
                                [gameBoardImage, boatData] = drawBoatsOnBoard(gameBoardImage, playerVec, boat, boat);
    
                                %close any open images
                                close;
    
                                %open new image
                                imshow(gameBoardImage);
                            end
                        else
                            disp('Boat will not fit on board');
                        end%end of boat in range statement
                        
                    case {'S', 's'}
                        if (yPos <= size(playerVec, 2) - boatSpaces(boat) + 1)
                            %use enter boat function to put boat into position
                            %in array
                            [playerVec, boatEntered] = enterBoatToVector(playerVec, boat, yPos, xPos, boatSpaces(boat), 1);

                            %check boat didn't clash
                            if boatEntered == 1
                                %update image data
                                [gameBoardImage, boatData] = drawBoatsOnBoard(gameBoardImage, playerVec, boat, boat);
    
                                %close any open images
                                close;
    
                                %open new image
                                imshow(gameBoardImage);
                            end
                        else
                            disp('Boat will not fit on board');
                        end %end of boat in range statement
                    case {'W', 'w'}
                        %check if boat is in range
                        if (xPos >= boatSpaces(boat))
                            %use enter boat function to put boat into position
                            %in array
                            [playerVec, boatEntered] = enterBoatToVector(playerVec, boat, yPos, xPos, 1, -boatSpaces(boat));

                            %check boat didn't clash
                            if boatEntered == 1
                                %update image data
                                [gameBoardImage, boatData] = drawBoatsOnBoard(gameBoardImage, playerVec, boat, boat);
    
                                %close any open images
                                close;
    
                                %open new image
                                imshow(gameBoardImage);
                            end
                        else
                            disp('Boat will not fit on board');
                        end
    
                    otherwise
                        %if direction entered is not N, S, E, W
                        disp('Invalid direction - Please enter another direction');
                
                end %end of switch statement
            else
                %if position is not on board
                disp('Invalid Position on board - Please enter another position');
            end
        end
    
    end
end