class Student < ActiveRecord::Base
  has_many :completes

  def self.search(search)
    if search
      where('lname LIKE ?', "%#{search}%")
    end
  end
end
