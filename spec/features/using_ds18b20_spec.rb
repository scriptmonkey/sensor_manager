require 'rails_helper'

feature 'Visitor' do
  scenario 'creates a new DS18B20 sensor' do
    sensor = build(:ds18b20)
    create_ds18b20_via_form(sensor)
    visit '/'

    expect(page).to have_link('sensor1')
  end

  scenario 'views the sensor reading' do
    sensor = create(:ds18b20)
    visit '/'
    click_link('sensor1')

    expect(page).to have_content('156')
  end

  scenario 'edits an existing ds18b20' do
    sensor = create(:ds18b20)
    visit '/'
    click_link('sensor1')
    click_link('edit')
    fill_in 'ds18b20_name', with: 'sensor2'
    fill_in 'ds18b20_path', with: sensor.path
    fill_in 'ds18b20_file', with: 'sensor2.txt'
    click_button I18n.t('views.generic.buttons.save')
    click_link('sensor2')

    expect(page).to have_content('50')
  end

  scenario 'edits and exsting ds18b20 and does not include a tailing /' do
    sensor = create(:ds18b20)
    visit '/'
    click_link(sensor.name)
    click_link('edit')
    fill_in 'ds18b20_path', with: '/bad/path'
    click_button I18n.t('views.generic.buttons.save')

    expect(page).to have_current_path(edit_ds18b20_path(sensor))
    expect(page).to have_content('Path must have trailing /')
  end

  scenario 'edits and exsting ds18b20 and does not include path' do
    sensor = create(:ds18b20)
    visit '/'
    click_link(sensor.name)
    click_link('edit')
    fill_in 'ds18b20_path', with: ''
    click_button I18n.t('views.generic.buttons.save')

    expect(page).to have_current_path(edit_ds18b20_path(sensor))
    expect(page).to have_content('Something is missing')
  end

  scenario 'provides a bad file' do
    sensor = create(:ds18b20, file: 'bad_file')
    visit '/'
    click_link('sensor1')

    expect(page).to have_content('-256')
  end

  scenario 'provides no file' do
    sensor = build(:ds18b20, file: nil)
    create_ds18b20_via_form(sensor)

    expect(page).to have_content('Something is missing')
  end

  scenario 'provides no trailing / on path' do
    sensor = build(:ds18b20, path: '/bad/path')
    create_ds18b20_via_form(sensor)

    expect(page).to have_content('Path must have trailing /')
  end
  private

  def create_ds18b20_via_form(sensor)
    visit '/'
    click_link I18n.t('views.home.link.ds18b20_create')
    fill_in 'ds18b20_name', with: sensor.name
    fill_in 'ds18b20_path', with: sensor.path
    fill_in 'ds18b20_file', with: sensor.file
    click_button I18n.t('views.generic.buttons.save')
  end
end
