class CreateProfiles < ActiveRecord::Migration[6.0]
  def change
    create_table :profiles do |t|
      t.references :user, null: false, foreign_key: true
      t.string :nickname
      t.date :birthday
      t.string :gender

      t.timestamps
    end
  end
end
