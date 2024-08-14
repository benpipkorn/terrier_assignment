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
      WorkOrder.find_or_create_by(row["id"]) do |wo|
        wo.update(order_hash)
      end
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
      Location.find_or_create_by(row["id"]) do |loc|
        loc.update(order_hash)
      end
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
      Technician.find_or_initialize_by(row["id"]) do |tech|
        tech.update(order_hash)
      end
    end
  end

  task import_all: [:import_locations_csv, :import_technicians_csv, :import_work_orders_csv]
end