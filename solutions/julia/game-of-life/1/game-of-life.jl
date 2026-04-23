function gameoflife(matrix)
    length = size(matrix,1)
    width = size(matrix,2)
    generation = zeros(Int64,length,width)
    for i in 1:length
        for j in 1:width
            b_length = max(1,i-1)
            b_width = max(1,j-1)
            c_length = min(length,i+1)
            c_width = min(width,j+1)
            total = sum(matrix[b_length:c_length,b_width:c_width])
            if total == 3 || (matrix[i,j] == 1 && total == 4)
                generation[i,j] = 1
            end
        end
    end
    return generation
end