class CreateRelationships < ActiveRecord::Migration[5.2]
  def change
    create_table :relationships do |t|
      t.references :user, foreign_key: true
      t.references :follow, foreign_key: { to_table: :users } #外部キーとしてユーザーテーブルを参照するという指定

      t.timestamps
      
      t.index [:user_id, :follow_id], unique: true #ペアで重複するものが保存されないようにするデータベースの設定
    end
  end
end
