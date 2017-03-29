require 'rails_helper'

feature 'Visitor' do
  scenario 'views the home page ' do
    visit '/'

    expect(page).to have_content('Sensor Manager')
  end
end
