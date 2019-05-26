class CreateAssessments < ActiveRecord::Migration[5.2]
  def change
    enable_extension 'hstore'
    create_table :assessments, id: :uuid do |t|
      t.references :user, type: :uuid, foreign_key: true
      t.references :survey, type: :uuid, foreign_key: true
      t.hstore :answers, array: true, default: []

      t.timestamps
    end
  end
end
