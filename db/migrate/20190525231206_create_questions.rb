class CreateQuestions < ActiveRecord::Migration[5.2]
  def change
    create_table :questions, id: :uuid do |t|
      t.string :body
      t.references :survey, type: :uuid, foreign_key: true

      t.timestamps
    end
  end
end
