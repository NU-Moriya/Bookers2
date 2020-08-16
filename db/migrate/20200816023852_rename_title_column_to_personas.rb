class RenameTitleColumnToPersonas < ActiveRecord::Migration[5.2]
  def change
    rename_column :users, :title, :name
  end
end
