class Hang < ApplicationRecord
  belongs_to :hoa_don
  belongs_to :vat_lieu
  SHOW_ATTRS = %w(id hoa_don_id vat_lieu_id tenvatlieu gia soluong thanh_tien note)
  validates :hoa_don_id, presence: { message: 'Hóa đơn không thể để trống' }
  validates :vat_lieu_id, presence: { message: 'Vật liệu không thể để trống' }
  validates_uniqueness_of :gia, scope: %i[vat_lieu_id hoa_don_id], message: 'Loại hàng với giá này đã tồn tại'
  delegate :ten, to: :vat_lieu, prefix: true
  before_save :tinh_thanh_tien
  after_save :cap_nhat_hoa_don
  before_destroy :cap_nhat_hoa_don

  def soluong
    "#{so_luong} #{vat_lieu.donvi if so_luong}"
  end

  def tinh_thanh_tien
    self.thanh_tien = gia * so_luong
  end

  def cap_nhat_hoa_don
    hoa_don = self.hoa_don
    hoa_don.tinh_tong_tien
    hoa_don.save
  end

  def tenvatlieu
    "#{vat_lieu_ten} #{vat_lieu.loai}"
  end
end
