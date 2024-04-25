function boatRemains = checkIfSunkBoat(otherPlayerVec, x, y)
%check if boart remains for hit/hit and sunk prompt
    boatNumber = otherPlayerVec(y, x);
    boatRemains = true;

    %loop through entire array
    for yindex = 1:1:size(otherPlayerVec, 1)
        for xindex = 1:1:size(otherPlayerVec, 2)

            %make sure position is not the one just hit
            %(hasn't been set to bombed yet)
            if ~(yindex == y && xindex == x)
                %check if there are any other squares with that boat
                if otherPlayerVec(yindex, xindex) == boatNumber
                    %if there is set to true
                    boatRemains = false;
                end
            end
        end
    end
end