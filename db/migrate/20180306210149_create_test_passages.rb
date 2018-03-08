class CreateTestPassages < ActiveRecord::Migration[5.1]
  def change
    create_table :test_passages do |t|
      t.references :user, foreign_key: true
      t.references :test, foreign_key: true
      t.integer :correct_answers, default: 0
      t.boolean :passed, default: false

      t.timestamps
    end
  end
end
