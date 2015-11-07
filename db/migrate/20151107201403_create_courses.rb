class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.int :number
      t.string :school
      t.string :title
      t.int :hours

      t.timestamps null: false
    end
  end
end
