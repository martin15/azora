# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

user = User.find_or_create_by(:email => "martin.me15@yahoo.com", :name => "Martin",
                              :password_digest => BCrypt::Password.create('1q2w3e4r5t').to_s)

africa = Continent.find_or_create_by(:name => "Africa")
puts africa.inspect
south_africa = Country.find_or_create_by(:name => "South Africa", :continent_id => africa.id)

america = Continent.find_or_create_by(:name => "America")
puts america.inspect
amerika = Country.find_or_create_by(:name => "Amerika", :continent_id => america.id)
brazil  = Country.find_or_create_by(:name => "Brazil", :continent_id => america.id)
kanada  = Country.find_or_create_by(:name => "Kanada", :continent_id => america.id)

asia = Continent.find_or_create_by(:name => "Asia")
puts asia.inspect
india          = Country.find_or_create_by(:name => "India", :continent_id => asia.id)
jepang         = Country.find_or_create_by(:name => "Jepang", :continent_id => asia.id)
kamboja        = Country.find_or_create_by(:name => "Kamboja", :continent_id => asia.id)
korea_selatan  = Country.find_or_create_by(:name => "Korea Selatan", :continent_id => asia.id)
taiwan         = Country.find_or_create_by(:name => "Taiwan", :continent_id => asia.id)
vietnam        = Country.find_or_create_by(:name => "Vietnam", :continent_id => asia.id)

australia_nz = Continent.find_or_create_by(:name => "Australia & New Zealand")
puts australia_nz.inspect
australia   = Country.find_or_create_by(:name => "Australia", :continent_id => australia_nz.id)
new_zealand = Country.find_or_create_by(:name => "New Zealand", :continent_id => australia_nz.id)
#11

china = Continent.find_or_create_by(:name => "China")
beijing     = Country.find_or_create_by(:name => "China", :continent_id => china.id)
#beijing     = Country.find_or_create_by(:name => "Beijing", :continent_id => china.id)
#guangzhou   = Country.find_or_create_by(:name => "Guangzhou", :continent_id => china.id)
hongkong    = Country.find_or_create_by(:name => "Hongkong", :continent_id => china.id)
macau       = Country.find_or_create_by(:name => "Macau", :continent_id => china.id)
#zhangjiajie = Country.find_or_create_by(:name => "Zhangjiajie", :continent_id => china.id)
#shanghai    = Country.find_or_create_by(:name => "Shanghai", :continent_id => china.id)
#xian        = Country.find_or_create_by(:name => "Xian", :continent_id => china.id)
puts china.inspect

europe = Continent.find_or_create_by(:name => "Europe")
puts europe.inspect
united_kingdom  = Country.find_or_create_by(:name => "United Kingdom", :continent_id => europe.id)
austria         = Country.find_or_create_by(:name => "Austria", :continent_id => europe.id)
belanda         = Country.find_or_create_by(:name => "Belanda", :continent_id => europe.id)
belgia          = Country.find_or_create_by(:name => "Belgia", :continent_id => europe.id)
ceko            = Country.find_or_create_by(:name => "Ceko", :continent_id => europe.id)
denmark         = Country.find_or_create_by(:name => "Denmark", :continent_id => europe.id)
finlandia       = Country.find_or_create_by(:name => "Finlandia", :continent_id => europe.id)
hungaria        = Country.find_or_create_by(:name => "Hungaria", :continent_id => europe.id)
irlandia        = Country.find_or_create_by(:name => "Irlandia", :continent_id => europe.id)
italia          = Country.find_or_create_by(:name => "Italia", :continent_id => europe.id)
jerman          = Country.find_or_create_by(:name => "Jerman", :continent_id => europe.id)
kroasia         = Country.find_or_create_by(:name => "Kroasia", :continent_id => europe.id)
norwegia        = Country.find_or_create_by(:name => "Norwegia", :continent_id => europe.id)
perancis        = Country.find_or_create_by(:name => "Perancis", :continent_id => europe.id)
polandia        = Country.find_or_create_by(:name => "Polandia", :continent_id => europe.id)
portugal        = Country.find_or_create_by(:name => "Portugal", :continent_id => europe.id)
rusia           = Country.find_or_create_by(:name => "Rusia", :continent_id => europe.id)
spanyol         = Country.find_or_create_by(:name => "Spanyol", :continent_id => europe.id)
swedia          = Country.find_or_create_by(:name => "Swedia", :continent_id => europe.id)
swiss           = Country.find_or_create_by(:name => "Swiss", :continent_id => europe.id)
yunani          = Country.find_or_create_by(:name => "Yunani", :continent_id => europe.id)
#34

about_us = SystemSetting.find_or_create_by(:name => "About Us")
puts about_us.inspect

career = SystemSetting.find_or_create_by(:name => "Career")
puts career.inspect

faq = SystemSetting.find_or_create_by(:name => "FAQ")
puts faq.inspect

passport = SystemSetting.find_or_create_by(:name => "Passport")
puts passport.inspect

privacy_policy = SystemSetting.find_or_create_by(:name => "Privacy Policy")
puts privacy_policy.inspect

term_and_condition = SystemSetting.find_or_create_by(:name => "Term & Condition")
puts term_and_condition.inspect

incentive_tour = Service.find_or_create_by(:name => "Incentive Tour")
mice = Service.find_or_create_by(:name => "M.I.C.E")
other_service = Service.find_or_create_by(:name => "Other Service")
other_service.destroy unless other_service.nil?

visa = Service.find_by_name("Visa")
if visa.nil?
  visa = Service.find_or_create_by(:name => "Travel Visa")
else
  visa.update_attributes(:name => "Travel Visa")
end

tickets = Service.find_or_create_by(:name => "Tickets")
hotels = Service.find_or_create_by(:name => "Hotels")
packages = Service.find_or_create_by(:name => "Packages")


