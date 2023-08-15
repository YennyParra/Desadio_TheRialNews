class CreateNewcomments < ActiveRecord::Migration[7.0]
  def change
    create_table :newcomments do |t|
      t.text :body
      t.references :pc_user, null: false, foreign_key: true
      t.references :report, null: false, foreign_key: true

      t.timestamps
    end
  end
end
