class Record < ApplicationRecord
  belongs_to :user
  has_many :articles #中間テーブルarticles 多対多の関係
  has_many :users, through: :articles 
  
  mount_uploader :image, ImagesUploader
  
  validates :size, presence: true, length: {maximum: 10}
  validates :weight, presence: true, length: {maximum: 10}
  validates :place, presence: true, length: {maximum: 30}
  validates :lure, presence: true, length: {maximum: 30}
  validates :wether, presence: true, length: {maximum: 20}
  validates :date, presence: true, length: {maximum: 20}
  validates :content,presence: true, length: {maximum: 255}
end
