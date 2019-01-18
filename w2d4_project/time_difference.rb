def my_min(list)
    min = list.first

    list.each do |item1|
        list.each do |item2|
            min = item2 if item2 < min
        end
    end
    min
end

def my_min2(list)
    min = list.first 

    list.each do |item|
        min = item if item < min
    end
    min
end

def sub_sum(list)
    combinations = []
    list.each_index do |i|
        list.each_index do |j|
            combinations << list[i..j]
        end
    end
    max = combinations.first.inject(:+)
    combinations.each do |combo|
        max = combo.inject(:+) if combo.inject(:+) > max
    end
    max
end

def better_sub_sum(list)
    largest_tally = list.first
    tally = 0

    list.each_with_index do |num, i|
        if tally < 0 #&& largest_tally > tally
            tally = 0 
        end 
        tally += num 
        # next if i == 0 
        largest_tally = tally if tally > largest_tally
    end 
    largest_tally
end

if __FILE__ == $PROGRAM_NAME

list = [2, 3, -6, 7, -6, 7] # => 8
p better_sub_sum(list)

list2 = [-5, -1, -3] # => -1
p better_sub_sum(list2)

list3 = [5, 3, -7] # => 8
p better_sub_sum(list3)



end 

