class CreatePetitions < ActiveRecord::Migration[5.1]
  def change
    create_table :petitions do |t|
      t.string :title
      t.text :body
      t.date :expiration_date
      t.integer :signature_count

      t.timestamps
    end
  end
end
