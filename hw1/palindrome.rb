def palindrome?(string) 

    clean = (string.downcase).gsub(/[^[:alnum:]]/, '')    
    if clean.reverse == clean
        return true
    else
        return false
    end

end

def count_words(string)

    freq = Hash.new(0)
    string.downcase.scan(/\w+/){|w| freq[w] += 1}
    return freq

end

#p palindrome?("A man, a plan, a canal -- Panama")
#p count_words("A man, a plan, a canal -- Panama")
#p palindrome?("Madam, I'm Adam!")
#p palindrome?("Abracadabra")



