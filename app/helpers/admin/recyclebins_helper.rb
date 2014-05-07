module Admin::RecyclebinsHelper

# ------------------------------------------------------------
	def image_as_status(status)
		case status 
			when 'standard' then image_circle('blackCircle',status.capitalize)
			when 'new' 			then image_circle('greenCircle',status.capitalize)
			when 'sale' 		then image_circle('redCircle'	 ,status.capitalize)
			when 'attention'then image_circle('blueCircle' ,status.capitalize)
			when 'pending' 	then image_circle('grayCircle' ,status.capitalize)
		end
	end

	def image_circle(image,text)
		content_tag :div, :class => 'recyclinBinInventoryStatus' do
			image_tag( "/assets/admin/icons/#{image}.png") + 
			content_tag( :span,text )
		end
	end
# ------------------------------------------------------------
	
	def permanent_delete(obj,query)
		link_to image_tag("/assets/admin/icons/action4.png") + \
					  "<span>Delete</span>".html_safe, 
					  admin_recyclebin_path(obj.id)+"?bin=#{query}", 
					  :method => :delete, 
					  :alt => "Delete This User", 
					  :confirm => "Are you sure you want to delete this permanently?", 
					  :class=> "tooltip"
	end
	
	def print_date(date)
    date.strftime('%b %d, %Y %H:%M')
  end

  def confirmed_or_not(user)
		if user.confirmed?
			 link_to image_tag("/assets/admin/icons/greenCircle.png")+ "<span>Confirmed</span>".html_safe, admin_confirm_user_account_path(user.id), :alt => "Activate Account", :class=> "tooltip"
		else
			 link_to image_tag("/assets/admin/icons/redCircle.png")+ "<span>Not Confirmed</span>".html_safe, admin_confirm_user_account_path(user.id), :alt => "Deactivate Account", :class=> "tooltip"		
		end
  end

  
end
