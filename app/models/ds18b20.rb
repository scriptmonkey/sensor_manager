class Ds18b20 < ApplicationRecord

  validates :path, format: {
    with: /\/\z/,
    message: 'Path must end with a /'
  }
  def creading
    if File.exist?(path + file)
      File.read(path + file).chomp
    else
      '-256'
    end
  end

  def freading
    if creading.to_i <= -250
      '-256'
    else
      ctemp=creading.to_i*1.8+32
      ctemp.to_i.to_s
    end
  end
end
