function [boardImage, boatData] = drawBoatsOnBoard(boardImage, playerVec, total, recent)
    %variable for storing position and direction for future
    boatData = [];
    %loop through all (total)
    for i = 1:total
        %find first co-ordinate and direction for each boat - S or E
        boat = [-1, -1];
        for j = 1:size(playerVec, 1)
            for k = 1:size(playerVec, 2)
                if playerVec(j, k) == i
                    if boat(1) == -1
                        boat = [k, j];
                        break;
                    end
                end
            end
        end

        %check direction, length and add to image

        %check direction - make sure not exceeding vector size
        if boat(2) ~= size(playerVec, 1) && playerVec(boat(2) + 1, boat(1)) == i
            %south      
            len = 1;
            %count south until no longer
            while boat(2) + len <= size(playerVec, 1) && playerVec(boat(2) + len, boat(1)) == i
                 len = len + 1;
            end

            %append to boatData
            boatData = [boatData; [boat(1), boat(2), 1, len]];

            %add boat to img
            if i == recent
                boardImage = drawRectangleBoard(boardImage, cord(boat(1))-30, cord(boat(2))-30, cord(boat(1))+30, cord(boat(2) + len - 1)+30, 30, 0.1, 0.8, 0.8);
            else
                boardImage = drawRectangleBoard(boardImage, cord(boat(1))-30, cord(boat(2))-30, cord(boat(1))+30, cord(boat(2) + len - 1)+30, 30, 1, 1, 1);
            end

        elseif boat(1) ~= size(playerVec, 2) && playerVec(boat(2), boat(1) + 1) == i
            %east     
            len = 0;
            %count east until no longer
            while boat(1) + len <= size(playerVec, 2) && playerVec(boat(2), boat(1) + len) == i
                 len = len + 1;
            end

            %append to boatData
            boatData = [boatData; [boat(1), boat(2), 2, len]];

            %add boat to img
            if i == recent
               boardImage = drawRectangleBoard(boardImage, cord(boat(1))-30, cord(boat(2))-30, cord(boat(1) + len - 1)+30, cord(boat(2))+30, 30, 0.1, 0.8, 0.8);
            else
               boardImage = drawRectangleBoard(boardImage, cord(boat(1))-30, cord(boat(2))-30, cord(boat(1) + len - 1)+30, cord(boat(2))+30, 30, 1, 1, 1);
            end

        else
            %must be 1 by 1
            %append to boatData
            boatData = [boatData; [boat(1), boat(2), 3, 1]];

             %add boat to img
            if i == recent
                boardImage = drawRectangleBoard(boardImage, cord(boat(1))-30, cord(boat(2))-30, cord(boat(1))+30, cord(boat(2))+30, 30, 0.1, 0.8, 0.8);
            else
                boardImage = drawRectangleBoard(boardImage, cord(boat(1))-30, cord(boat(2))-30, cord(boat(1))+30, cord(boat(2))+30, 30, 1, 1, 1);
            end
        end          
    end
end