%Version 4 Battleships main run file
%Introduction of visual graphics
%add time delays


%declair variables boat names and sizes
boatNames = ["Carrier", "Battleship", "Cruiser", "Submarine", "Destroyer"];
boatSpaces = [5 4 3 3 2];

%delair variables for main loop
player1Win = false;  %if the first player won
player1Sunk = 0;     %number of ai's boats player has sunk
player2Sunk = 0;     %number of player's opponent has sunk (either other player or AI)

moves = 0;          %keep track of number of moves for high score list

% load an image
gameBoardImage=imread('board1.png');

%make board visual for both players
player1Board = gameBoardImage;
player2Board = gameBoardImage;

%close any open images from last game
close;


%ask for gamemode
gamemode = -1;
%loop untit valid
while strcmp(gamemode, "S") ~= 1 && strcmp(gamemode, "M") ~= 1 && strcmp(gamemode, "s") ~= 1 && strcmp(gamemode, "m") ~= 1
    gamemode = input("Enter Gamemode (S/M): ", "s");
end

%set to capitals to work with later conditions
if gamemode == "s"
    gamemode = "S";
elseif gamemode == "m"
    gamemode = "M";
end

switch gamemode
    case "S"
        %singleplayer 

        %ask for name
        player1Name = input("Please enter your name: ", "s");

        %ask player for difficulty level
        difficulty = -1;
        %loop until valid input is given
        while difficulty < 1 || difficulty > 3
            difficulty = input("Enter AI difficulty (1 is easiest and 3 hardest): ");
        end

        %2 difficulty variables
        aiCurrentMove = 0;
        aiInitialPos = [0, 0];  %first hit boat position
        aiLastPos = [0, 0]; %last hit position
        
        %3 difficulty variables for ai - act as memory of previous moves
        aiCurrentBoat = 0;

        %get player's board
        [player1Vec, player1BoatData] = getBoatPosition(zeros(10, 10), gameBoardImage, boatNames, boatSpaces);

        %draw boats on players board grey for later viewing when ai tries 
        %to hit them
        for index = 1:length(boatNames)
            if player1BoatData(index, 3) == 1
                %south
                player1Board = drawRectangleBoard(player1Board, cord(player1BoatData(index, 1))-30, cord(player1BoatData(index, 2))-30, cord(player1BoatData(index, 1))+30, cord(player1BoatData(index, 2) + player1BoatData(index, 4) - 1)+30, 30, 0.5, 0.5, 0.5);
            elseif player1BoatData(index, 3) == 2
                %east
                player1Board = drawRectangleBoard(player1Board, cord(player1BoatData(index, 1))-30, cord(player1BoatData(index, 2))-30, cord(player1BoatData(index, 1) + player1BoatData(index, 4) - 1)+30, cord(player1BoatData(index, 2))+30, 30, 0.5, 0.5, 0.5);
            else
                %one square
                player1Board = drawRectangleBoard(player1Board, cord(player2BoatData(index, 1))-30, cord(player1BoatData(index, 2))-30, cord(player1BoatData(index, 1))+30, cord(player1BoatData(index, 2))+30, 30, 0.5, 0.5, 0.5);
            end
        end


        %generate AI's board
        player2Vec = getAiBoatPosition(zeros(10, 10), boatSpaces);
        [null, player2BoatData] = drawBoatsOnBoard(gameBoardImage, player2Vec, length(boatNames), length(boatNames));

        input("Press enter to continue", "s");

        %close board
        close;

        %leave space
        fprintf("\n");
        
    case "M"
        %multiplayer

        %ask for first players name
        player1Name = input("First player, please enter your name: ", "s");

        %get first players board
        [player1Vec, player1BoatData] = getBoatPosition(zeros(10, 10), gameBoardImage, boatNames, boatSpaces);

        input("Press enter to continue", "s");
        
        %clear console so other player cant see other players inputs
        clc;

        %close board
        close;

        %get player 2's name
        player2Name = input("Second player, please enter your name: ", "s");

        %make sure its not the same as the first players name
        while strcmp(player2Name, player1Name) == 1
            player2Name = input("Your name is the same as Player 1, please enter a different name: ", "s");
        end

        %get second player's board
        [player2Vec, player2BoatData] = getBoatPosition(zeros(10, 10), gameBoardImage, boatNames, boatSpaces);

        input("Press enter to continue", "s");

        %clear console so other player cant see other players inputs
        clc;
        
        %close board image
        close;
end



