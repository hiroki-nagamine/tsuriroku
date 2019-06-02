class AddDateToRecord < ActiveRecord::Migration[5.2]
  def change
    add_column :records, :date, :date
  end
end
