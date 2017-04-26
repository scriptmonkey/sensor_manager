class Ds18b20 < ApplicationRecord

  validates :path, format: {
    with: /\/\z/,
    message: 'Path must end with a /'
  }
  def read_file
    if File.exist?(path + file)
      sensor = File.read(path + file).chomp
    else
      return -256
    end

    lines = sensor.lines
    if lines[0].include? 'YES'
      string_temp = lines[1].split('=')[1]
      string_temp.to_f/1000
    else
      return -255
    end

  end
  def creading
    read_file
  end

  def freading
    if creading <= -250
      creading 
    else
      ctemp=creading.to_f*1.8+32
      ctemp.to_s
    end
  end
end
