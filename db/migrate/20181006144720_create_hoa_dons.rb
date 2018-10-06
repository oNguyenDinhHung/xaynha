class CreateHoaDons < ActiveRecord::Migration[5.2]
  def change
    create_table :hoa_dons do |t|
      t.datetime :thoi_gian
      t.references :nha_cung_cap, foreign_key: true
      t.string :nguoi_ki
      t.float :tong_tien, default: 0.0
      t.float :thanh_toan, default: 0.0
      t.float :so_du, default: 0.0
      t.string :file
      t.string :note

      t.timestamps
    end
  end
end
