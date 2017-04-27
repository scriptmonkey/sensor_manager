class Ds18b20 < ApplicationRecord

  validates :path, format: {
    with: /\/\z/,
    message: 'Path must end with a /'
  }
  validates :file, presence: true
  validates :path, presence: true
  validates :name, presence: true

  def creading
    if File.exist?(path + file)
      get_temp
    else
      return -256
    end
  end

  def freading
    if creading <= -250
      creading
    else
      ctemp=creading*1.8+32
    end
  end

  private

  def sensor_file_lines
    sensor_file = File.read(path + file).chomp
    sensor_file.lines
  end

  def line1
    sensor_file_lines[0]
  end

  def line2
    sensor_file_lines[1]
  end

  def valid_crc?
    if line1.include? 'YES'
      true
    else
      false
    end
  end

  def raw_temp
      line2.split('=')[1]
  end

  def get_temp
    if valid_crc?
      raw_temp.to_f/1000
    else
      return -255
    end
  end
end
