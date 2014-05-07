require "prawn/layout" 
require "prawn/core" 

class LeadPDF < Prawn::Document
  
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
  
  def lead_details
    text "#{@lead.first_name} #{@lead.last_name}", :size => 20, :style => :bold, :align => :center
    text "Email: #{@lead.email}", :size => 16
    text "Stock ID: #{@lead.bus.try(:stock_id)}", :size => 16
    text "Email: #{@lead.email}", :size => 16
    text "Phone: #{@lead.phone}", :size => 16
    text "Mobile: #{@lead.mobile}", :size => 16
    text "City: #{@lead.city}", :size => 16
    text "Company Name: #{@lead.company}", :size => 16
    text "Address: #{@lead.address}", :size => 16
    text "Address 2: #{@lead.address2}", :size => 16
    text "Suite/Unit: #{@lead.unit}", :size => 16
    text "City: #{@lead.city}", :size => 16
    text "Prov/State: #{@lead.province}", :size => 16
    text "Country: #{@lead.country}", :size => 16
    text "Postal/Zip: #{@lead.postal}", :size => 16
  end
  
  def rails_root
    Rails.root.join('public').to_s
  end
  
  def assets_path
    Rails.root.join('app', 'assets')
  end
  
  def pdf_for_leads(leads)
    leads.each do |lead|
      pdf_for_lead(lead)
      start_new_page
    end
  end
  
  def pdf_for_lead(lead, *args)
    @lead = lead
    @dealer = args.first
    header
    lead_details
  end 
end