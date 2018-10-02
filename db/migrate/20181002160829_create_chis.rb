class CreateChis < ActiveRecord::Migration[5.2]
  def change
    create_table :chis do |t|
      t.references :don_gia, foreign_key: true
      t.float :soluong
      t.date :ngay
      t.string :note

      t.timestamps
    end
  end
end
