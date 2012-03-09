
class Class

    def attr_accessor_with_history(attr_name)
        attr_name = attr_name.to_s # make sure it's a string
        
        attr_reader attr_name # create the attribute's getter

        attr_reader attr_name+"_history" # create bar_history getter

        class_eval { 
            # create a setter method named value of attr_name
            define_method "#{attr_name}=" do |value|

                # history is either already existing or we make array with member of nil
                history = send("#{attr_name}_history") || [nil]

                # push the value for the setter to history 
                # history.push() returns the new history array, which we set to be the "attr_name"_history variable
                instance_variable_set "@#{attr_name}_history", history.push(value)

                # set the actual attr_name variable to the value - replacement for attr_writer
                instance_variable_set "@#{attr_name}", value
            end
            
        }

    end
end

class Foo
    attr_accessor_with_history :bar
end

f = Foo.new
f.bar = 1
f.bar = 2
p f.bar_history
