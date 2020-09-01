class Company < ApplicationRecord
  belongs_to :user
  validates: :cpnj, :name, presence: true
  validates: :cnpj, format: { with: /^\d{2}\.\d{3}\.\d{3}\/\d{4}\-\d{2}$/, message: "invalid CNPJ" }
end
