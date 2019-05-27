class AddContentToRecords < ActiveRecord::Migration[5.2]
  def change
    add_column :records, :content, :string
  end
end
