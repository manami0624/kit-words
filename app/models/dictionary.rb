class Dictionary < ApplicationRecord
  belongs_to :user

  def self.search(search)
    if search != ""
      Dictionary.where(['vocabulary LIKE ?', "%#{search}%"])
    else
      Dictionary.all
    end
  end
end
