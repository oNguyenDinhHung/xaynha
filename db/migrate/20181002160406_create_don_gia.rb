class CreateDonGia < ActiveRecord::Migration[5.2]
  def change
    create_table :don_gia do |t|
      t.references :vat_lieu, foreign_key: true
      t.references :nha_cung_cap, foreign_key: true
      t.float :gia
      t.string :donvi
      t.string :note

      t.timestamps
    end
  end
end
