class CreateVatLieus < ActiveRecord::Migration[5.2]
  def change
    create_table :vat_lieus do |t|
      t.string :ten
      t.string :loai
      t.string :note

      t.timestamps
    end
  end
end
