class CreateGameRoom < ActiveRecord::Migration[5.2]
  def change
    create_table :game_rooms do |t|
      t.string :code, unique: true
      t.boolean :active, default: true
    end
  end
end
