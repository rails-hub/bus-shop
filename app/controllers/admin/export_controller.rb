require 'zip/zip'
  
class Admin::ExportController < ApplicationController


  include ActionView::Helpers::NumberHelper
   
  before_filter :authenticate_access
  
  layout "admin"

  def to_xls
    book = Spreadsheet::Workbook.new
    sheet = book.create_worksheet
    
    # Setup formats for headers and sold items
    header_format = Spreadsheet::Format.new :weight => :bold, :size => 15
    sold_format = Spreadsheet::Format.new :color => :red
    
    sheet.row(0).default_format = header_format
    sheet.row(0).height = 18
    column_name = Bus.column_names.collect {|n| n.humanize }
    column_name << ""
    column_name << Seller.column_names.collect {|n| n.humanize }
    column_name = column_name.flatten
    
    sheet.row(0).replace column_name
    
    if eval(params[:ids]).count != 0 
      buses = Bus.where(:stock_id => eval(params[:ids]))
    else
      buses = Bus.all
    end

    # TODO: The below code block needs to go into a helper method and placed in one of the Controller
    # helper files... It's too long.. but proper formatting and control on Excel Sheet layout is required.
    buses.each_with_index do |bus, index|
      index += 1
      sheet_bus = Array.new
      sheet_bus << bus.id
      sheet_bus << bus.stock_id
      sheet_bus << bus.bus_type.name
      sheet_bus << bus.chasis_model
      sheet_bus << bus.body_model
      sheet_bus << bus.engine
      sheet_bus << "#{number_with_delimiter(bus.mileage, :delimiter => ',')} Kms"
      sheet_bus << bus.vin
      sheet_bus << bus.fuel_type
      sheet_bus << bus.passengers
      sheet_bus << "#{bus.vehicle_length} ft"
      sheet_bus << bus.exterior_color
      sheet_bus << bus.interior_color
      sheet_bus << bus.luggage
      sheet_bus << bus.wheelchair_lifts
      sheet_bus << bus.warranty
      sheet_bus << bus.created_at
      sheet_bus << bus.updated_at
      sheet_bus << bus.year
      sheet_bus << bus.chasis_make.name
      sheet_bus << bus.transmission
      sheet_bus << bus.location
      sheet_bus << bus.body_make.name
      sheet_bus << bus.live
      sheet_bus << bus.featured
      sheet_bus << bus.status
      sheet_bus << (bus.sold ? "Yes" : "No")
      sheet_bus << bus.sold_price
      sheet_bus << bus.status_image
      sheet_bus << bus.sold_date
      sheet_bus << bus.vehicle_description
      sheet_bus << number_to_currency(bus.wholesale_price)
      sheet_bus << number_to_currency(bus.cost)
      sheet_bus << number_to_currency(bus.sale_price)
      sheet_bus << number_to_currency(bus.price)
      sheet_bus << bus.posted_price.humanize
      sheet_bus << bus.entertainment
      sheet_bus << bus.lavatory
      sheet_bus << bus.raised_roof
      sheet_bus << bus.wheelchair_capacity
      sheet_bus << bus.brakes
      sheet_bus << bus.created_by
      sheet_bus << bus.last_status_change_by
      sheet_bus << bus.status_updated_at
      sheet_bus << bus.last_modified_by
      sheet_bus << ""
      seller = bus.seller
      if !seller.nil?
        sheet_bus << ""
        sheet_bus << seller.id
        sheet_bus << seller.name
        sheet_bus << seller.phone
        sheet_bus << seller.email
        sheet_bus << seller.comments
        sheet_bus << seller.postal_code
        sheet_bus << seller.created_at
        sheet_bus << seller.updated_at
        sheet_bus << seller.address
        sheet_bus << seller.province
        sheet_bus << seller.city
        sheet_bus << seller.company_name
        sheet_bus << seller.country
      end
      sheet.row(index).default_format = sold_format if bus.sold?
      #sheet.row(index).concat bus.attributes.map { |b| b[1] }
      sheet.row(index).concat sheet_bus
    end
    book.write 'excel-file.xls'
    send_file 'excel-file.xls'
  end
  
  def to_xls_leads
    book = Spreadsheet::Workbook.new
    sheet = book.create_worksheet
    
    # Setup formats for headers and sold items
    header_format = Spreadsheet::Format.new :weight => :bold, :size => 15
    sold_format = Spreadsheet::Format.new :color => :red
    
    sheet.row(0).default_format = header_format
    sheet.row(0).height = 18
    column_name = Lead.column_names.collect {|n| n.humanize }
    # column_name << ""
    # column_name << Seller.column_names.collect {|n| n.humanize }
    # column_name = column_name.flatten
    
    sheet.row(0).replace column_name
