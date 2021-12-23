function outM = oneSweep(inM)

nr = size(inM,1); 
nc = size(inM,2); 

outM = zeros(size(inM)); % Set up storage
n_neighbors = zeros(size(inM));

for i = 1:nr 
    for j = 1:nc 
        
        % Edge cases (If you are at the edge of matrix & go out of bounds)
        if i == 1 
            if j == 1 % If i and j == 1
                x = inM(1:2,j:j+1);
            elseif j == nc % If you are at the last col
                x = inM(1:2,j-1:j);
            else
                x = inM(1:2,j-1:j+1);
            end
        elseif i == nr % If you are at the last row
            if j == 1 % If you are at the last row and first col
                x = inM(i-1:i,j:j+1);
            elseif j == nc % If you are at the last col
                x = inM(i-1:i,j-1:j);
            else
                x = inM(i-1:i,j-1:j+1);
            end
        elseif j == 1 % If you are at first col 
            x = inM(i-1:i+1,j:j+1);
        elseif j == nc % If you are at last col
            x = inM(i-1:i+1,j-1:j);
        else % Default case, if you are at the "center"
            x = inM(i-1:i+1,j-1:j+1);
        end
        
        y = sum(x);
        z = sum(y);
        n_neighbors(i,j) = z - inM(i,j);
    end
end
            
% Advance the state of the game by looping over n_neighbors
for i = 1:size(n_neighbors,1)
    for j = 1:size(n_neighbors,2)
        % A live cell with fewer than 2 live neighbors dies 
        if n_neighbors(i,j) < 2
            outM(i,j) = 0;
        % A live cell with 2 or 3 live neighbors lives on.
        elseif (n_neighbors(i,j) > 1) && (n_neighbors(i,j) < 4)
            outM(i,j) = inM(i,j);
       % A live cell with more than 3 live neighbors dies (overcrowding).
        elseif n_neighbors(i,j) > 3
            outM(i,j) = 0;
        end
        %A dead cell with exactly 3 live neighbors becomes live
        if n_neighbors(i,j) == 3
            outM(i,j) = 1;
        end
    end
end