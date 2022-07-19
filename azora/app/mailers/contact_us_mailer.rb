class ContactUsMailer < ApplicationMailer
  def notification_user(contact, domain)
    @contact = contact
    @domain = domain
    mail(:to => contact.email, :subject => contact.subject)
  end

  def notification_officer(contact, domain)
    @contact = contact
    @domain = domain
    mail(:to => "Info.azoratravel@gmail.com", :subject => "[Officer] #{contact.subject}")
  end

  def notification_admin(contact, domain)
    @contact = contact
    @domain = domain
    mail(:to => "martin.me15@yahoo.com", :subject => "[Admin] #{contact.subject}")
  end
end
