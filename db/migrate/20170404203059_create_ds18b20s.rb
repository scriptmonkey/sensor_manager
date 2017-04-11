class CreateDs18b20s < ActiveRecord::Migration[5.0]
  def change
    create_table :ds18b20s do |t|
      t.string :name

      t.timestamps
    end
  end
end
