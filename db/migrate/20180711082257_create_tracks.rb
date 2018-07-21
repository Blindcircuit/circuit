class CreateTracks < ActiveRecord::Migration
  def change
    create_table :tracks do |t|
      t.string :trackname
      t.timestamps null: false
    end
  end
end
