class CreateRecords < ActiveRecord::Migration[5.2]
  def change
    create_table :records do |t|
      t.string :size
      t.string :weight
      t.string :place
      t.string :lure
      t.string :wether
      t.string :date
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
