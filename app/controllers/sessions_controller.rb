# overiding the default sessions controller of Devise
class SessionsController < Devise::SessionsController
 
 def new
    resource = build_resource
    clean_up_passwords(resource)
    respond_with_navigational(resource, stub_options(resource)){ render_with_scope :new }
 end
 
  # DELETE /resource/sign_out
  def destroy
    signed_in = signed_in?(resource_name)
    redirect_path = after_sign_out_path_for(resource_name)
    Devise.sign_out_all_scopes ? sign_out : sign_out(resource_name)
    set_flash_message :notice, :signed_out if signed_in
  
   # We actually need to hardcode this as Rails default responder doesn't
   # support returning empty response on GET request
    respond_to do |format|
      format.any(*navigational_formats) { redirect_to redirect_path }
      format.all do
        method = "to_#{request_format}"
        text = {}.respond_to?(method) ? {}.send(method) : ""
          render :text => text, :status => :ok
        end
      end
  end
end