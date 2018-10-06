class CreateHangs < ActiveRecord::Migration[5.2]
  def change
    create_table :hangs do |t|
      t.references :hoa_don, foreign_key: true
      t.references :vat_lieu, foreign_key: true
      t.float :gia
      t.float :so_luong
      t.string :note

      t.timestamps
    end
  end
end
