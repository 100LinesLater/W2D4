def bad_two_sum?(arr, target)
    arr.each_index do |idx1|
        arr.each_index do |idx2|
            next if idx1 == idx2
            return true if arr[idx1] + arr[idx2] == target 
        end
    end
    false
end

def okay_two_sum?(arr, target)
    arr.sort!
    arr.each_with_index {|val, i| return true if bsearch((arr[0...i]) + (arr[i + 1..-1]), target - val)}
    false
end

def bsearch(arr, target)
    return false if arr.empty?
    mid = arr.length / 2
    return true if arr[mid] == target

    if arr[mid] > target 
        bsearch(arr[0...mid], target)
    else 
        bsearch(arr[mid + 1..-1], target)
    end
end

def better_two_sum?(array, target)
    hash = Hash.new(0)

    array.each do |num|
        hash[target - num] += 1 #unless (num * 2 == target)
    end 

    hash.select{|key,value|value >= 2}.each_key{|key|return true if target / 2 == key}

    hash.delete(target / 2)

    array.each do |num|
        if hash.key?(num)
            return true 
        end
    end 

    false 
end

#iterate thru arr
#for each val, bsearch (target - val )
arr = [0, 1, 5, 7]
arr2 = [0,1,3,3,5,5,7,8,9,9,10,12]
p better_two_sum?(arr2, 15)
p better_two_sum?(arr2, 2)
