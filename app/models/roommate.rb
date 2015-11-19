class Roommate < ActiveRecord::Base
  belongs_to :user
  belongs_to :apartment
  has_many :expenses
end
