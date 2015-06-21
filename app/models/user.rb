class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def name
    email
  end

  validates :first_name, :last_name, presence: true, if: :personal?
  validates :business_name, :business_address,:business_website,:contact_first_name, :contact_last_name,  presence: true, if: :business?


  def personal?
    self.account_type == User::AccountType::PERSONAL
  end

  def business?
    self.account_type == User::AccountType::BUSINESS
  end


  module AccountType
    PERSONAL = 0
    BUSINESS = 1
  end

end
