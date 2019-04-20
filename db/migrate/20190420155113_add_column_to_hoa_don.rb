class AddColumnToHoaDon < ActiveRecord::Migration[5.2]
  def change
    add_column :hoa_dons, :bot, :float
  end
end
