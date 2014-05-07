require "prawn/layout" 
require "prawn/core" 

class ListingPDF < Prawn::Document
  
  def initialize(view)
    super()
    @view = view
  end
  
  def header 
    string = "<page>"
    # Green page numbers 1 to 7
    options = { :at => [bounds.right - 150, 0],
                :width => 150,
                :align => :right,
                :start_count_at => 0,
               }
    number_pages string, options
    if @dealer
      image rails_root+"#{@dealer.logo}", :position => :right, :height => 100
    else
      image "#{assets_path.join('images', 'mainLogo.png')}", :position => :right
    end
  end
  
  def listing_details
    text "Stock ID: #{@bus.stock_id}", :size => 16, :style => :bold
    text "#{@bus.year} #{@bus.chasis_make.name}", :size => 16, :style => :bold
    text "Selling for: #{@view.number_to_currency(@bus.price_on_site, :precision => 0)}", :style => :bold
    seller = @bus.seller
    move_down 30
    data = ([
            ["Year", @bus.year], 
            ["Bus Type", @bus.bus_type.name],
            ["Chasis Make", @bus.chasis_make.name],
            ["Chasis Model", @bus.chasis_model],
            ["Body Make", @bus.body_make.name],
            ["Body Model", @bus.body_model],
            ["Engine", @bus.engine],
            ["Mileage", @view.number_to_human(@bus.mileage, :units => :distance) ],
            ["Transmission", @bus.transmission],
            ["Location", @bus.location],
            ["Fuel Type", @bus.fuel_type],
            ["Passengers", @bus.passengers],
            ["Vehicle Length (in ft)", @bus.vehicle_length ],
            ["Exterior Color", @bus.exterior_color],
            ["Interior Color", @bus.interior_color],
            ["Luggage", @bus.luggage],
            ["Wheelchair Lifts", @bus.wheelchair_lifts],
            ["Warranty", @bus.warranty],
            ["Description", @bus.vehicle_description]
           ])
    table(data, :column_widths => [200, 330])
    unless seller.nil?
      move_down 15
      text "Seller information", :size => 16, :style => :bold
      seller_data = ([["Seller Name", seller.name],
            ["Phone", seller.phone],
            ["Email", seller.email],
            ["Phone", seller.phone],
            ["Comments", seller.comments],
            ["Postal Code", seller.postal_code],
            ["Address", seller.address],
            ["Province", seller.province],
            ["City", seller.city],
            ["Company Name", seller.company_name],
            ["Country", seller.country]
            ])
      table(seller_data, :column_widths => [200, 330])
      move_down 5
    end
  
    
    
  end
  
  def listing_images
    @bus.images.each do |b|
      image rails_root+b.image_url, :scale => 0.5, :width => 530, :position => :center
    end
  end
  
  def rails_root
    Rails.root.join('public').to_s
  end
  
  def assets_path
    Rails.root.join('app', 'assets')
  end
  
  def pdf_for_buses(buses)
    buses.each do |bus|
      pdf_for_bus(bus)
      start_new_page
    end
  end
  
  def pdf_for_bus(bus, *args)
    @bus = bus
    @dealer = args.first
    header
    listing_details
    listing_images
  end
    
end