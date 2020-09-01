class Company < ApplicationRecord
  belongs_to :user
  validates :cnpj, :name, presence: true
  validates :cnpj, format: { with: /\A\d{2}\.\d{3}\.\d{3}\/\d{4}\-\d{2}\z/, message: "invalid CNPJ" }
end
