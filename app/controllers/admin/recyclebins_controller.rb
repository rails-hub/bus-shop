class Admin::RecyclebinsController < ApplicationController
  before_filter :authenticate_access, :bin_menu
  helper_method :sort_direction, :sort_column
  layout "admin"

	def index
		inventory 			= deleted_at Bus,		'inventory' 
		@inventory 			= inventory.inventory
		@sold_inventory = inventory.sold_inventory
		
		@leads   				= deleted_at Lead, 	'leads'
		@dealers 				= deleted_at Dealer,'dealers'
		@users   				= deleted_at User,	'users' 

		bin_menu( @inventory, @sold_inventory, @leads,@dealers,@users )
	end

	def restore #SELECTED RECORDS RESTORED
		records = which_bin.where(id: eval(params[:ids]))
		if records && records.each { |record| record.update_attribute(:deleted_at, '') }
			redirect_to :back, notice: 'Records Restored Successfully.'
		end
	end

	def restore_all_current_bin # ONE PARTICULAR BIN
		which_bin.update_all( 'deleted_at = null', 'deleted_at is not null')
		redirect_to :back, notice: "All Records Restored Successfully."
	end

	def restore_all # ALL RECORDS FROM ALL BINS
		all_bins.each { |t| t.update_all( 'deleted_at = null', 'deleted_at is not null') }
		redirect_to :back, notice: "All Records Restored Successfully."
	end

	def destroy # SINGLE RECORD
		which_bin.delete(params[:id])
		redirect_to :back, notice: "Record Deleted Successfully!"
	end

	def empty_bin # ONE PARTICULAR BIN
		which_bin.where('deleted_at is not null').delete_all
		redirect_to :back, notice: "All Records Deleted Successfully!"
	end

	def empty_all #destroy all -- ALL BINS
		all_bins.each { |t| t.where('deleted_at is not null').delete_all }
		redirect_to :back, notice: "All Records Deleted Successfully!"
	end

	def set_delete_timer
		s = Settings.find_or_create_by_setting_type('Delete')
		current_value = s.value
		unless current_value.blank?
		  current_value[params[:bin]] = params[:timer]
		else
		  current_value = {:inventory => "1", :sold_inventory => "1", :leads => "1", :dealers => "1", :users =>"1" }
		end
		s.value = current_value
		if s.save
		  redirect_to :back, notice: "Items will be deleted after " + view_context.pluralize(params[:timer],'day')
	  else
      redirect_to :back, notice: "Error! Updating record!"
    end
	end

private ################
########################
	
	def which_bin
		case params[:bin]
			when 'inventory'		 then Bus.inventory
			when 'sold_inventory'then Bus.sold_inventory
			when 'leads'				 then Lead
			when 'dealers' 			 then Dealer
			when 'users'				 then User
		end		
	end

	def all_bins
		[Bus,Lead,Dealer,User]
	end
	
	def deleted_at(klass,str)
		klass.where('deleted_at is not null').order(should_sort?(str))
				 .paginate :page => params[:page], 
				 					 :per_page => params[:per_page] || 10
	end

	def should_sort?(str) # sort only for current page
		sort_column + " " + sort_direction if str == params[:bin]
	end

	def bin_menu(*args)
		@binMenu ||= []
		
		args.each_with_index do |arg,inc| 
			@binMenu <<  bin_menu_name( arg,inc ) 
		end
	end

	def bin_menu_name(obj,inc) #create bin menu
		link_and_text = [ 'inventory','sold_inventory','leads','dealers','users' ]
		( view_context.pluralize( obj.count, 'Item' ) +' - '+ \
		  view_context.link_to(link_and_text[inc].titleize,
		   "?bin=#{link_and_text[inc]}")).html_safe
	end

end
