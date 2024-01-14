class CreateGearpacks < ActiveRecord::Migration[7.0]
  def change
    create_table :gearpacks do |t|
      t.string :name
      t.integer :cost_cp, default: 0

      t.timestamps
    end
  end
end
