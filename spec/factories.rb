FactoryGirl.define do
  factory :ds18b20 do
    name "sensor1"
    path '/Users/jenkir14/src/sensor_manager/spec/files/'
    file 'sensor1.txt'
  end
end
