class CreateQuestions < ActiveRecord::Migration[5.2]
  def change
    create_table :questions do |t|
        t.string :name
        t.integer :type
        t.reference :question_theme, index: true
    end
  end
end
