class CreateUserAnswers < ActiveRecord::Migration[5.2]
  def change
    create_table :user_answers do |t|
      t.string :name
      t.references :question, index: true
      t.timestamps
    end
  end
end
