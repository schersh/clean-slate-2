class Apartment < ActiveRecord::Base
  has_many :users
  has_many :expenses, through: :users

  def get_total
    if self.expenses.empty?
      0
    else
      self.expenses.map {|expense| expense.amount}.reduce(:+)
    end
  end

  def roommate_sums
    users = self.users
    apartment_total = self.get_total
    apartment_average = (apartment_total / users.length)
    roommate_sums = []
    users.each do |user|
      total = user.expenses.map {|expense| expense.amount}.reduce(:+) || 0
      balance = apartment_average - total
      roommate_sums << {:total => total, :balance => balance, :user => user}
    end
    return roommate_sums
  end

  def clean_slate
   expenses = self.expenses
   expenses.each do |expense|
     expense.delete
   end
  end

end
