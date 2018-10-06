class Hang < ApplicationRecord
  belongs_to :hoa_don
  belongs_to :vat_lieu
  SHOW_ATTRS = %w(id hoa_don_id vat_lieu_id vat_lieu_ten gia soluong note)
  validates :hoa_don_id, presence: { message: 'Hóa đơn không thể để trống' }
  validates :vat_lieu_id, presence: { message: 'Vật liệu không thể để trống' }
  validates_uniqueness_of :gia, scope: %i[vat_lieu_id hoa_don_id], message: 'Loại hàng với giá này đã tồn tại'
  delegate :ten, to: :vat_lieu, prefix: true

  def soluong
    "#{so_luong} #{vat_lieu.donvi if so_luong}"
  end
end
