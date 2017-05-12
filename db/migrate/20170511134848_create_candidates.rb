class CreateCandidates < ActiveRecord::Migration[5.1]
  def change
    create_table :candidates do |t|
      t.string :name, null: false
      t.integer :votes, null: false, default: 0
      t.timestamps
    end
  end
end
