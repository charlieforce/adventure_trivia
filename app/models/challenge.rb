class Challenge < ActiveRecord::Base
  belongs_to :adventure
  has_one :riddle, dependent: :destroy
  has_many :questions, dependent: :destroy

  # geocoded_by / geocode methods come from the Geocoder gem
  geocoded_by :address
  before_validation :geocode          # auto-fetch coordinates

  validates :address, presence: true
  validates :latitude, presence: true
  validates :longitude, presence: true

  #accepts_nested_attributes_for :questions, allow_destroy: true,
  #  reject_if: lambda {|x| x[:content].empty? }

  #accepts_nested_attributes_for :riddles, allow_destroy: true,
  #  reject_if: lambda {|x| x[:content].empty? }

end
