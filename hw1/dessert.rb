
class Dessert
    def initialize(name, calories)
        @name, @calories = name, calories.to_i
    end

    def name=(value) 
        @name = value
    end

    def name
        @name
    end

    def calories=(value)
        @calories = value
    end

    def calories
        @calories
    end

    def healthy?
        if @calories.to_i > 200  
            return false
        end
        return true
    end

    def delicious?
        return true
    end
end


class JellyBean < Dessert
    def initialize(name, calories, flavor)
        @name, @calories, @flavor = name, calories.to_i, flavor
    end

    def flavor=(value) 
        @flavor = value
    end

    def flavor
        @flavor
    end


    def delicious?
        if @flavor.downcase == 'black licorice'
            return false
        end
        return true
    end
end


#d = Dessert.new('cake', 100)
#p d.healthy?
#d.name = 'wee'
#p d.name

# 
# ew = JellyBean.new('ew', 100, 'black licorice')
# p ew.delicious?
# 
#yay = JellyBean.new('yay', 100, 'strawberry')
#p yay.delicious?
#yay.flavor = 'sucks'
#p yay.flavor
