class CreatePlayers < ActiveRecord::Migration[5.0]
  def change
    create_table :players do |t|
      t.string :name
      t.references :team, foreign_key: true
      t.integer :runs_count, default: 0

      t.timestamps
    end
  end
end
