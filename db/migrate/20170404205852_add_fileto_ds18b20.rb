class AddFiletoDs18b20 < ActiveRecord::Migration[5.0]
  def change
    add_column :ds18b20s, :file, :string
  end
end
