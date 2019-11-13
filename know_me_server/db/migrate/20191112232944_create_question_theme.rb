class CreateQuestionTheme < ActiveRecord::Migration[5.2]
  def change
    create_table :question_themes do |t|
      t.string :name
    end
  end
end
