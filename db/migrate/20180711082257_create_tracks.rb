class CreateTracks < ActiveRecord::Migration
  def change
    create_table :tracks do |t|
      t.string :track
      t.timestamps null: false
    end
  end
end
