class Expense < ActiveRecord::Base
  belongs_to :user
  belongs_to :apartment
end
