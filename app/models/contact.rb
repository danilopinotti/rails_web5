class Contact < ActiveRecord::Base
  # => Diz que contato faz parte de "user"
  belongs_to :user

  # => dependent: :destroy -> Quando apagar, apagar os também os "phones"
  # => dependent: :restrict -> Não permite apagar caso tenha "phones"
  # => :dependent => :destroy é igual a dependent: :destroy
  has_many :phones, dependent: :destroy

  # => Libera o model para poder trabalhar com "phones"
  accepts_nested_attributes_for :phones,
    reject_if: lambda { |a| a[:number].blank?}, # => Rejeitar caso o número vier em branco
    allow_destroy: true # => Deixa apagar o registro do model "phone" através no model Contact
end
