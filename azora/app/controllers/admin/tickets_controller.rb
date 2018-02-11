class Admin::TicketsController < Admin::ApplicationController
  before_filter :find_ticket, :only => [:edit, :update, :destroy, :delete]

  def index
    @tickets = Ticket.order("#{sort_column} #{sort_direction}").page(params[:page]).per(10)
    @no = paging(20)
  end

  def new
    @ticket = Ticket.new
  end

  def create
    @ticket = Ticket.new(ticket_params)
    if @ticket.save
      flash[:notice] = 'Ticket was successfully create.'
      redirect_to admin_tickets_path
    else
      flash[:error] = "Ticket failed to create"
      render :action => :new
    end
  end

  def edit
  end

  def update
    if @ticket.update_attributes(ticket_params)
      flash[:notice] = 'Ticket was successfully updated.'
      redirect_to admin_tickets_path
    else
      flash[:error] = "Ticket failed to update"
      render :action => :edit
    end
  end

  def destroy
    flash[:notice] = @ticket.destroy ? 'Ticket was successfully deleted.' :
                                       'Ticket was falied to delete.'
    redirect_to admin_tickets_path
  end

  private

    def ticket_params
      params.require(:ticket).permit(:name, :website, :logo)
    end

    def find_ticket
      @ticket = Ticket.find_by_id(params[:id])
      if @ticket.nil?
        flash[:notice] = "Cannot find the Ticket"
        redirect_to admin_tickets_path
      end
    end

    def sort_column
      params[:sort] || "created_at"
    end

    def sort_direction
      params[:direction] || "desc"
    end
end
