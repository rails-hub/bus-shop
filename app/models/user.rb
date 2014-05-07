class User < Parent
  devise :database_authenticatable, :confirmable, :recoverable, :trackable, :validatable
  has_one :permission
  def full_name
   "#{first_name} #{last_name}"
  end
  
  def deactivate_account
    self.reset_confirmation_token!
    self.confirmed_at = nil
    self.confirmation_sent_at = nil
  end
end
