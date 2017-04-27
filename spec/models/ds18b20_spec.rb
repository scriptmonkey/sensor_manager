require 'rails_helper'

RSpec.describe Ds18b20, type: :model do
  it {should respond_to :name}
  it {should respond_to :path}
  it {should respond_to :file}
  it {should respond_to :creading }
  it {should respond_to :freading }

  context 'has a file to read' do
    it 'expects a temp reading from sensor1.txt' do
      expect(build(:ds18b20).creading).to eq(69.0)
      expect(build(:ds18b20).freading).to eq(156.2)
    end

    it 'expects a temp reading from sensor2.txt' do
      expect(build(:ds18b20, file: 'sensor2.txt').creading).to eq(10.375)
      expect(build(:ds18b20).freading).to eq(156.2)
    end

    it 'read_file should return a celsius temp' do
      expect(build(:ds18b20).creading).to eq(69.0)
    end

    it 'expects an error reading when a bad crc is given' do
      sensor = build(:ds18b20)
      sensor.file = 'sensor_bad_crc.txt'
      #sensor.file = 'sensor_real.txt'
      expect(sensor.creading).to eq(-255)
      expect(sensor.freading).to eq(-255)
    end
  end

  context 'does not have a file to read' do
    it 'expects an error reading' do
      sensor = build(:ds18b20)
      sensor.file = 'bad file'
      expect(sensor.creading).to eq(-256)
      expect(sensor.freading).to eq(-256)
    end
  end

  context 'trailing / is not included for the path' do
    it 'should not be valid' do
      sensor = build(:ds18b20)
      sensor.path.chop!

      expect(sensor).not_to be_valid
    end
  end
end
