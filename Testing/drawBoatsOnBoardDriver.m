% load an image
boardImage=imread('board1.png');

%test 1000 times with random generated boards
for i = 1:1000
    vec = getAiBoatPosition(zeros(10, 10), [5 4 3 3 2]);
    boardImage = drawBoatsOnBoard(boardImage, vec, 5, 5);
end

imshow(boardImage);

% vec = getAiBoatPosition(zeros(10, 10), [5 4 3 3 2]);
% board = drawBoatsOnBoard(boardImage, vec, 5, 5);
% imshow(board);