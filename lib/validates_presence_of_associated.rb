module ActiveRecord
  class Base
    def self.validates_presence_of_associated(*args)
      args.each do |attribute|
        validates_presence_of "#{attribute}_id", 
          :unless => Proc.new { |obj| 
            obj.send(attribute).present? && obj.send(attribute).new_record?
        }
      end
    end
  end
end
