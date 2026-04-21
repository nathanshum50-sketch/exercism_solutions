function spiral_matrix(n)
    n < 0 && throw(DomainError("Negative size"))
    matrix = Matrix{Int}(undef,n,n)
    movement = [0,1]
    start = [1,1]
    ending = n*n
    inbound(row,column) = 1 <= row <= n && 1 <= column <= n
    for i in 1:ending
        matrix[start[1],start[2]] = i
        if i == ending
            break
        end
        horz = start[1] + movement[1]
        vert = start[2] + movement[2]
        if inbound(horz,vert)
            if matrix[horz,vert] > 0   
                if movement[1] == 1
                    movement[1] = 0
                    movement[2] = -1
                elseif movement[2] == 1
                    movement[2] = 0
                    movement[1] = 1
                elseif movement[2] == 0
                    movement[1] = 0
                    movement[2] = 1
                else
                    movement[1] = -1
                    movement[2] = 0
                end
            end
        elseif horz > n
            movement[1] = 0
            movement[2] = -1
        elseif vert > n
            movement[2] = 0
            movement[1] = 1
        elseif horz < 1
            movement[1] = 0
            movement[2] = 1
        else
            movement[1] = -1
            movement[2] = 0
        end
        start = start .+ movement
    end
    return matrix
end
