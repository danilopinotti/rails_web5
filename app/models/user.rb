class User < ActiveRecord::Base
    # Colocar relacionamentos antes das validações
    has_many :contacts

    validates_presence_of :name
    validates_uniqueness_of :name
    validates_numericality_of :age, greater_than: 0, allow_nil: true
end
