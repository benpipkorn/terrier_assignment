class MainController < ApplicationController
  def home
    @technicians = Technician.includes(:work_orders).all
    @work_orders = WorkOrder.includes(:technician, :location).order(:time)
  end
end
