class FillQuestions < ActiveRecord::Migration[5.2]
  def up
    question_theme = QuestionTheme.create(name: 'default')
    question_theme.questions.create(question_type: :general, name: 'Who\'s most likely to laugh at a teachers lame joke?')
    question_theme.questions.create(question_type: :general, name: 'Who would throw a rubber, hit the teacher and blame another person?')
    question_theme.questions.create(question_type: :general, name: 'Who\' most likely to be the teacher\'s pet?')
    question_theme.questions.create(question_type: :general, name: 'Who has cheated during exams the most?')
  end

  def down
    Answer.destroy_all
    Question.destroy_all
    QuestionType.destroy_all
  end
end
