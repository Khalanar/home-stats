class CreateTemperatures < ActiveRecord::Migration[8.0]
  def change
    create_table :temperatures do |t|
      t.float :value

      t.timestamps
    end
  end
end
