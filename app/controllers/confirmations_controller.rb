# app/controllers/confirmations_controller.rb
class ConfirmationsController < Devise::PasswordsController
  # Remove the first skip_before_filter (:require_no_authentication) if you
  # don't want to enable logged users to access the confirmation page.
  skip_before_filter :require_no_authentication
  skip_before_filter :authenticate_user!

  # PUT /resource/confirmation
  def update
    with_unconfirmed_confirmable do
      if @confirmable.has_no_password?
        @confirmable.attempt_set_password(params[:user])
        if @confirmable.valid?
          do_confirm
        else
          do_show
          @confirmable.errors.clear #so that we wont render :new
        end
      else
        self.class.add_error_on(self, :email, :password_allready_set)
      end
    end

    if !@confirmable.errors.empty?
      render 'confirmations/new' #Change this if you doens't have the views on default path
    end
  end

  # GET /resource/confirmation?confirmation_token=abcdef
  def show
    with_unconfirmed_confirmable do
      if @confirmable.has_no_password?
        confirm_account
      else
        confirm_account
      end
    end
    #redirect_to(dealer_session_path, :notice => "The Dealer Account was Activated Successfully!")
    # if !@confirmable.errors.empty?
      # render 'confirmations/new' #Change this if you doens't have the views on default path 
    # end
  end
  
  protected

  def with_unconfirmed_confirmable
    @confirmable = Dealer.find_or_initialize_with_error_by(:confirmation_token, params[:confirmation_token])
    if !@confirmable.new_record?
      confirm_account #@confirmable.only_if_unconfirmed {yield}
    end
  end
  
  def confirm_account
    @dealer = Dealer.find_by_confirmation_token(params[:confirmation_token])
    method = "confirm!" unless @dealer.confirmed?
    method = "deactivate_account" if @dealer.confirmed?
    if @dealer.send(method)
      redirect_to(dealer_session_path, :notice => "The Dealer Account was Activated Successfully!")
    else 
      redirect_to dealer_session_path, :alert => "Unable to activate this account! Perhaps it's already activated?"
    end
  end
  
  def do_show
    @confirmation_token = params[:confirmation_token]
    @requires_password = true
    self.resource = @confirmable
    render 'confirmations/show' #Change this if you doens't have the views on default path
  end

  def do_confirm
    @confirmable.confirm!
    set_flash_message :notice, :confirmed
    sign_in_and_redirect(resource_name, @confirmable)
  end
end