#     
    if eval(params[:ids]).count != 0 
      leads = Lead.where(:id => eval(params[:ids]))
    else
      leads = Lead.all
    end
# 
    # # TODO: The below code block needs to go into a helper method and placed in one of the Controller
    # # helper files... It's too long.. but proper formatting and control on Excel Sheet layout is required.
    leads.each_with_index do |lead, index|
      index += 1
      sheet_lead = Array.new
      sheet_lead << lead.id
      sheet_lead << lead.first_name
      sheet_lead << lead.last_name
      sheet_lead << lead.email
      sheet_lead << lead.phone
      sheet_lead << lead.comments
      sheet_lead << lead.bus.try(:stock_id)
      sheet_lead << lead.created_at
      sheet_lead << lead.updated_at
      sheet_lead << lead.company
      sheet_lead << lead.country
      sheet_lead << lead.province
      sheet_lead << lead.city
      sheet_lead << lead.mobile
      sheet_lead << lead.address
      sheet_lead << lead.address2
      sheet_lead << lead.unit
      sheet_lead << lead.postal
      sheet.row(index).concat sheet_lead
    end
    book.write 'excel-file.xls'
    send_file 'excel-file.xls'
  end
  
  def to_pdf_multiple
    if eval(params[:ids]).count != 0 
      @buses = Bus.where(:stock_id => eval(params[:ids]))
    else
      @buses = Bus.all
    end
    respond_to do |format|
      format.pdf do
        pdf = ListingPDF.new(view_context)
        pdf.pdf_for_buses(@buses)
        send_data pdf.render, filename: "BUSES_EXPORT.pdf", type: "application/pdf", disposition: "inline"
      end
    end
  end
  
  def to_pdf_multiple_leads
    if eval(params[:ids]).count != 0 
      @leads = Lead.where(:id => eval(params[:ids]))
    else
      @leads = Lead.all
    end
    respond_to do |format|
      format.pdf do
        pdf = LeadPDF.new(view_context)
        pdf.pdf_for_leads(@leads)
        send_data pdf.render, filename: "LEADS_EXPORT.pdf", type: "application/pdf", disposition: "inline"
      end
    end
  end
  
  def download_zip(image_list)
    unless image_list.blank?
      file_name = "bus.zip"
      t = Tempfile.new("my-temp-filename-#{Time.now}")
      Zip::ZipOutputStream.open(t.path) do |z|
        image_list.each do |img|
          img.each do |i|
            stock_id = Bus.find(i.bus_id).stock_id.to_s
            title = stock_id+"/"+i.id.to_s+i.image.to_s.split('/').last
            title += ".jpg" unless title.to_s[-4..-1] == ".jpg"
            z.put_next_entry(title)
            z.print IO.read("public/"+i.image.to_s[1..-1])
          end
        end
      end
      send_file t.path, :type => 'application/zip',
                             :disposition => 'attachment',
                             :filename => file_name
      t.close
    end
  end
  
  def to_zip
    if eval(params[:ids]).count != 0 
      @buses = Bus.where(:stock_id => eval(params[:ids]))
      busImages = [] 
      @buses.each {|bus| 
        busImages << bus.images
      }
      download_zip(busImages)
    end
  end
  
  def to_pdf
    ###Deprecated 
    # @buses = Bus.all
    # respond_to do |format|
      # format.pdf do
        # pdf = ListingPDF.new(view_context)
        # pdf.pdf_for_buses(@buses)
        # send_data pdf.render, filename: "BUSES_EXPORT.pdf", type: "application/pdf", disposition: "inline"
      # end
    # end
  end
 
end
