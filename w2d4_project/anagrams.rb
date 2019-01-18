def first_anagram?(string)
    string.chars.permutation.map(&:join)
end

def second_anagram?(str1, str2)
    str1.each_char do |ch|
        idx = str2.index(ch)
        chars = str2.chars
        chars.delete_at(idx)
        str2 = chars.join
    end
    str2.empty?
end

second_anagram?("elvise", "livese")

def third_anagram?(str1, str2)
    str1.chars.sort == str2.chars.sort 
end 

# p third_anagram?("elvise", "livese")

def fourth_anagram?(str1, str2)
    hash1 = Hash.new(0)
    # hash2 = Hash.new(0)

    (0..str1.length - 1).each do |idx|
        hash1[str1[idx]] += 1
        # hash2[str2[idx]] += 1
    end 

    str2.each_char do |char|
        hash1[char] -= 1
    end 

    # hash1 == hash2
    hash1.all?{|key, value|value == 0}
end 



p fourth_anagram?("elvise", "livese")

