require 'rails_helper'

feature 'Visitor' do
  scenario 'creates a new DS18B20 sensor' do
    click_link I18n.t('views.ds18b20.link.ds18b20_create')
    fill_in 'name', with: 'sensor1'
    fill_in 'path', with: '/tmp/1st_sensor.txt'
    click_button I18n.t('views.generic.buttons.save')

    expect(page).to have_content('sensor1')
  end
end
