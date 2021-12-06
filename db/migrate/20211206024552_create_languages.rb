class CreateLanguages < ActiveRecord::Migration[6.1]
  def change
    create_table :languages do |t|
      t.string :title
      t.integer :percent_used

      t.timestamps
    end
  end
end
