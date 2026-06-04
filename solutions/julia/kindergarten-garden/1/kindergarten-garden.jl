function plants(diagram, student)
    class = ["Alice","Bob","Charlie","David","Eve","Fred","Ginny","Harriet","Ileana","Joseph","Kincaid","Larry"]
    new = split(diagram,'\n')
    top = new[1]
    bottom = new[2]
    base = 1
    for classmate in class
        if classmate == student
            front = base*2-1
            list = [top[front],top[front+1],bottom[front],bottom[front+1]]
            return encoding.(list)
        else
            base += 1
        end
    end
    if base > length(class) throw(ArgumentError("Not a valid student.")) end
end

function encoding(letter)
    code = ['G','C','R','V']
    plants = ["grass","clover","radishes","violets"]
    comprehension = Dict(zip(code,plants))
    return comprehension[letter]
end