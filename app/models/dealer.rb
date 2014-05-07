class Dealer < Parent
  devise :database_authenticatable, :confirmable, :recoverable, :trackable, :validatable
  mount_uploader :logo, DealerLogoUploader
  def full_name
    first_name+" "+last_name
  end
  def deactivate_account
    self.reset_confirmation_token!
    self.confirmed_at = nil
    self.confirmation_sent_at = nil
  end
end
