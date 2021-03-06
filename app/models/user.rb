class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :first_name, :last_name

  has_many :bets

  def bet_setup_step
    bets.count
  end

  def placed_full_bet?
  	bets.count == 6
  end

  def name_with_nickname
    "#{first_name.try(:capitalize)} '#{nickname.try(:capitalize)}' #{last_name.try(:capitalize)}"
  end

end
