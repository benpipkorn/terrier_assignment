desc "Setting up database with CSV data"
namespace :setup do
  require "csv"
  task :import_work_orders_csv => :environment do
    file = File.expand_path("../../../../RailsSchedulingAssignment/work_orders.csv",__FILE__)
    file = File.open(file)
    csv = CSV.parse(file, headers: true, col_sep: ',')
    csv.each do |row|
      order_hash = {}
      order_hash[:id] = row["id"]
      order_hash[:technician_id] = row["technician_id"]
      order_hash[:location_id] = row["location_id"]
      order_hash[:time] = row["time"]
      order_hash[:duration] = row["duration"]
      order_hash[:price] = row["price"]
      WorkOrder.create(order_hash)
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
      Location.create(order_hash)
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
      Technician.create(order_hash)
    end
  end

  task import_all: [:import_work_orders_csv, :import_locations_csv, :import_technicians_csv]
end