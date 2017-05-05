module Validation
  def self.included(base)
    base.extend ClassMethods
    base.send :include, InstanceMethods
  end

  module ClassMethods
    def validate(name, validation, parameter = nil)
      @validations ||= []
      @validations << { attr: name, validation: validation, parameter: parameter }
    end
  end

  module InstanceMethods
    def validate!
      validations = self.class.instance_variable_get(:@validations)

      validations.each do |validation|
        attr = instance_variable_get("@#{validation[:attr]}")
        type_validation = validation[:validation]
        parameter = validation[:parameter]

        send(type_validation.to_s, attr, parameter)
      end
    end

    def valid?
      validate!
      true
    rescue
      false
    end

    private

    def presence(attr, _parameter)
      raise 'Ваш атрибут равен нулю или пуст!!!' if attr.nil? || attr.empty?
    end

    def format(attr, parameter)
      raise 'Ваш атрибут не соответствует формату!!!' if attr !~ parameter
    end

    def type(attr, parameter)
      raise "Ваш класс атрибута не #{parameter}" unless attr.is_a?(parameter)
    end
  end
end