class CreateCompletes < ActiveRecord::Migration
  def change
    create_table :completes do |t|
      t.integer :student_id
      t.integer :course_id
      t.string :grade
      t.timestamps null: false
    end
  end
end
