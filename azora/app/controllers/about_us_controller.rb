class AboutUsController < ApplicationController

  def company_profile
    @company_profile = SystemSetting.find_by_permalink('company_profile')
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

end