%main game loop
endGame = false;    %variable for loop - if game has finished
while ~endGame
    %player 1's turn

    %display picture
    close;
    imshow(player2Board);

    %ask player for bomb position
    [xBomb, yBomb] = getValidUserInput(player2Vec, player1Name);

    %display image

    %check if hit ship
    if player2Vec(yBomb, xBomb) > 0
        %check if sunk
        if checkIfSunkBoat(player2Vec, xBomb, yBomb)
            player1Sunk = player1Sunk + 1;    %add 1 to tally of boats sunk by player
            %output boat sunk
            fprintf('Hit and Sunk %s, %d boats remaining\n', boatNames(player2Vec(yBomb, xBomb)), (length(boatNames) - player1Sunk));

            index = player2Vec(yBomb, xBomb);

            %draw rectange to show ship hit and sunk
            if player2BoatData(index, 3) == 1
                %south
                player2Board = drawRectangleBoard(player2Board, cord(player2BoatData(index, 1))-43, cord(player2BoatData(index, 2))-43, cord(player2BoatData(index, 1))+43, cord(player2BoatData(index, 2) + player2BoatData(index, 4) - 1)+43, 3, 1, 0, 0);
            elseif player2BoatData(index, 3) == 2
                %east
                player2Board = drawRectangleBoard(player2Board, cord(player2BoatData(index, 1))-43, cord(player2BoatData(index, 2))-43, cord(player2BoatData(index, 1) + player2BoatData(index, 4) - 1)+43, cord(player2BoatData(index, 2))+43, 3, 1, 0, 0);
            else
                %one square
                player2Board = drawRectangleBoard(player2Board, cord(player2BoatData(index, 1))-43, cord(player2BoatData(index, 2))-43, cord(player2BoatData(index, 1))+43, cord(player2BoatData(index, 2))+43, 3, 1, 0, 0);
            end
        else
            %just a hit
            disp("Hit");
        end
        %set index in ai's board to -2 if hit
        player2Vec(yBomb, xBomb) = -2;

        %update board picture - add red cross for hit
        player2Board = drawCrossBoard(player2Board, cord(xBomb), cord(yBomb), 50, 3, 1, 0, 0);
    elseif player2Vec(yBomb, xBomb) == 0
        %miss
        disp("Miss");

        %set index in ai's board to -1 if miss
        player2Vec(yBomb, xBomb) = -1;

        %update board picture - add white cross for miss
        player2Board = drawCrossBoard(player2Board, cord(xBomb), cord(yBomb), 50, 3, 1, 1, 1);
    end
    %show player recent move
    close;
    tempPlayer2Board = drawRectangleBoard(player2Board, cord(xBomb)-46, cord(yBomb)-46, cord(xBomb)+46, cord(yBomb)+46, 3, 0.2, 0.8, 0.8);
    imshow(tempPlayer2Board);    
    input("Press enter to continue", "s");

    %add space after output
    fprintf("\n");


    %check if win -if player has sunk all of the AI's ships
    if player1Sunk == length(boatNames)
        %increment moves - wont happen at end
        moves = moves + 1;
        endGame = true; %finish game
        player1Win = true;  %player has won
        continue;
    end


    %second players/AI's turn
    %get bomb position
    if gamemode == "S"
        %singleplayer - generate based on difficulty
        switch(difficulty)
            case 1
                %easy difficulty
                [xBomb, yBomb] = aiBombPosition1(player1Vec);
            case 2
                %medium
                [xBomb, yBomb, aiCurrentMove] = aiBombPosition2(player1Vec, aiCurrentMove, aiInitialPos, aiLastPos);
            case 3
                %hard
                [xBomb, yBomb] = aiBombPosition3(player1Vec, aiCurrentBoat);
        end
    
        %set last AI hit position
        aiLastPos = [xBomb, yBomb];
    else
        %display picture
        close;
        imshow(player1Board);

        %multiplayer - get from player
        [xBomb, yBomb] = getValidUserInput(player1Vec, player2Name);
    end
    
    
    

    %check if hit ship
    if player1Vec(yBomb, xBomb) > 0        
        %check if sunk boat
        if checkIfSunkBoat(player1Vec, xBomb, yBomb)
            %set ai variables
            if gamemode == "S"
                aiCurrentMove = 0;
                aiCurrentBoat = 0;
            end

            player2Sunk = player2Sunk + 1;    %add to tally of boats sunk by AI
            %output boat sunk
            fprintf('Hit and Sunk %s, %d boats remaining\n', boatNames(player1Vec(yBomb, xBomb)), (length(boatNames) - player2Sunk));

            index = player1Vec(yBomb, xBomb);

            %draw red rectange to show ship hit and sunk
            if player1BoatData(index, 3) == 1
                %south
                player1Board = drawRectangleBoard(player1Board, cord(player1BoatData(index, 1))-43, cord(player1BoatData(index, 2))-43, cord(player1BoatData(index, 1))+43, cord(player1BoatData(index, 2) + player1BoatData(index, 4) - 1)+43, 3, 1, 0, 0);
            elseif player1BoatData(index, 3) == 2
                %east
                player1Board = drawRectangleBoard(player1Board, cord(player1BoatData(index, 1))-43, cord(player1BoatData(index, 2))-43, cord(player1BoatData(index, 1) + player1BoatData(index, 4) - 1)+45, cord(player1BoatData(index, 2))+43, 3, 1, 0, 0);
            else
                %one square
                player1Board = drawRectangleBoard(player1Board, cord(player2BoatData(index, 1))-43, cord(player1BoatData(index, 2))-43, cord(player1BoatData(index, 1))+43, cord(player1BoatData(index, 2))+43, 3, 1, 0, 0);
            end
        else
            %hit
            disp("Hit");
            
            %set ai variables
            if gamemode == "S"
                %set ai variable
                aiCurrentBoat = player1Vec(yBomb, xBomb);
                %ai variables for difficulty 2
                if difficulty == 2
                    %set aiCurrentMove based on stage
                    if aiCurrentMove == 0
                        aiCurrentMove = 1;      %set to try north first
                        aiInitialPos = [xBomb, yBomb];
                    elseif aiCurrentMove < 10 
                        %stage 1 - find direction
                        aiCurrentMove = aiCurrentMove + 10; %successful in direction
                    elseif aiCurrentMove > 20 && aiCurrentMove < 30
                        %continue in sucessful direction
                        aiCurrentMove = aiCurrentMove - 10;
                    end
                end
            end
        end
        %set index in players board to -2
        player1Vec(yBomb, xBomb) = -2;

        %update board picture - add red cross for hit
        player1Board = drawCrossBoard(player1Board, cord(xBomb), cord(yBomb), 50, 3, 1, 0, 0);
    elseif player1Vec(yBomb, xBomb) == 0
        %make sure position has not been hit before setting it to hit
        %missed ship
        disp("Miss");
        
        %set ai variables
        if gamemode == "S"
            %ai variables for difficulty 2
            if difficulty == 2
                %set aiCurrentMove based on stage
                if aiCurrentMove > 0
                    %has made hit before
                    if aiCurrentMove < 10
                        %stage 1 - find direction
                        if aiCurrentMove >= 4
                            aiCurrentMove = 0; %reset
                        else
                            aiCurrentMove = aiCurrentMove + 1;
                        end
                    elseif aiCurrentMove < 20
                        %stage 2 - continue in successful direction
                        %if miss then try opposite direction
                        switch aiCurrentMove
                            case 11
                                aiCurrentMove = 23;
                            case 12
                                aiCurrentMove = 24;
                            case 13
                                aiCurrentMove = 21;
                            case 14
                                aiCurrentMove = 22;
                        end
                    else
                        %stage 3 - try opposite end of initial hit
                        %reset - this could occur if 2 boats are next to eachother
                        aiCurrentMove = 0;
                    end
                end
            end
        end

        %set index in players board -1 if miss
        player1Vec(yBomb, xBomb) = -1;

        %update board picture - add white cross for miss
        player1Board = drawCrossBoard(player1Board, cord(xBomb), cord(yBomb), 50, 3, 1, 1, 1);
    end

    %check if ai has won
    if player2Sunk == length(boatNames)
       %increment moves - wont happen at end
       moves = moves + 1;
       endGame = true; %finish game
       continue;
    end
    
    %increment moves
    moves = moves + 1;

    %display first players board with ai/player2 hits
    close;
    tempPlayer1Board = drawRectangleBoard(player1Board, cord(xBomb)-46, cord(yBomb)-46, cord(xBomb)+46, cord(yBomb)+46, 3, 0.2, 0.8, 0.8);
    imshow(tempPlayer1Board);
    input("Press enter to continue", "s"); %wait till key press


    %add space after output
    fprintf("\n");

end    %end main game loop

%close images
close;

%open final boards for players to see
%https://au.mathworks.com/help/images/display-multiple-images.html
subplot(1,2,1), imshow(player1Board);
subplot(1,2,2), imshow(player2Board);



%game finished
%say who won/lost
if gamemode == "S"
    if player1Win
        fprintf("Congratulations %s, you have won with %d moves\n\n", player1Name, moves);
        %update and display leaderboard 
        updateLeaderboard(player1Name, moves);
    else
        fprintf("AI has won with %d moves, Better luck next time\n\n", moves);
        %just load and display leaderboard
        leaderboard = readtable("leaderboard.txt");
        displayLeaderboard(leaderboard);
    end
else
    if player1Win
        fprintf("%s has won with %d moves\n\n", player1Name, moves);
        %update and display leaderboard 
        updateLeaderboard(player1Name, moves);
    else
        fprintf("%s has won with %d moves\n\n", player2Name, moves);
        %update and display leaderboard 
        updateLeaderboard(player2Name, moves);
    end
end








