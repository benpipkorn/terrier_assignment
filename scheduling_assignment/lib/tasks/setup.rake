desc "Setting up database with CSV data"
namespace :setup do
  require "csv"
  task :import_work_orders_csv => :environment do
    file = File.expand_path("../../../../RailsSchedulingAssignment/work_orders.csv",__FILE__)  # open specified CSV file
    file = File.open(file)
    csv = CSV.parse(file, headers: true, col_sep: ',')
    csv.each do |row|  # create a new work_order to be inserted or updated
      order_hash = {}
      order_hash[:id] = row["id"]
      order_hash[:technician_id] = row["technician_id"]
      order_hash[:location_id] = row["location_id"]
      order_hash[:time] = row["time"]
      order_hash[:duration] = row["duration"]
      order_hash[:price] = row["price"]
      wo = WorkOrder.find_or_create_by(id: order_hash[:id])
      wo.update(order_hash)
    end
  end
  task :import_locations_csv => :environment do
    file = File.expand_path("../../../../RailsSchedulingAssignment/locations.csv",__FILE__)
    file = File.open(file)
    csv = CSV.parse(file, headers: true, col_sep: ',')
    csv.each do |row|
      order_hash = {}
      order_hash[:id] = row["id"]
      order_hash[:name] = row["name"]
      order_hash[:city] = row["city"]
      loc = Location.find_or_create_by(id: order_hash[:id])
      loc.update(order_hash)
    end
  end
  task :import_technicians_csv => :environment do
    file = File.expand_path("../../../../RailsSchedulingAssignment/technicians.csv",__FILE__)
    file = File.open(file)
    csv = CSV.parse(file, headers: true, col_sep: ',')
    csv.each do |row|
      order_hash = {}
      order_hash[:id] = row["id"]
      order_hash[:name] = row["name"]
      tech = Technician.find_or_create_by(id: order_hash[:id])
      tech.update(order_hash)
    end
  end

  # Compile all rake tasks into one
  task import_all: [:import_locations_csv, :import_technicians_csv, :import_work_orders_csv]  
end