class AddEmphasisToStudent < ActiveRecord::Migration
  def change
    add_column :students, :emphasis, :string
  end
end
