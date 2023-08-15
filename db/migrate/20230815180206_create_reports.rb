class CreateReports < ActiveRecord::Migration[7.0]
  def change
    create_table :reports do |t|
      t.string :title
      t.string :description
      t.references :pc_user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
