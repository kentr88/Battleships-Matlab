boardImage=imread('board1.png');

for i = 1:10
    for j = 1:10
        boardImage = drawRectangleBoard(boardImage, cord(i)-43, cord(j)-43, cord(i)+43, cord(j)+43, 3, i/10, j/10, i/10);
    end
end

imshow(boardImage);