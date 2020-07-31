class CreateStyles < ActiveRecord::Migration[6.0]
  def change
    create_table :styles do |t|
      t.string :name
      t.boolean :speciality
      t.references :teacher, null: false, foreign_key: true

      t.timestamps
    end
  end
end
