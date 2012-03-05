
class Dessert
    def initialize(name, calories)
        @name, @calories = name, calories.to_i
    end

    def setName=(value) 
        @name = value
    end

    def getName
        @name
    end

    def setCalories=(value)
        @calories = value
    end

    def getCalories
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

    def setFlavor=(value) 
        @flavor = value
    end

    def getFlavor
        @flavor
    end


    def delicious?
        if @flavor.downcase == 'black licorice'
            return false
        end
        return true
    end
end


# d = Dessert.new('awesome', 100)
# p d.healthy?
# 
# ew = JellyBean.new('ew', 100, 'black licorice')
# p ew.delicious?
# 
# yay = JellyBean.new('yay', 100, 'vanilla')
# p yay.delicious?
