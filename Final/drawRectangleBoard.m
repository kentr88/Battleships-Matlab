function boardImage = drawRectangleBoard(boardImage, x1, y1, x2, y2, thickness, r, g, b)
    %draw rectange between x1 y1 and x2 y2
    %loop j for thickness(offset radius)
    for j = 0:thickness
        %draw top
        for i = x1:x2
            boardImage(y1 + j, i, 1) = uint8(r*255);
            boardImage(y1 + j, i, 2) = uint8(g*255);
            boardImage(y1 + j, i, 3) = uint8(b*255);
        end

        %draw bottom
        for i = x1:x2
            boardImage(y2 - j, i, 1) = uint8(r*255);
            boardImage(y2 - j, i, 2) = uint8(g*255);
            boardImage(y2 - j, i, 3) = uint8(b*255);
        end

        %draw left
        for i = y1:y2
            boardImage(i, x1 + j, 1) = uint8(r*255);
            boardImage(i, x1 + j, 2) = uint8(g*255);
            boardImage(i, x1 + j, 3) = uint8(b*255);
        end

        %draw right
        for i = y1:y2
            boardImage(i, x2 - j, 1) = uint8(r*255);
            boardImage(i, x2 - j, 2) = uint8(g*255);
            boardImage(i, x2 - j, 3) = uint8(b*255);
        end
    end
end

