class AboutUsController < ApplicationController

  def company_profile
    @company_profile = SystemSetting.find_by_permalink('company_profile')
    @contact = Contact.new
  end

  def contact_us
    @contact = Contact.new(contact_params)
    if verify_recaptcha(model: @contact) && @contact.save
      ContactUsMailer.notification_user(@contact, the_domain).deliver_now
      ContactUsMailer.notification_officer(@contact, the_domain).deliver_now
      ContactUsMailer.notification_admin(@contact, the_domain).deliver_now
      flash[:notice] = 'Message was successfully sent.'
      redirect_to :action => 'company_profile', :anchor => 'contact-us'
    else
      flash[:error] = "Message failed to send"
      @anchor = "contact-us"
      render :action => "company_profile"
    end
  end

  def career
    @career = SystemSetting.find_by_permalink('career')
  end

  def privacy_policy
    @privacy_policy = SystemSetting.find_by_permalink('privacy-policy')
  end

  def term_conditions
    @term_condition = SystemSetting.find_by_permalink('term-condition')
  end

  private

    def contact_params
      params.require(:contact).permit(:name, :email, :phone, :company_name,
                                      :subject, :content)
    end
end
