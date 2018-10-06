class CreateHoaDons < ActiveRecord::Migration[5.2]
  def change
    create_table :hoa_dons do |t|
      t.date :ngay
      t.references :nha_cung_cap, foreign_key: true
      t.string :nguoi_ki
      t.float :thanh_toan
      t.float :so_du
      t.string :file
      t.string :note

      t.timestamps
    end
  end
end
