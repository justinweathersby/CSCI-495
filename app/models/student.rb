class Student < ActiveRecord::Base
  # attr_accessible :id, :course_id, :student_id, :completes_attributes
  has_many :completes
  accepts_nested_attributes_for :completes, reject_if: :all_blank, allow_destroy: true

  def self.search(search)
    if search
      where('lname LIKE ?', "%#{search}%")
    end
  end
end
