function rectangles(strings)
    if isempty(strings) || length(strings) <= 1 return 0 end
    rows = length(strings)
    cols = length(strings[1])
    corners = Tuple{Int,Int}[]
    #collect corners
    for i in 1:rows
        line = strings[i]
        for j in 1:cols
            if line[j] == '+'
                push!(corners,(i,j))
            end
        end
    end
    #check top left bottom right corners
    prospect = length(corners)
    if prospect <= 3 return 0 end
    count = 0
    for k in 1:(prospect-3)
        tl = corners[k]
        for l in (k+3):prospect
            br = corners[l]
            if tl[1] >= br[1] || tl[2] >= br[2]
                continue
            end
            #check bottom left top right corners
            tr = (tl[1],br[2])
            bl = (br[1],tl[2])
            slice = corners[k+1:l-1]
            if (tr in slice) && (bl in slice)
                #check edges
                width = tr[2] - tl[2] - 1
                height = bl[1] - tl[1] - 1
                if check_edge(strings,tl,height) && check_edge(strings,tl,width,false) && check_edge(strings,tr,height) && check_edge(strings,bl,width,false)
                    count += 1
                end
            end
        end
    end
    return count
end

function check_edge(array,start,times,vertical=true)
    if times == 0 return true end
    if times < 0 throw(ArgumentError("no intervening length")) end
    i = start[1]
    j = start[2]
    if vertical
        for k in 1:times
            test = array[i+k][j]
            if !(test == '+' || test == '|')
                return false
            end
        end
    else
        hor = array[i]
        for l in 1:times
            test = hor[j+l]
            if !(test == '+' || test == '-')
                return false
            end
        end
    end
    return true
end