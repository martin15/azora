class Ticket < ActiveRecord::Base
  mount_uploader :logo, TicketLogoUploader
end
