require 'rails_helper'

feature 'Visitor' do
  scenario 'creates a new DS18B20 sensor' do
    sensor = build(:ds18b20)
    create_ds18b20(sensor)

    expect(page).to have_link('sensor1')
  end

  scenario 'views the sensor reading' do
    sensor = build(:ds18b20)
    create_ds18b20(sensor)
    click_link('sensor1')

    expect(page).to have_content('156')
  end

  scenario 'edits an existing ds10b20' do
    sensor = build(:ds18b20)
    create_ds18b20(sensor)
    click_link('sensor1')
    click_link('edit')
    fill_in 'ds18b20_name', with: 'sensor2'
    fill_in 'ds18b20_path', with: sensor.path
    fill_in 'ds18b20_file', with: 'sensor2.txt'
    click_button I18n.t('views.generic.buttons.save')
    click_link('sensor2')

    expect(page).to have_content('50')
  end

  private

  def create_ds18b20(sensor)
    visit '/'
    click_link I18n.t('views.home.link.ds18b20_create')
    fill_in 'ds18b20_name', with: sensor.name
    fill_in 'ds18b20_path', with: sensor.path
    fill_in 'ds18b20_file', with: sensor.file
    click_button I18n.t('views.generic.buttons.save')
  end
end
