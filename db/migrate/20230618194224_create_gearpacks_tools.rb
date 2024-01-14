class CreateGearpacksTools < ActiveRecord::Migration[7.0]
  def change
    create_table :gearpacks_tools, :id => false do |t|
      t.integer :gearpack_id
      t.integer :tool_id
      t.integer :count, default: 1

      t.timestamps
    end
  end
end
