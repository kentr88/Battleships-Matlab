function boardImage = drawCrossBoard(boardImage, x, y, len, thickness, r, g, b)
    %draws cross centered on x/y

    for i = (-len /2):(len / 2)
        %3rd dimention represents rgb, set all to 255 for white
        %loop for thickness - j is offset
        %draw \
        for j = (-thickness / 2):(thickness / 2)
        boardImage(int16(y + i), int16(x + i + j), 1) = uint8(r*255);
        boardImage(int16(y + i), int16(x + i + j), 2) = uint8(g*255);
        boardImage(int16(y + i), int16(x + i + j), 3) = uint8(b*255);
        
        %draw /
        boardImage(int16(y - i), int16(x + i + j), 1) = uint8(r*255);
        boardImage(int16(y - i), int16(x + i + j), 2) = uint8(g*255);
        boardImage(int16(y - i), int16(x + i + j), 3) = uint8(b*255);
        end
    end
end