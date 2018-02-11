class TicketsController < ApplicationController
  def index
    @tickets = Ticket.order("name")
    @services = Service.all
  end
end
