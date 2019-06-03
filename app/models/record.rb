class Record < ApplicationRecord
  belongs_to :user
  mount_uploader :image, ImagesUploader
  validates :size, presence: true, length: {maximum: 10}
  validates :weight, presence: true, length: {maximum: 10}
  validates :place, presence: true, length: {maximum: 30}
  validates :lure, presence: true, length: {maximum: 30}
  validates :wether, presence: true, length: {maximum: 20}
  validates :date, presence: true, length: {maximum: 20}
  validates :content,presence: true, length: {maximum: 255}
end
