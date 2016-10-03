class CreateResults < ActiveRecord::Migration[5.0]
  def change
    create_table :results do |t|
      t.references :lesson, index: true, foreign_key: true
      t.references :word, index: true, foreign_key: true
      t.references :answer, index: true, foreign_key: true
      t.boolean :is_correct, default: false
      
      t.timestamps
    end
  end
end
