class Transfer < ActiveRecord::Base

  validate :check_balance
  before_create :transfer_balance

  belongs_to :user

  def transfer_balance
    from = User.find(user_id)
    to = User.find(to_user)

    from.update_attribute(:balance, from.balance.to_s.to_d-amount)
    to.update_attribute(:balance, to.balance.to_s.to_d+amount)
  end

  def check_balance
    if amount.to_s.to_d <= 0 || amount.to_s.to_d > user.balance.to_s.to_d
      errors.add(:base, 'You do not have enough balance or invalid value')
    end
  end

  def origin
    User.find(user_id)
  end

  def destiny
    User.find(to_user)
  end

end
