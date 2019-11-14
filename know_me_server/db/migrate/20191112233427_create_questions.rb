class CreateQuestions < ActiveRecord::Migration[5.2]
  def change
    create_table :questions do |t|
      t.string :name
      t.integer :question_type
      t.references :question_theme, index: true
    end
  end
end
