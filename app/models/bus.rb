class Bus < Parent
  # Associations
  belongs_to :bus_type
  belongs_to :page_hit
  belongs_to :chasis_make
  has_many :stats
  belongs_to :body_make
  has_one :sales_info
  has_many :images, :dependent => :destroy
  belongs_to :seller
  has_many :leads, :dependent => :destroy
  belongs_to :vehicle_history
  belongs_to :state

  accepts_nested_attributes_for :images
  accepts_nested_attributes_for :seller

  attr_accessor :vehicle_images
  attr_accessible :seller_attributes
  attr_accessible :images_attributes

  attr_accessible :seller_id,:year, :bus_type_id, :chasis_make_id, :chasis_model, :body_make_id, :body_model, :engine, :mileage, :transmission, :location, :state, :lavatory, :entertainment, :vin, :stock_id, :fuel_type, :passengers, :vehicle_length, :exterior_color, :interior_color, :luggage,:rear_luggage ,:wheelchair_lifts, :wheelchair_capacity, :warranty, :raised_roof, :brakes, :cost, :price, :posted_price, :wholesale_price, :sale_price, :sold, :sold_price, :status, :live, :featured, :seller, :vehicle_description, :state_id
  # Vehicle Status Constants
  PENDING = {:string => "pending", :image => "grayCircle.png"}
  ATTENTION = {:string => "attention", :image => "blueCircle.png"}
  STANDARD = {:string => "standard", :image => "blackCircle.png"}
  NEW = {:string => "new", :image => "greenCircle.png"}
  SALE = {:string => "sale", :image => "redCircle.png"}

  # Array of all the statuses
  STATUSES = [PENDING, ATTENTION, STANDARD, NEW, SALE]

  # Scopes
  scope :inventory, where('sold <> 1 or sold is null')
  scope :sold_inventory, where(sold: 1)
  scope :includes_in, includes([:bus_type, :chasis_make, :body_make, :stats, :page_hit])
  scope :is_live, where(live: "yes", sold: 0).order(:updated_at)

  # Validations
  validates_associated :seller
  validates_presence_of :bus_type_id, :on => :create, :message => "should be selected"
  validates_presence_of :chasis_model, :on => :create, :message => "can't be blank"
  validates_presence_of :body_model, :on => :create, :message => "can't be blank"
  validates_presence_of :sold_price, :message => "can't be left blank", :if => :sold_checked?
  validates_numericality_of :mileage, :on => :create, :message => 'should be a number only'
  validates_presence_of :status, :on => :create, :message => "can't be blank"
  validates_presence_of :location, :on => :create, :message => "can't be blank"
  validates_presence_of :state_id, :on => :create,:message => "can't be blank"

  validates :vin,
            :uniqueness => {:case_sensitive => false},
            :presence => {:on => :create, :message => "number must be present"}
  validates :stock_id,
            :uniqueness => {:case_sensitive => false},
            :presence => true
  validates :passengers,
            :numericality => {:on => :create, :message => "must be number"},
            :presence => {:on => :create, :message => "must be present"}
  validates :live,
            :presence => true
  validates :featured,
            :presence => true
  validates :exterior_color,
            :presence => true
  validates :interior_color,
            :presence => true
  validates :wheelchair_capacity,
            :numericality => {:on => :create, :message => "must be a number"}
  validate :images_attached

  # Call Backs:
  before_save :clean_variables, :attach_status_image, :update_sold_date

  def sold_checked?
    if self.sold
      self.live
      return true
    else
      return false
    end
  end

  # Instance Methods
  def price_on_site
    self.send(self.posted_price)
  end

  def clean_variables
    self.vin.upcase!
    self.stock_id.upcase! if self.stock_id.respond_to?(:upcase!)
    self.exterior_color.capitalize! if self.exterior_color.respond_to?(:capitalize!)
    self.interior_color.capitalize! if self.interior_color.respond_to?(:capitalize!)
  end

  def hits
    self.page_hit.try(:count) ? page_hit.try(:count) : "0"
    # hits = PageHit.find_by_url("/listings/"+self.stock_id)
    #    hits.try(:count)?hits.try(:count):"0"
  end

  protected

  def images_attached
    errors.add(:vehicle_images, "must be uploaded with each bus.") if images.size == 0
  end

  def update_sold_date
    unless self.sold.blank?
      self.live = "no"
      self.sold_date = Time.now
    end
  end


  def attach_status_image
    self.status_image = case status
                          when "pending" then
                            Bus::PENDING[:image]
                          when "attention" then
                            Bus::ATTENTION[:image]
                          when "standard" then
                            Bus::STANDARD[:image]
                          when "new" then
                            Bus::NEW[:image]
                          when "sale" then
                            Bus::SALE[:image]
                        end
  end

end
