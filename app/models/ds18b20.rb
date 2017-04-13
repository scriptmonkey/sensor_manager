class Ds18b20 < ApplicationRecord

  def creading
    File.read(path + file).chomp
  end

  def freading
    ctemp=creading.to_i*1.8+32
    ctemp.to_i.to_s
  end
end
