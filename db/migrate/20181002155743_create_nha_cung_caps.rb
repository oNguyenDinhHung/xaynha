class CreateNhaCungCaps < ActiveRecord::Migration[5.2]
  def change
    create_table :nha_cung_caps do |t|
      t.string :ten
      t.string :sodienthoai
      t.string :note

      t.timestamps
    end
  end
end
