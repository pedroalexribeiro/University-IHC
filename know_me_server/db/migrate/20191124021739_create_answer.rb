class CreateAnswer < ActiveRecord::Migration[5.2]
  def change
    create_table :answers do |t|
      t.string :name
      t.string :color
      t.references :question_theme, index: true
    end
  end
end
