require 'rails_helper'

feature 'Visitor' do
  scenario 'creates a new DS18B20 sensor' do
    visit '/'
    click_link I18n.t('views.home.link.ds18b20_create')
    fill_in 'ds18b20_name', with: 'sensor1'
    fill_in 'ds18b20_path', with: '/tmp/ensors_path'
    fill_in 'ds18b20_file', with: '1st_sensor.txt'
    click_button I18n.t('views.generic.buttons.save')

    expect(page).to have_content('sensor1')
  end
end
