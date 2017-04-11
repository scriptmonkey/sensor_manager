class AddPathtoDs18b20 < ActiveRecord::Migration[5.0]
  def change
    add_column :ds18b20s, :path, :string
  end
end
