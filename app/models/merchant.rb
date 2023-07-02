class Merchant < User
  has_many :transactions, :dependent => :restrict_with_error
end
