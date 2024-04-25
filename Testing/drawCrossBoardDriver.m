boardImage=imread('board1.png');

for j = 1:10
    for i = 1:10
        boardImage = drawCrossBoard(boardImage, cord(i), cord(j), 50, 4, j/10, (j+i)/20, i/10);
    end
end

%function will only be used with cord as x and y input in game and constant
%sizes and thicknesses

imshow(boardImage);