def combine_anagrams(words)

    ret = Hash.new
    out = Array.new

    words.each do |i|
        if ret[i.downcase.chars.sort.join.to_s] == nil
            ret[i.downcase.chars.sort.join.to_s] = Array.new
        end

        ret[i.downcase.chars.sort.join.to_s].push(i)

    end

    ret.each do |i|
        out.push(i[1])
    end

    return out

end


#p combine_anagrams( ['cARs', 'for', 'potatoes', 'racs', 'four','scar', 'creams', 'scream'] )
