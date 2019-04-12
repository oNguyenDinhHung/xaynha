class CreateKhoanVays < ActiveRecord::Migration[5.2]
  def change
    create_table :khoan_vays do |t|
      t.string :nguoi_cho_vay
      t.string :nguoi_vay
      t.integer :so_tien_vay
      t.integer :tien_con_no
      t.string :note

      t.timestamps
    end
  end
end
