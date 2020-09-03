class Company < ApplicationRecord
  belongs_to :user
  has_many :products, dependent: :destroy
  validates :cnpj, :name, presence: true
  validates :cnpj, format: { with: /\A\d{2}\.\d{3}\.\d{3}\/\d{4}\-\d{2}\z/, message: "invalid CNPJ" }
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end

