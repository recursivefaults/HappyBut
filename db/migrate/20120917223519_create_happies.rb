class CreateHappies < ActiveRecord::Migration
  def change
    create_table :happies do |t|

      t.timestamps
    end
  end
end
