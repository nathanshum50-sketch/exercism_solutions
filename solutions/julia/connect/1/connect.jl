function connect(board)
    if isempty(board) return "" end
    height = length(board)
    width = board[1]
    if isempty(width) return "" end
    width = length(width)
    width = width - width ÷ 2
    #check for X
    #starting positions
    x_start = Vector{Pair{Int,Int}}([])
    x_all = Set{Pair{Int,Int}}()
    for i in 1:height
        if board[i][i] == 'X'
            push!(x_start, i => i)
            push!(x_all, i => i)
        end
    end
    while length(x_start) > 0
        unit = x_start[end]
        h = unit.first
        w = unit.second
        if w == h - 2 + 2*width return "X" end
        pop!(x_start)
        if h > 1
            if board[h-1][w+1] == 'X' && !((h-1 => w+1) in x_all)
                push!(x_start, h - 1 => w + 1)
                push!(x_all, h - 1 => w + 1)
            end
            if board[h-1][w-1] == 'X' && !((h-1 => w-1) in x_all)
                push!(x_start, h - 1 => w - 1)
                push!(x_all, h - 1 => w - 1)
            end
        end
        if h < height
            if board[h+1][w+1] == 'X' && !((h+1 => w+1) in x_all)
                push!(x_start, h + 1 => w + 1)
                push!(x_all, h + 1 => w + 1)
            end
            if w > h && board[h+1][w-1] == 'X' && !((h+1 => w-1) in x_all)
                push!(x_start, h + 1 => w - 1)
                push!(x_all, h + 1 => w - 1)
            end
        end
        if w > h && board[h][w-2] == 'X' && !((h => w-2) in x_all)
            push!(x_start, h => w - 2)
            push!(x_all, h => w - 2)
        end
        if board[h][w+2] == 'X' && !((h => w+2) in x_all)
            push!(x_start, h => w + 2)
            push!(x_all, h => w + 2)
        end
    end
    #find O
    #starting positions
    o_start = Vector{Pair{Int,Int}}([])
    o_all = Set{Pair{Int,Int}}()
    plate = board[1]
    for j in 1:width
        if plate[2*j-1] == 'O'
            push!(o_start, 1 => 2*j-1)
            push!(o_all, 1 => 2*j-1)
        end
    end
    while length(o_start) > 0
        unit = o_start[end]
        h = unit.first
        w = unit.second
        if h == height return "O" end
        pop!(o_start)
        if w < 2*width-2+h
            if h > 1 && board[h-1][w+1] == 'O' && !((h-1 => w+1) in o_all)
                push!(o_start, h - 1 => w + 1)
                push!(o_all, h - 1 => w + 1)
            end
            if board[h][w+2] == 'O' && !((h => w+2) in o_all)
                push!(o_start, h => w + 2)
                push!(o_all, h => w + 2)
            end
        end
        if w > h
            if board[h+1][w-1] == 'O'
                push!(o_start, h + 1 => w - 1)
                push!(o_all, h + 1 => w - 1)
            end
            if board[h][w-2] == 'O' && !((h => w-2) in o_all)
                push!(o_start, h => w - 2)
                push!(o_all, h => w - 2)
            end
        end
        if h > 1 && board[h-1][w-1] == 'O' && !((h-1 => w-1) in o_all)
            push!(o_start, h - 1 => w - 1)
            push!(o_all, h - 1 => w - 1)
        end
        if board[h+1][w+1] == 'O' && !((h+1 => w+1) in o_all)
            push!(o_start, h + 1 => w + 1)
            push!(o_all, h + 1 => w + 1)
        end
    end
    return ""
end
