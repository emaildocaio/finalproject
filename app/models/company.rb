require 'open-uri'
require 'nokogiri'


class Company < ApplicationRecord
  belongs_to :user
  has_many :products, dependent: :destroy
  validates :cnpj, :name, presence: true
  validates :cnpj, format: { with: /\A\d{2}\.\d{3}\.\d{3}\/\d{4}\-\d{2}\z/, message: "invalid CNPJ" }
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  def self.parse_trip_advisor

    html_content = open('https://www.tripadvisor.com.br/Attractions-g1056623-Activities-c55-Arraial_do_Cabo_State_of_Rio_de_Janeiro.html').read
    doc = Nokogiri::HTML(html_content)
    puts doc
    doc.search('._6sUF3jUd').each_with_index do |element, index|
      puts "#{index + 1}. #{element}"
    end
  end
end
