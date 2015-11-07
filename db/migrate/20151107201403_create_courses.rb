class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.integer :number
      t.string :school
      t.string :title
      t.integer :hours

      t.timestamps null: false
    end
  end
end
