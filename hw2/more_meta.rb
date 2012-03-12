class Numeric
    @@currencies = { 'dollar' => 1, 'yen' => 0.013, 'euro' => 1.292, 'rupee' => 0.019}

    def method_missing(method_id)
        @@singular_currency = method_id.to_s.gsub(/s$/, '')

        if @@currencies.has_key?(@@singular_currency)
            self * @@currencies[@@singular_currency]
        else
            super
        end
    end

    def in(cur)
        # cheap trick, if we're already this cur, just upconvert
         if cur.to_s.gsub(/s$/, '') == @@singular_currency
             return self / @@currencies[@@singular_currency]
         end
 
        return self / @@currencies[cur.to_s.gsub(/s$/, '')]
        #send("#{cur.to_s}")
    end
end

class String
    def palindrome?
        clean = (self.downcase).gsub(/[^[:alnum:]]/, '')
        if clean.reverse == clean
            return true
        else
            return false
        end
    end

end

module Palindrome
    def palindrome?
        if self.respond_to?('reverse')
            if self.reverse == self
                return true
            else
                return false
            end
        elsif self.respond_to?('each')
            t = Array.new
            self.each do |c|
                t.push(c)
            end
            return t.palindrome?
        end
        return false
    end
end

class Array
    include Palindrome
end
class Hash
    include Palindrome
end
class Range
    include Palindrome
end
class Enumerator
    include Palindrome
end

# def test_palindrome_on_enumerables()
#   raise "radar EXPECTED_PALINDROME" unless "radar".palindrome?
#   raise "bogus NOT_EXPECTED_PALINDROME" unless !"bogus".palindrome?
#   raise "EXPECTED_PALINDROME" unless [1,2,3,2,1].palindrome?
#   raise "NOT_EXPECTED_PALINDROME" unless ![99,1,2,3,2,1].palindrome?
#   raise "NOT_EXPECTED_PALINDROME" unless !{:a=>1,:b=>2,:c=>1}.palindrome?
#   raise "EXPECTED_CHARS_PALINDROME" unless "radar".chars.palindrome?
#   raise "NOT_EXPECTED_CHARS_PALINDROME" unless !"NOTradar".chars.palindrome?
#   raise "EXPECTED_STRING_PALINDROME" unless "radar".palindrome?
#   raise "NOT_EXPECTED_STRING_PALINDROME" unless !"BOGUS_radar".palindrome?
#   raise "EXPECTED_STRING_PALINDROME" unless "a man a plan a- canal panama".palindrome?
#   raise "NOT_EXPECTED_RANGE_PALINDROME" unless !(1..3).palindrome?
# end
# test_palindrome_on_enumerables()
# 

#test = [[1,2],[1,2]]
#test.each do |x|
#    p x.palindrome?
#end

#p 1.euro.in(:dollar)
#p 1.yen.in(:dollar)
#p 2.dollar.in(:euro)
#r = 5.rupees
#y = r.in(:yens)

#p r
#p y

#p "A man, a plan, a canal -- Panama".palindrome?

#p [1,2,3,2,1].palindrome?

#a= {"hello" => "world"}.palindrome?
#p a
#p (1..5).palindrome?
