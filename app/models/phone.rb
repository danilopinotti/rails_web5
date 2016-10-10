class Phone < ActiveRecord::Base
  belongs_to :contact

  # Callback
  before_save do
    if self.default
        contact.phones.each do |phone|
            phone.update! default: false
        end
      end
    end

end
