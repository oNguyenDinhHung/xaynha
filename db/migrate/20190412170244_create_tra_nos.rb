class CreateTraNos < ActiveRecord::Migration[5.2]
  def change
    create_table :tra_nos do |t|
      t.references :khoan_vay, foreign_key: true
      t.integer :so_tien
      t.string :note

      t.timestamps
    end
  end
end
