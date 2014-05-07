class Lead < Parent
  belongs_to :bus
  
  validates_presence_of :first_name, :message => "can't be blank"
  validates_presence_of :company,    :message => "can't be blank"
  validates_presence_of :address,    :message => "can't be blank"
  validates_presence_of :city,       :message => "can't be blank"
  validates_presence_of :province,   :message => "can't be blank"
  validates_presence_of :country,    :message => "can't be blank"
  validates_presence_of :last_name,  :message => "can't be blank"
  validates_presence_of :phone,      :message => "can't be blank"
  validates_format_of   :email,      :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :message => 'is invalid'
  
  
  #search by feature - meta-programming
  def self.method_missing(meth, *args, &block)
    if meth.to_s.include?("search_by_")
      params,sort_column, sort_direction = args[0], args[1], args[2]
      search_by = meth.to_s[10..-1]
      where("#{search_by} like ?", "%#{params[:query]}%").order(sort_column + " " + sort_direction).paginate :page => params[:page], :per_page => params[:per_page]?params[:per_page]:10
    else
      super 
    end
  end
end