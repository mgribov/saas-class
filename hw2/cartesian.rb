class CartesianProduct
    include Enumerable

    def initialize(col1, col2)
        @col1, @col2 = col1, col2
    end


    def each
        result = Array.new
        @col1.each do |c1|
            @col2.each do |c2|
                yield [c1, c2]
            end
        end
    end

end

#c = CartesianProduct.new([:a,:b], [4,5])
#c.each { |elt| puts elt.inspect }
# [:a, 4]
# [:a, 5]
# [:b, 4]
# [:b, 5]

#c = CartesianProduct.new([:a,:b], [])
#c.each { |elt| puts elt.inspect }
# (nothing printed since Cartesian product
# of anything with an empty collection is empty)

