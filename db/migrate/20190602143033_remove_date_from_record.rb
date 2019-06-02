class RemoveDateFromRecord < ActiveRecord::Migration[5.2]
  def change
    remove_column :records, :date, :string
  end
end
