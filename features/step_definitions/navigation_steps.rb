
require File.expand_path(File.join(File.dirname(__FILE__), "..", "support", "paths"))


When(/^Im on the home page$/) do
    page.visit("/")

end

When(/^Im on the report page$/) do
  page.visit("/report")
  page.find_button('Gerar Relatório')
  click_button "Gerar Relatório"
  sleep 2.to_i
  page.should have_css('div#ideb-graph')
end



When(/^Im on the compare page$/) do
  page.visit("/compare")
end

When(/^Im on the ranking page$/) do
  page.visit("/ranking")
end