class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.string :name
      t.integer :mode, default: 0
      t.timestamps
    end
  end
end
