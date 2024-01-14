class CreateTools < ActiveRecord::Migration[7.0]
  def change
    create_table :tools do |t|
      t.string :name
      t.string :tool_type, default: 'artisan'
      t.integer :cost_cp, default: 0
      t.integer :weight, default: 0

      t.timestamps
    end
  end
end
