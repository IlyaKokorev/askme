class AddAuthorToQuestion < ActiveRecord::Migration[6.0]
  def change
    add_column :questions, :author, :integer
  end
end
