class AddImageToRecord < ActiveRecord::Migration[5.2]
  def change
    add_column :records, :image, :string
  end
end
